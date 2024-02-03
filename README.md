# flutter_como_un_pro

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Integración Firebase

### Configuración de proyecto

1. Acceder a [Firebase](https://firebase.google.com/?hl=es-419 "Firebase")
1. Configurar Proyecto
1. Configurar Firestore
1. Configurar Auth y agregar metodo de inicio "email y password"

[Documentación Oficial](http://https://firebase.google.com/docs/flutter/setup?hl=es-419&platform=android "Documentación Oficial")

### Instalación de CLI Firebase y FlutterFire

Si no tienes instalado Firebase, puede usar:

```
npm install -g firebase-tools
```

Instalar FlutterFire

```
dart pub global activate flutterfire_cli
```

Iniciar sesión en Firebase con:

```
firebase login
```

### Configura tu APP con Firebase

Inicializar proyecto de firebase, lo puedes incluir en la raiz del proyecto flutter o tener un proyecto a parte.
Cuando se le solicite seleccionar funciones, seleccione "Firestore" y "Emuladores".

```
firebase init
```

##### Iniciar el Emulador

```
firebase emulators:start
```

Si deseas guardar la información que trabajas localmente puede iniciar el emulador con lo siguiente:

```
firebase emulators:start --import=./saved-data --export-on-exit
```

Agregar `--export-on-exit=export_directory` Indica a los emuladores que exporten datos a un directorio cuando se produzca el cierre

Agregar `--import=import_directory` Importa los datos guardados con la opción de inicio `--export-on-exit`

Si se usa `--import `, la ruta de exportación predeterminada es la misma. Por ejemplo:

```
firebase emulators:start --import=./data-path --export-on-exit
```

##### Firebase en tu aplicación

A continuación, puedes usar FlutterFire para generar el código Dart necesario para usar Firebase en tu aplicación Flutter

```
flutterfire configure
```

##### Agregar paquetes

Agregar los paquetes de Firebase relevantes a su proyecto Flutter

```
flutter pub add firebase_core firebase_auth cloud_firestore google_sign_in firebase_messaging
```

Hasta ahora, la aplicación Flutter y su proyecto Firebase están configurados para poder usar los emuladores, pero aún necesita indicarle al código Flutter que redirija las solicitudes salientes de Firebase a los puertos locales.

Primero, agregue el código de inicialización de Firebase y el código de configuración del emulador a la función main en main.dart.

```dart
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

 if (kDebugMode) {
   try {
     FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
     await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
   } catch (e) {
     // ignore: avoid_print
     print(e);
   }
 }

 runApp(MyApp());
}
```

## Errores

### App requires Multidex support

"App requires Multidex support" es un mensaje que indica que una aplicación Android ha crecido lo suficiente en tamaño, generalmente debido a la inclusión de múltiples bibliotecas y dependencias, que el sistema de compilación estándar de Android (Dex) no puede manejar el número de métodos (funciones o funciones) en un solo archivo Dex.

Cuando se enfrenta a este problema, se necesita [habilitar el soporte Multidex](https://firebase.flutter.dev/docs/manual-installation/android/#enabling-multidex "Habilitar el soporte Multidex") para la aplicación. Multidex permite dividir la aplicación en varios archivos Dex, lo que permite superar el límite de métodos o también puede subir `minSdkVersion` a API 23.

### Error: Cleartext HTTP traffic to 10.0.2.2 not permitted

El error "Error: Cleartext HTTP traffic to 10.0.2.2 not permitted" se refiere a un problema relacionado con las conexiones HTTP no seguras (sin cifrado SSL/TLS) desde una aplicación Android. Este error suele ocurrir cuando intentas realizar una solicitud HTTP a la dirección IP 10.0.2.2 desde tu aplicación Android.

La dirección IP 10.0.2.2 se utiliza comúnmente en el entorno de desarrollo de Android emulado para representar la interfaz de red del host de desarrollo. En otras palabras, cuando estás ejecutando una aplicación en un emulador Android, 10.0.2.2 se traduce al localhost (127.0.0.1) de tu máquina de desarrollo.

Para solucionar este problema, puedes tomar una de las siguientes acciones:

Usar HTTPS: Se recomienda encarecidamente utilizar conexiones seguras (HTTPS) en lugar de conexiones no seguras (HTTP) en tus aplicaciones. Si estás desarrollando localmente, puedes configurar un certificado SSL de desarrollo o utilizar un certificado autofirmado.
Permitir tráfico no cifrado (no seguro): Si es necesario permitir tráfico HTTP no cifrado durante el desarrollo, puedes modificar la configuración de seguridad de tu aplicación en el archivo `res/xml/network_security_config.xml` (o crear este archivo si no existe) y habilitar la comunicación cleartext para ciertas direcciones IP. Aquí hay un ejemplo:

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config cleartextTrafficPermitted="true">
        <domain includeSubdomains="true">10.0.2.2</domain>
    </domain-config>
</network-security-config>
```

Luego, en tu archivo AndroidManifest.xml, apunta a este archivo de configuración:

```xml
<application
    android:networkSecurityConfig="@xml/network_security_config"
    ...>
    ...
</application>
```

Ten en cuenta que permitir tráfico no cifrado es una solución temporal y no se recomienda para entornos de producción debido a las preocupaciones de seguridad. Siempre es preferible utilizar HTTPS para asegurar la comunicación entre tu aplicación y el servidor.

También puedes realizar la siguiente que se encuentra en la documentación de google [habilitar usesCleartextTraffic](https://firebase.flutter.dev/docs/manual-installation/android/#enabling-use-of-firebase-emulator-suite "Habilitar usesCleartextTraffic"), pero te recomiendo que solo la uses para desarrollo.
