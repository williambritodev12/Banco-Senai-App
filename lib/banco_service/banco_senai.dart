// lib/banco_senai.dart

import 'package:ui_senai_bank/backend/usuario.dart';
import 'package:ui_senai_bank/backend/conta.dart';

// As listas globais agora ficam aqui, mas em um aplicativo grande,
// seria melhor usar um gerenciador de estado (Provider, Riverpod, etc.)
List<Usuario> usuarios = [
  Usuario('admin', 'admin123', 'admin'),
  // Adicione outros usuários aqui se necessário
];
List<Conta> contas = [];

Usuario? buscarUsuario(String username, String senha) {
  // A lógica de busca continua a mesma
  try {
    return usuarios.firstWhere(
      (user) => user.username == username && user.senha == senha,
    );
  } catch (e) {
    return null;
  }
}

void cadastrarUsuario(String username, String senha) {
  // Lógica de cadastro sem a entrada do console
  if (usuarios.any((user) => user.username == username)) {
    throw Exception('Nome de usuário já existe.');
  }

  Usuario novoUsuario = Usuario(username, senha, 'cliente');
  usuarios.add(novoUsuario);
}
