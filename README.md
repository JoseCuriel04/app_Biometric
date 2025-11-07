# Autenticación Biométrica con Flutter

## Autor
**Jose Luis Curiel López**  
📧 **Correo:** joselcl04@gmail.com  
🌐 **GitHub:** [github.com/JoseCuriel04](https://github.com/JoseCuriel04)

---

## Descripción del Proyecto

Este proyecto implementa un sistema de **autenticación biométrica** en Flutter, utilizando el paquete oficial [`local_auth`](https://pub.dev/packages/local_auth).  
El objetivo es ofrecer una experiencia de inicio de sesión más **rápida, moderna y segura**, permitiendo que los usuarios accedan mediante **huella digital o reconocimiento facial**, sin necesidad de ingresar usuario o contraseña.

El enfoque principal es mejorar la **usabilidad** y **seguridad** de las aplicaciones móviles, integrando métodos de autenticación nativos disponibles tanto en **Android** como en **iOS**.

---

## Funcionalidades Principales

- 🔒 **Inicio de sesión biométrico:** permite autenticar al usuario usando huella dactilar o rostro.  
- ⚙️ **Detección automática:** el sistema identifica qué tipo de autenticación biométrica admite el dispositivo.  
- 🧩 **Integración sencilla:** puede añadirse a cualquier aplicación Flutter ya existente.  
- 🪄 **Experiencia de usuario fluida:** elimina la necesidad de recordar contraseñas.  
- 📱 **Compatibilidad:** soporta Android (Fingerprint / Face Unlock) y iOS (Touch ID / Face ID).

---

## Tecnologías Utilizadas

- **Lenguaje:** Dart  
- **Framework:** Flutter  
- **Paquete principal:** [`local_auth`](https://pub.dev/packages/local_auth)  
- **IDE recomendado:** Android Studio / VS Code

---

## Consideraciones

- Es necesario que el dispositivo tenga **hardware biométrico** disponible (sensor de huella o cámara compatible).  
- En Android, se requiere habilitar el uso de autenticación biométrica en el `AndroidManifest.xml`.  
- En iOS, deben configurarse permisos en el archivo `Info.plist`.

---

## Conclusión

Este desarrollo demuestra la integración de **autenticación biométrica** en Flutter como una alternativa moderna a los sistemas tradicionales de usuario y contraseña.  
Su implementación mejora la seguridad y facilita la interacción del usuario con la aplicación, ofreciendo una experiencia confiable, rápida y sin fricción.

---

© 2025 - **Jose Luis Curiel López**
