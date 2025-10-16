# 🎉 CarnavalApp

Aplicación Flutter para el Carnaval de Negros y Blancos de Pasto, Colombia.

## 📋 Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Configuración de Firebase](#configuración-de-firebase)
- [Ejecutar la Aplicación](#ejecutar-la-aplicación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Tests](#tests)
- [Funcionalidades](#funcionalidades)

---

## 📱 Requisitos

### Software Necesario

- **Flutter SDK**: 3.35+ (incluye Dart SDK 3.9+)
- **Android Studio** o **VS Code** con extensiones de Flutter/Dart
- **Git** para clonar el repositorio
- **Cuenta de Firebase** (gratis)

### Dispositivos Compatibles

- ✅ Android 5.0 (API 21) o superior
- ✅ iOS 12.0 o superior
- ✅ Windows 10/11 (Desktop)
- ✅ Web (Chrome, Edge, Safari)

### Verificar Instalación de Flutter

```powershell
flutter doctor
```

Deberías ver algo como:
```
[√] Flutter (Channel stable, 3.35.4)
[√] Android toolchain - develop for Android devices
[√] Visual Studio - develop Windows apps
[√] VS Code
```

---

## 🚀 Instalación

### 1. Clonar el Repositorio

```powershell
git clone https://github.com/Danieltwelve/CarnavalApp.git
cd CarnavalApp
```

### 2. Instalar Dependencias

```powershell
flutter pub get
```

Esto instalará:
- `firebase_core`: SDK principal de Firebase
- `firebase_auth`: Autenticación con Firebase
- `provider`: Gestión de estado
- Y otras dependencias del proyecto

---

## 🔥 Configuración de Firebase

### Paso 1: Crear Proyecto en Firebase

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Click en "Agregar proyecto"
3. Nombre: `flutterfire-carnaval` (o el que prefieras)
4. Desactiva Google Analytics (opcional)
5. Click "Crear proyecto"

### Paso 2: Habilitar Authentication

1. En Firebase Console, ve a **Authentication**
2. Click "Comenzar"
3. Pestaña **Sign-in method**
4. Click en "Correo electrónico/contraseña"
5. **Habilitar** el primer switch
6. Guardar

### Paso 3: Configurar FlutterFire CLI

#### Instalar FlutterFire CLI

```powershell
dart pub global activate flutterfire_cli
```

#### Agregar al PATH (si no está)

**Opción 1: Temporal (solo esta sesión)**
```powershell
$env:Path += ";C:\Users\jesus\AppData\Local\Pub\Cache\bin"
```

**Opción 2: Permanente**
1. Buscar "Variables de entorno" en Windows
2. Editar PATH de usuario
3. Agregar: `C:\Users\jesus\AppData\Local\Pub\Cache\bin`
4. Reiniciar terminal/VS Code

#### Configurar Firebase en el Proyecto

```powershell
# Asegúrate de estar en la carpeta del proyecto
cd CarnavalApp

# Ejecutar configuración
flutterfire configure --project=flutterfire-carnaval
```

Esto generará automáticamente:
- `firebase_options.dart`
- Archivos de configuración para Android/iOS/Web

**Selecciona las plataformas:**
- [x] android
- [x] ios
- [x] web
- [x] windows (opcional)

### Paso 4: Verificar Configuración

Revisa que existan estos archivos:
- ✅ `lib/firebase_options.dart`
- ✅ `android/app/google-services.json`
- ✅ `ios/Runner/GoogleService-Info.plist`

---

## ▶️ Ejecutar la Aplicación

### Opción 1: Dispositivo Android (Recomendado)

#### Conectar Dispositivo Físico

1. **Habilitar Depuración USB** en tu Android:
   - Ajustes → Acerca del teléfono
   - Tap 7 veces en "Número de compilación"
   - Volver → Opciones de desarrollador
   - Activar "Depuración USB"

2. **Conectar por USB** y autorizar el equipo

3. **Verificar conexión**:
```powershell
flutter devices
```

Deberías ver tu dispositivo listado.

4. **Ejecutar**:
```powershell
flutter run
```

#### Usar Emulador Android

1. Abrir **Android Studio**
2. **Device Manager** → Create Device
3. Seleccionar modelo (ej: Pixel 6)
4. Descargar imagen del sistema (API 34 recomendado)
5. Iniciar emulador

6. **Ejecutar**:
```powershell
flutter run
```

### Opción 2: Windows Desktop

```powershell
flutter run -d windows
```

### Opción 3: Web (Chrome)

```powershell
flutter run -d chrome
```

### Opción 4: Modo Release (Optimizado)

```powershell
# Android
flutter run --release

# Windows
flutter run -d windows --release
```

---

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                              # Punto de entrada
├── firebase_options.dart                  # Config de Firebase (auto-generado)
│
├── widgets/
│   └── auth_wrapper.dart                 # Maneja persistencia de sesión
│
└── features/
    └── auth/                             # Módulo de Autenticación
        ├── domain/
        │   └── auth_repository.dart      # Interfaz/Contrato
        │
        ├── infrastructure/
        │   ├── firebase_auth_repository.dart  # Implementación Firebase
        │   └── fake_auth_repository.dart      # Para tests (NO ELIMINAR)
        │
        ├── application/
        │   ├── login_controller.dart     # Lógica de Login
        │   └── register_controller.dart  # Lógica de Registro
        │
        └── presentation/
            └── pages/
                ├── home_page.dart        # Pantalla Principal
                ├── login_page.dart       # Pantalla de Login
                └── register_page.dart    # Pantalla de Registro
```

### Arquitectura: Clean Architecture

- **domain**: Reglas de negocio (QUÉ hace la app)
- **infrastructure**: Implementaciones técnicas (CÓMO lo hace)
- **application**: Coordinación y lógica (Controladores)
- **presentation**: Interfaz de usuario (Lo que ve el usuario)

---

---

## ✨ Funcionalidades

### ✅ Implementadas

- [x] **Autenticación con Firebase**
  - Registro de usuarios con email/password
  - Inicio de sesión
  - Cierre de sesión
  - Persistencia de sesión (auto-login)

- [x] **Validación de Formularios**
  - Email válido
  - Contraseña mínimo 6 caracteres
  - Confirmación de contraseña

- [x] **Manejo de Errores**
  - Mensajes en español
  - Feedback visual (SnackBars)
  - Estados de carga

- [x] **UI/UX**
  - Material Design 3
  - Pantalla de bienvenida
  - Pantalla principal con perfil
  - Diálogos de confirmación

### 🚧 En Desarrollo

- [ ] Perfil de usuario editable
- [ ] Eventos del carnaval
- [ ] Mapa de ubicaciones
- [ ] Galería de fotos
- [ ] Notificaciones push

---

## 🎯 Guía de Uso

### Primera Vez

1. **Ejecutar la app**: `flutter run`
2. La app abre en **WelcomePage**
3. Tap **"Crear cuenta"**
4. Llenar formulario:
   - Email: `tucorreo@gmail.com`
   - Password: `123456` (mínimo 6 caracteres)
   - Confirmar password: `123456`
5. Tap **"Crear cuenta"**
6. Mensaje: "¡Cuenta creada exitosamente!"
7. Automáticamente regresa al login

### Iniciar Sesión

8. Tap **"Iniciar sesión"**
9. Ingresar credenciales
10. Tap **"Entrar"**
11. Navega automáticamente a **HomePage**
12. Verás tu email en pantalla

### Cerrar Sesión

13. En HomePage, tap ícono de **logout** (arriba derecha)
14. Confirmar en el diálogo
15. Vuelve automáticamente a **WelcomePage**

### Persistencia de Sesión

16. Cierra completamente la app
17. Vuelve a abrir
18. ✨ Seguirás en HomePage (sesión persistente)

---

## 🐛 Solución de Problemas

### Error: "Firebase not initialized"

**Solución**: Verifica que `firebase_options.dart` existe y ejecuta:
```powershell
flutterfire configure --project=flutterfire-carnaval
```

### Error: "cmdline-tools component is missing"

**Solución**: Abre Android Studio → Settings → Android SDK → SDK Tools
- ✅ Android SDK Command-line Tools

### Error: "flutterfire: command not found"

**Solución**: Agrega al PATH:
```powershell
$env:Path += ";C:\Users\jesus\AppData\Local\Pub\Cache\bin"
```

### Error: "Unable to find bundled Java version"

**Solución**: Instala/actualiza Android Studio o configura JAVA_HOME

### La app no compila después de cambios

**Solución**:
```powershell
flutter clean
flutter pub get
flutter run
```

---

## 📚 Documentación Adicional

- [AUTHENTICATION_DOCS.md](AUTHENTICATION_DOCS.md) - Documentación completa de autenticación
- [Flutter Docs](https://docs.flutter.dev/)
- [Firebase Docs](https://firebase.google.com/docs)
- [Provider Package](https://pub.dev/packages/provider)

---

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama: `git checkout -b feature/nueva-funcionalidad`
3. Commit: `git commit -m 'Agregar nueva funcionalidad'`
4. Push: `git push origin feature/nueva-funcionalidad`
5. Abre un Pull Request

---

## 📄 Licencia

Este proyecto está bajo licencia MIT - ver archivo [LICENSE](LICENSE) para detalles.

---

## 👨‍💻 Autor

**Danieltwelve** - [GitHub](https://github.com/Danieltwelve)

---

## 🎊 Sobre el Carnaval de Negros y Blancos

El Carnaval de Negros y Blancos es la fiesta más grande e importante del sur de Colombia. Se celebra en San Juan de Pasto del 2 al 7 de enero de cada año. Es Patrimonio Cultural Inmaterial de la Humanidad según la UNESCO.

**¡Viva el Carnaval!** 🎭🎨🎉
