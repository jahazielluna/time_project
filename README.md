# Time — horas freelance

App Android para registrar horas por proyecto, calcular importes en **MXN**, generar reportes (PDF/CSV) y cortes de cobro. Datos 100 % locales (SQLite / Drift).

## Requisitos

- Flutter **3.24+** (probado con 3.24.5)
- Android SDK (API 26+, compileSdk 35)
- JDK **17** (`JAVA_HOME` apuntando al JDK)

En esta Mac (ejemplo Temurin):

```bash
export JAVA_HOME="$HOME/development/jdk/jdk-17.0.20.1+1/Contents/Home"
export PATH="$HOME/development/flutter/bin:$JAVA_HOME/bin:$PATH"
```

## Cómo correr

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Generar APK (sideload)

```bash
flutter build apk --release
```

El APK queda en:

`build/app/outputs/flutter-apk/app-release.apk`

Cópialo al teléfono e instálalo (activar «instalar apps desconocidas» si hace falta).

## Qué incluye (MVP)

- Proyectos: CRUD, tarifa MXN/h, límite mensual de horas
- Entradas de tiempo (fecha, concepto, minutos/horas)
- Reporte con desglose por concepto + export PDF/CSV
- Cortes semanal / quincenal / mensual / rango custom (pagado/pendiente)
- Aviso local al acercarse al límite (umbral configurable, default 80 %)
- Ajustes: moneda MXN fija, umbral de notificación

## Fuera de alcance (por ahora)

- Google Drive (hay un TODO en Ajustes)
- iOS / Play Store

## Stack

Flutter · Drift (SQLite) · Riverpod · go_router
