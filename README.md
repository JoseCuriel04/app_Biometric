# Autenticación Biométrica con Flutter

## Autor

**Jose Luis Curiel López**\
📧 **Correo:** joselcl04@gmail.com\
🌐 **GitHub:**
[github.com/JoseCuriel04](https://github.com/JoseCuriel04)

------------------------------------------------------------------------

## Descripción del Proyecto

Este proyecto implementa un sistema de **autenticación biométrica** en
Flutter, utilizando el paquete oficial `local_auth`. También incluye un
sistema de **registro y validación de usuarios** mediante
`SharedPreferences` para almacenar credenciales de manera persistente.

El objetivo es ofrecer un inicio de sesión **rápido, seguro y moderno**,
permitiendo autenticación por **huella digital, reconocimiento facial o
usuario y contraseña**.

------------------------------------------------------------------------

## 🌟 Funcionalidades Principales

-   🔒 **Inicio de sesión biométrico** (huella digital / rostro).
-   📝 **Registro de usuarios** con almacenamiento persistente.
-   🔍 **Validación de credenciales**.
-   ⚠️ **Mensajes de error claros y amigables**.
-   🧩 **Fácil integración** en cualquier app Flutter.
-   📱 **Compatibilidad con Android e iOS**.

------------------------------------------------------------------------

## 📂 Estructura del Proyecto

    lib/
    ├── main.dart                  # Punto de entrada de la aplicación
    ├── home_screen.dart           # Pantalla de inicio de sesión
    ├── register_screen.dart       # Pantalla de registro
    ├── profile_screen.dart        # Pantalla del perfil del usuario
    ├── user_manager.dart          # Manejo de usuarios con SharedPreferences
    └── local_auth.dart            # Lógica de autenticación biométrica

------------------------------------------------------------------------

## 🛠️ Tecnologías Utilizadas

-   **Dart**
-   **Flutter**
-   **Paquetes:**
    -   local_auth
    -   shared_preferences
-   **IDE recomendado:** VS Code o Android Studio

------------------------------------------------------------------------

## 📱 Requisitos y Configuración

### Android

Agrega en `AndroidManifest.xml`:

``` xml
<uses-permission android:name="android.permission.USE_BIOMETRIC" />
<uses-permission android:name="android.permission.USE_FINGERPRINT" />
```

### iOS

Agrega en `Info.plist`:

``` xml
<key>NSFaceIDUsageDescription</key>
<string>Necesitamos tu rostro para autenticación</string>
```

------------------------------------------------------------------------

## 💡 Consideraciones

-   El dispositivo debe tener hardware biométrico disponible.
-   SharedPreferences **no cifra** los datos. Para mayor seguridad, usa
    `flutter_secure_storage`.
-   Este proyecto sirve como base para apps reales que requieran
    seguridad biométrica.

------------------------------------------------------------------------

## 🚀 Cómo Usar el Proyecto

### 1. Clonar el repositorio:

``` bash
git clone https://github.com/JoseCuriel04/app_Biometric.git
```

### 2. Instalar dependencias:

``` bash
flutter pub get
```

### 3. Ejecutar la app:

``` bash
flutter run
```

### 4. Probar funcionalidades:

-   Registrarse
-   Iniciar sesión con usuario/contraseña o biometría
-   Ver el perfil del usuario

------------------------------------------------------------------------

## 🎯 Conclusión

Este proyecto demuestra cómo integrar autenticación biométrica y
registro de usuarios en Flutter de forma sencilla y eficiente,
ofreciendo una experiencia moderna y segura.

------------------------------------------------------------------------

© 2025 - **Jose Luis Curiel López**
