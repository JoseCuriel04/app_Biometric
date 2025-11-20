import 'package:biometric/local_auth.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'register_screen.dart';
import 'user_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String? _selectedUser;
  List<String> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final users = await UserManager.getUsernames();
    setState(() {
      _users = users;
    });
  }

  Future<void> _login() async {
    if (_userController.text.isEmpty || _passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario y contraseña son obligatorios')),
      );
      return;
    }

    final userExists = await UserManager.userExists(_userController.text);
    if (!userExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario no registrado')),
      );
      return;
    }

    final isValid = await UserManager.validateUser(
      _userController.text,
      _passController.text,
    );
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(username: _userController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contraseña incorrecta')),
      );
    }
  }

  void _authenticateWithBiometrics() async {
    if (_selectedUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un usuario antes de autenticarte')),
      );
      return;
    }

    final authen = await LocalAuth.authenticate();
    if (authen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(username: _selectedUser!),
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text('Iniciar Sesión'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('O'),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  hint: const Text("Selecciona tu usuario"),
                  value: _selectedUser,
                  items: _users.map((String user) {
                    return DropdownMenuItem<String>(
                      value: user,
                      child: Text(user),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedUser = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ElevatedButton(
                    onPressed: _authenticateWithBiometrics,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
