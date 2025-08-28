import 'dart:io';
import 'package:banco_senai/conta.dart';
import 'package:banco_senai/contaCorrente.dart';
import 'package:banco_senai/pessoaFisica.dart';
import 'package:banco_senai/pessoaJuridica.dart';
import 'package:banco_senai/usuario.dart';

// Agora a função recebe também a lista de contas
void cadastrarUsuario(List<Usuario> usuarios, List<Conta> contas) {
  print("\n--- Cadastro de Novo Usuário ---");

  stdout.write("Insira seu nome completo: ");
  String novoTitular = stdin.readLineSync()!;

  stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
  String tipoPessoa = stdin.readLineSync()!.toUpperCase();
  while (tipoPessoa != 'PF' && tipoPessoa != 'PJ') {
    print("Opção inválida. Tente novamente.");
    stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
    tipoPessoa = stdin.readLineSync()!.toUpperCase();
  }

  String documento;
  if (tipoPessoa == 'PF') {
    stdout.write("Insira seu CPF: ");
    documento = stdin.readLineSync()!;
    // PessoaFisica(novoTitular, cpf);
  } else {
    stdout.write("Insira seu CNPJ: ");
    documento = stdin.readLineSync()!;
    // PessoaJuridica(novoTitular, cnpj);
  }

  String novoUsername;
  do {
    stdout.write("Crie um nome de usuário: ");
    novoUsername = stdin.readLineSync()!;
    if (usuarios.any((user) => user.username == novoUsername)) {
      print("Nome de usuário já existe. Por favor, escolha outro.");
    }
  } while (usuarios.any((user) => user.username == novoUsername));

  stdout.write("Crie uma senha: ");
  String novaSenha = stdin.readLineSync()!;

  Usuario novoUsuario = Usuario(novoUsername, novaSenha, 'cliente');
  usuarios.add(novoUsuario);

  // Cria uma nova Conta Corrente para o novo usuário
  ContaCorrente novaConta = ContaCorrente(novoTitular, 0.0);
  contas.add(novaConta);

  print("Usuário e Conta Corrente criados com sucesso!");
}
