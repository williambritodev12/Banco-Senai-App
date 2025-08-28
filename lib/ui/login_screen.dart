// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             "assets/images/mulher_usando_o_banco.jpg",
//             color: const Color.fromARGB(68, 0, 0, 0),
//             colorBlendMode: BlendMode.darken,
//             fit: BoxFit.cover,
//             height: double.infinity,
//           ),
//           Padding(
//             padding: EdgeInsets.all(32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //Image.asset("assets/images/mulher_usando_o_banco.jpg"),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(padding: EdgeInsets.all(50)),
//                     Text(
//                       "Sistema de Gestão de Contas",
//                       style: TextStyle(fontSize: 32, color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         border: UnderlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         label: Text("E-mail"),
//                         labelStyle: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     Padding(padding: EdgeInsets.all(10)),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         border: UnderlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         label: Text("Senha: "),
//                         labelStyle: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size.fromHeight(50),
//                     backgroundColor: Color.fromARGB(255, 2, 109, 231),
//                   ),
//                   child: Text(
//                     "Login",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/login_screen.dart

// import 'package:flutter/material.dart';

// // Importe os arquivos do seu backend aqui
// import 'package:ui_senai_bank/banco_service/banco_senai.dart'; // Onde estão as listas e funções
// import 'package:ui_senai_bank/backend/usuario.dart'; // Onde está a classe Usuario
// import 'package:ui_senai_bank/backend/conta.dart'; // Onde está a lista de usuários e a função buscarUsuario
// import 'package:ui_senai_bank/ui/home_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // Controladores para capturar o texto dos campos
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   // Variável para exibir mensagens de erro
//   String _errorMessage = '';

//   // Função para lidar com o login
//   void _handleLogin() {
//     final String username = _usernameController.text;
//     final String password = _passwordController.text;

//     Usuario? usuarioLogado = buscarUsuario(username, password);

//     if (usuarioLogado != null) {
//       setState(() {
//         _errorMessage = '';
//       });
//       // Navega para a HomeScreen e passa o usuário logado como argumento
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(usuario: usuarioLogado),
//         ),
//       );
//     } else {
//       setState(() {
//         _errorMessage = 'Usuário ou senha incorretos. Tente novamente.';
//       });
//     }
//   }

//   // Função para lidar com o cadastro
//   void _handleCadastro() {
//     // Navega para a tela de cadastro
//     // Exemplo: Navigator.pushNamed(context, '/cadastro');
//     setState(() {
//       _errorMessage = 'Redirecionando para a tela de cadastro...';
//     });
//     // Você criaria uma nova tela para o cadastro
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             "assets/images/mulher_usando_o_banco.jpg",
//             color: const Color.fromARGB(68, 0, 0, 0),
//             colorBlendMode: BlendMode.darken,
//             fit: BoxFit.cover,
//             height: double.infinity,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(padding: EdgeInsets.all(50)),
//                     Text(
//                       "Sistema de Gestão de Contas",
//                       style: TextStyle(fontSize: 32, color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(5)),
//                     ),
//                     label: Text("Nome de usuário"),
//                     labelStyle: TextStyle(color: Colors.white),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(5)),
//                     ),
//                     label: Text("Senha: "),
//                     labelStyle: TextStyle(color: Colors.white),
//                   ),
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 const SizedBox(height: 25),
//                 // Exibe a mensagem de erro ou sucesso
//                 if (_errorMessage.isNotEmpty)
//                   Text(
//                     _errorMessage,
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: _handleLogin,
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                     backgroundColor: const Color.fromARGB(255, 2, 109, 231),
//                   ),
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: _handleCadastro,
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                     backgroundColor: const Color.fromARGB(255, 109, 109, 109),
//                   ),
//                   child: const Text(
//                     "Cadastrar-se",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/ui/login_screen.dart

import 'package:flutter/material.dart';
import 'package:ui_senai_bank/banco_service/banco_senai.dart'; // Importa as listas globais (usuarios, contas)
import 'package:ui_senai_bank/banco_service/banco_service.dart'; // Importa a classe BancoService
import 'package:ui_senai_bank/backend/usuario.dart';
import 'package:ui_senai_bank/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _handleLogin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Cria uma instância do BancoService para acessar suas funções
    final BancoService bancoService = BancoService(contas, usuarios);

    // Agora, o método buscarUsuario pode ser chamado a partir da instância
    Usuario? usuarioLogado = bancoService.buscarUsuario(username, password);

    if (usuarioLogado != null) {
      setState(() {
        _errorMessage = '';
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(usuario: usuarioLogado),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Usuário ou senha incorretos. Tente novamente.';
      });
    }
  }

  void _handleCadastro() {
    setState(() {
      _errorMessage = 'Redirecionando para a tela de cadastro...';
    });
    // Você navegaria para a tela de cadastro aqui
  }

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
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(padding: EdgeInsets.all(50)),
                    Text(
                      "Sistema de Gestão de Contas",
                      style: TextStyle(fontSize: 32, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    label: Text("Nome de usuário"),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    label: Text("Senha: "),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 25),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 2, 109, 231),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _handleCadastro,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 109, 109, 109),
                  ),
                  child: const Text(
                    "Cadastrar-se",
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
