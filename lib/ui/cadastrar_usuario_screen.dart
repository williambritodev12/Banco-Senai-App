// lib/ui/cadastrar_usuario_screen.dart

import 'package:flutter/material.dart';
import 'package:ui_senai_bank/banco_service/banco_senai.dart';
import 'package:ui_senai_bank/banco_service/banco_service.dart';

class CadastrarUsuarioScreen extends StatefulWidget {
  const CadastrarUsuarioScreen({super.key});

  @override
  State<CadastrarUsuarioScreen> createState() => _CadastrarUsuarioScreenState();
}

class _CadastrarUsuarioScreenState extends State<CadastrarUsuarioScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = '';

  void _handleCadastro() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final BancoService bancoService = BancoService(contas, usuarios);

    try {
      bancoService.cadastrarUsuario(username, password);
      setState(() {
        _message = 'Usuário cadastrado com sucesso!';
      });
      // Atraso para que o usuário possa ler a mensagem antes de voltar
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context); // Volta para a tela de login
      });
    } catch (e) {
      setState(() {
        _message = 'Erro: ${e.toString().replaceAll('Exception: ', '')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Novo Usuário"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Nome de Usuário"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Senha"),
            ),
            const SizedBox(height: 20),
            if (_message.isNotEmpty)
              Text(
                _message,
                style: TextStyle(
                  color: _message.contains("sucesso")
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleCadastro,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color.fromARGB(255, 2, 109, 231),
              ),
              child: const Text(
                "Cadastrar",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
