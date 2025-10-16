# 🎉 Carnaval App - Documentación de Autenticación

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                          → Punto de entrada con Provider
├── firebase_options.dart              → Configuración de Firebase
│
├── widgets/
│   └── auth_wrapper.dart             → Maneja persistencia de sesión
│
└── features/
    └── auth/
        ├── domain/
        │   └── auth_repository.dart           → Interfaz (QUÉ hacer)
        │
        ├── infrastructure/
        │   ├── firebase_auth_repository.dart  → Implementación Firebase
        │   └── fake_auth_repository.dart      → Implementación para tests
        │
        ├── application/
        │   ├── login_controller.dart          → Lógica de login
        │   └── register_controller.dart       → Lógica de registro
        │
        └── presentation/
            └── pages/
                ├── home_page.dart             → Pantalla principal
                ├── login_page.dart            → Pantalla de login
                └── register_page.dart         → Pantalla de registro
```

## 🔄 Flujo de Autenticación

### 1. Al Abrir la App

```
main.dart
    ↓
AuthWrapper (escucha FirebaseAuth.authStateChanges())
    ↓
¿Hay sesión activa?
    ├─ SÍ  → HomePage
    └─ NO  → WelcomePage
```

### 2. Al Iniciar Sesión

```
Usuario ingresa email/password en LoginPage
    ↓
LoginController.submit()
    ↓
FirebaseAuthRepository.signIn()
    ↓
Firebase.signInWithEmailAndPassword()
    ↓
authStateChanges() emite nuevo User
    ↓
AuthWrapper detecta el cambio
    ↓
Navega automáticamente a HomePage
```

### 3. Al Cerrar Sesión

```
Usuario presiona "Cerrar sesión" en HomePage
    ↓
Diálogo de confirmación
    ↓
FirebaseAuth.signOut()
    ↓
authStateChanges() emite null
    ↓
AuthWrapper detecta el cambio
    ↓
Navega automáticamente a WelcomePage
```

## 🎯 Componentes Clave

### AuthWrapper
- **Propósito**: Maneja persistencia de sesión automática
- **Ubicación**: `lib/widgets/auth_wrapper.dart`
- **Funcionalidad**:
  - Escucha cambios en autenticación con `StreamBuilder`
  - Muestra `HomePage` si hay usuario autenticado
  - Muestra `WelcomePage` si no hay sesión
  - Muestra loading mientras verifica

### HomePage
- **Propósito**: Pantalla principal después de login
- **Ubicación**: `lib/features/auth/presentation/pages/home_page.dart`
- **Muestra**:
  - Correo electrónico del usuario
  - UID del usuario
  - Estado de verificación de email
  - Botón de cerrar sesión

### FirebaseAuthRepository
- **Propósito**: Implementación real de autenticación
- **Ubicación**: `lib/features/auth/infrastructure/firebase_auth_repository.dart`
- **Métodos**:
  - `signIn()`: Inicia sesión con email/password
  - `signUp()`: Registra nuevo usuario
  - `signOut()`: Cierra sesión
  - `_handleAuthException()`: Traduce errores a español

### Controllers (LoginController y RegisterController)
- **Propósito**: Manejo de estado UI
- **Funciones**:
  - `isLoading`: indica si está procesando
  - `error`: mensaje de error si hay
  - `submit()`: ejecuta la operación y actualiza estado
  - Extienden `ChangeNotifier` para notificar cambios

## 🔐 Seguridad

- ✅ Contraseñas ocultas con `obscureText: true`
- ✅ Validación de email con `@`
- ✅ Contraseña mínimo 6 caracteres (Firebase)
- ✅ Confirmación de contraseña en registro
- ✅ Manejo de errores traducidos
- ✅ Sesión persistente (Firebase)

## 🧪 Cómo Probar

### 1. Registrar un usuario
```
flutter run
→ Tap "Crear cuenta"
→ Email: test@test.com
→ Password: 123456
→ Confirmar: 123456
→ Tap "Crear cuenta"
```

### 2. Iniciar sesión
```
→ Tap "Iniciar sesión"
→ Email: test@test.com
→ Password: 123456
→ Tap "Entrar"
→ Deberías ver HomePage con tu email
```

### 3. Cerrar sesión
```
→ En HomePage, tap botón de logout
→ Confirmar
→ Deberías volver a WelcomePage
```

### 4. Persistencia
```
→ Inicia sesión
→ Cierra la app completamente
→ Vuelve a abrir la app
→ Deberías estar aún en HomePage (sesión persistente)
```

## 🚀 Próximos Pasos

A partir de aquí puedes construir:

1. **Perfil de Usuario**
   - Editar nombre
   - Cambiar foto
   - Actualizar información

2. **Funcionalidades del Carnaval**
   - Lista de eventos
   - Mapa de ubicaciones
   - Galería de fotos
   - Calendario

3. **Notificaciones**
   - Push notifications
   - Recordatorios de eventos

4. **Social**
   - Compartir en redes
   - Comentarios
   - Favoritos

## 📚 Conceptos Importantes

### Provider
- Inyección de dependencias
- Gestión de estado
- Acceso global a controllers

### StreamBuilder
- Escucha streams de datos
- Se reconstruye automáticamente
- Ideal para datos en tiempo real

### Firebase Auth
- Autenticación en la nube
- Sesiones seguras
- Múltiples métodos de auth

### Clean Architecture
- Separación de responsabilidades
- Fácil de testear
- Escalable y mantenible
