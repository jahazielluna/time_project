import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Notificaciones locales para aviso de límite mensual de horas.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _ready = false;

  Future<void> init() async {
    if (_ready) return;
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(settings);
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    _ready = true;
  }

  Future<void> showLimitWarning({
    required String projectName,
    required double hoursUsed,
    required double hoursLimit,
    required int percent,
  }) async {
    await init();
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'hour_limits',
        'Límites de horas',
        channelDescription:
            'Avisos al acercarse al límite mensual de horas por proyecto',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
      ),
    );
    await _plugin.show(
      projectName.hashCode & 0x7fffffff,
      'Límite de horas',
      '$projectName: ${hoursUsed.toStringAsFixed(1)}h de ${hoursLimit.toStringAsFixed(0)}h ($percent%) — te acercas al límite',
      details,
    );
  }
}
