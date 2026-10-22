import 'dart:io';

import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import '../data/database.dart';
import '../utils/format.dart';

class ExportService {
  Future<void> shareCsv({
    required Project project,
    required DateTime start,
    required DateTime end,
    required List<TimeEntry> entries,
  }) async {
    final rows = <List<dynamic>>[
      ['Fecha', 'Concepto', 'Minutos', 'Horas', 'Importe MXN', 'Notas'],
      ...entries.map((e) {
        final amount = amountFromMinutes(e.durationMinutes, project.hourlyRate);
        return [
          formatDateShort(e.date),
          e.concept,
          e.durationMinutes,
          formatHoursDecimal(e.durationMinutes),
          amount.toStringAsFixed(2),
          e.notes ?? '',
        ];
      }),
    ];
    final totalMin =
        entries.fold<int>(0, (s, e) => s + e.durationMinutes);
    final totalAmount = amountFromMinutes(totalMin, project.hourlyRate);
    rows.add([]);
    rows.add([
      'TOTAL',
      '',
      totalMin,
      formatHoursDecimal(totalMin),
      totalAmount.toStringAsFixed(2),
      '',
    ]);

    final csv = const ListToCsvConverter().convert(rows);
    final file = await _writeTemp(
      _fileName(project.name, start, end, 'csv'),
      csv,
    );
    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'text/csv')],
      subject: 'Reporte ${project.name}',
      text: 'Reporte de horas ${project.name}',
    );
  }

  Future<void> sharePdf({
    required Project project,
    required DateTime start,
    required DateTime end,
    required List<TimeEntry> entries,
  }) async {
    final totalMin =
        entries.fold<int>(0, (s, e) => s + e.durationMinutes);
    final totalAmount = amountFromMinutes(totalMin, project.hourlyRate);

    final byConcept = <String, int>{};
    for (final e in entries) {
      byConcept[e.concept] = (byConcept[e.concept] ?? 0) + e.durationMinutes;
    }

    final doc = pw.Document();
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(40),
        build: (ctx) => [
          pw.Text(
            project.name,
            style: pw.TextStyle(
              fontSize: 22,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 6),
          pw.Text(
            'Periodo: ${formatDateShort(start)} — ${formatDateShort(end)}',
            style: const pw.TextStyle(fontSize: 11, color: PdfColors.grey700),
          ),
          pw.Text(
            'Tarifa: ${formatMxn(project.hourlyRate)} / h · Generado: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
            style: const pw.TextStyle(fontSize: 11, color: PdfColors.grey700),
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              _kpi('Horas', formatHours(totalMin)),
              _kpi('Importe', formatMxn(totalAmount)),
              _kpi('Entradas', '${entries.length}'),
            ],
          ),
          pw.SizedBox(height: 24),
          pw.Text(
            'Entradas',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          pw.TableHelper.fromTextArray(
            headers: ['Fecha', 'Concepto', 'Duración', 'Importe'],
            data: entries
                .map((e) => [
                      formatDateShort(e.date),
                      e.concept,
                      formatHours(e.durationMinutes),
                      formatMxn(
                        amountFromMinutes(e.durationMinutes, project.hourlyRate),
                      ),
                    ])
                .toList(),
            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
              fontSize: 10,
            ),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.teal800),
            cellStyle: const pw.TextStyle(fontSize: 9),
            cellAlignment: pw.Alignment.centerLeft,
          ),
          pw.SizedBox(height: 24),
          pw.Text(
            'Desglose por concepto',
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 8),
          ...byConcept.entries.map(
            (e) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 4),
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(e.key, style: const pw.TextStyle(fontSize: 10)),
                  pw.Text(
                    '${formatHours(e.value)} · ${formatMxn(amountFromMinutes(e.value, project.hourlyRate))}',
                    style: const pw.TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final bytes = await doc.save();
    final dir = await getTemporaryDirectory();
    final file = File(p.join(dir.path, _fileName(project.name, start, end, 'pdf')));
    await file.writeAsBytes(bytes);
    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'application/pdf')],
      subject: 'Reporte ${project.name}',
      text: 'Reporte de horas ${project.name}',
    );
  }

  pw.Widget _kpi(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label,
            style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
        pw.Text(value,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  Future<File> _writeTemp(String name, String content) async {
    final dir = await getTemporaryDirectory();
    final file = File(p.join(dir.path, name));
    await file.writeAsString(content);
    return file;
  }

  String _fileName(String project, DateTime start, DateTime end, String ext) {
    final slug = project
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    final a = DateFormat('yyyy-MM-dd').format(start);
    final b = DateFormat('yyyy-MM-dd').format(end);
    return '${slug}_${a}_a_$b.$ext';
  }
}
