import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset("assets/images/mulher_usando_o_banco.jpg"),
            Padding(padding: EdgeInsets.all(50)),
            Text(
              "Sistema de Gestão de Contas",
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            TextFormField(decoration: InputDecoration(label: Text("E-mail"))),
            Padding(padding: EdgeInsets.all(10)),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(label: Text("Senha: ")),
            ),
            SizedBox(height: 25),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
