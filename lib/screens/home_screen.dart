import 'package:biometric/local_auth.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Importa el nuevo archivo

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool auth = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _login() {
    if ((_userController.text == "luis" && _passController.text == "12345") ||
        (_userController.text == "ana" && _passController.text == "23456")) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(username: _userController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

  void _authenticateWithBiometrics() async {
    final authen = await LocalAuth.authenticate();
    if (authen) {
      // Si la autenticación biométrica es exitosa, navega al perfil
      // Aquí puedes definir un usuario por defecto o manejarlo como prefieras
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(username: "Usuario Biométrico"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Biométrica'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _passController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 20),
            const Text('O'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticateWithBiometrics,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blue,
              ),
              child: const Icon(
                Icons.fingerprint,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
