import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/mulher_usando_o_banco.jpg",
            color: const Color.fromARGB(68, 0, 0, 0),
            colorBlendMode: BlendMode.darken,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.asset("assets/images/mulher_usando_o_banco.jpg"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(padding: EdgeInsets.all(50)),
                    Text(
                      "Sistema de Gestão de Contas",
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text("E-mail")),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(label: Text("Senha: ")),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Color.fromARGB(255, 2, 109, 231),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
