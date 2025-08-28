// lib/ui/home_screen.dart

import 'package:flutter/material.dart';
import 'package:ui_senai_bank/backend/usuario.dart';
import 'package:ui_senai_bank/banco_service/banco_senai.dart';
import 'package:ui_senai_bank/ui/home_screen.dart';

class HomeScreen extends StatefulWidget {
  final Usuario usuario;

  const HomeScreen({super.key, required this.usuario});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SenaiBank - Bem-vindo(a), ${widget.usuario.username}"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Botão de deslogar
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Perfil: ${widget.usuario.role}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Selecione uma opção:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _buildMenuOptions(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuOptions() {
    List<Widget> options = [];

    // Lógica para mostrar opções com base no papel do usuário
    if (widget.usuario.role == 'admin') {
      options.add(_buildMenuItem("Cadastrar Conta", Icons.person_add));
      options.add(_buildMenuItem("Exibir Todas as Contas", Icons.list_alt));
    }

    options.add(_buildMenuItem("Realizar Transferência", Icons.swap_horiz));
    options.add(_buildMenuItem("Exibir Saldo", Icons.account_balance_wallet));
    options.add(_buildMenuItem("Sacar", Icons.money_off));
    options.add(_buildMenuItem("Depositar", Icons.attach_money));
    options.add(_buildMenuItem("Simular Rendimento", Icons.trending_up));

    return options;
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Funcionalidade: $title")));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueAccent),
            SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
