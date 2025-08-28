import 'dart:io';
import 'package:banco_senai/conta.dart';
import 'package:banco_senai/contaCorrente.dart';
import 'package:banco_senai/contaPoupanca.dart';
import 'package:banco_senai/menu.dart' as banco_senai show usuarios;
import 'package:banco_senai/pessoa.dart';
import 'package:banco_senai/pessoaFisica.dart';
import 'package:banco_senai/pessoaJuridica.dart';
import 'package:banco_senai/usuario.dart'; // Importa a lista de usuários do arquivo principal

void cadastrarConta(List<Conta> contas, List<Usuario> usuarios) {
  print("\n--- Cadastro de Nova Conta ---");

  stdout.write("Insira o nome do titular da conta: ");
  String novoTitular = stdin.readLineSync()!;

  stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
  String tipoPessoa = stdin.readLineSync()!.toUpperCase();
  while (tipoPessoa != 'PF' && tipoPessoa != 'PJ') {
    print("Opção inválida. Tente novamente.");
    stdout.write("É Pessoa Física (PF) ou Jurídica (PJ)? [PF/PJ]: ");
    tipoPessoa = stdin.readLineSync()!.toUpperCase();
  }

  // A partir daqui, as alterações são aplicadas
  Pessoa titular;
  String documento;

  if (tipoPessoa == 'PF') {
    stdout.write("Insira o CPF do titular: ");
    documento = stdin.readLineSync()!;
    // Cria uma instância de PessoaFisica
    titular = PessoaFisica(novoTitular, documento);
  } else {
    stdout.write("Insira o CNPJ do titular: ");
    documento = stdin.readLineSync()!;
    // Cria uma instância de PessoaJuridica
    titular = PessoaJuridica(novoTitular, documento);
  }

  // Validação: Verifica se o documento já existe
  bool documentoExiste = contas.any(
    (conta) => conta.titular.toLowerCase() == titular.nome.toLowerCase(),
  );
  if (documentoExiste) {
    print(
      "Já existe uma conta com este documento. Por favor, utilize um nome diferente.",
    );
    return;
  }

  String tipoConta;
  if (tipoPessoa == 'PJ') {
    print("Pessoa Jurídica só pode cadastrar Conta Corrente.");
    tipoConta = 'CC';
  } else {
    stdout.write(
      "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
    );
    tipoConta = stdin.readLineSync()!.toUpperCase();
    while (tipoConta != 'CC' && tipoConta != 'CP' && tipoConta != 'CC&CP') {
      print("Opção inválida. Tente novamente.");
      stdout.write(
        "Deseja Conta Corrente (CC), Poupança (CP) ou ambas (CC&CP)? [CC/CP/CC&CP]: ",
      );
      tipoConta = stdin.readLineSync()!.toUpperCase();
    }
  }

  if (tipoConta == 'CC') {
    ContaCorrente novaConta = ContaCorrente(titular.nome, 0.0);
    contas.add(novaConta);
    print("\nConta Corrente de ${titular.nome} cadastrada com sucesso!");
  } else if (tipoConta == 'CP') {
    ContaPoupanca novaConta = ContaPoupanca(titular.nome, 0.0);
    contas.add(novaConta);
    print("\nConta Poupança de ${titular.nome} cadastrada com sucesso!");
  } else if (tipoConta == 'CC&CP') {
    ContaCorrente novaContaCorrente = ContaCorrente(titular.nome, 0.0);
    ContaPoupanca novaContaPoupanca = ContaPoupanca(titular.nome, 0.0);
    contas.add(novaContaCorrente);
    contas.add(novaContaPoupanca);
    print(
      "\nContas (Corrente e Poupança) de ${titular.nome} cadastradas com sucesso!",
    );
  } else {
    print("\nErro ao cadastrar a conta. Operação cancelada.");
    return;
  }

  print("\n--- Criação de Usuário ---");
  stdout.write("Crie um nome de usuário para o titular: ");
  String novoUsername = stdin.readLineSync()!;
  stdout.write("Crie uma senha: ");
  String novaSenha = stdin.readLineSync()!;

  // Acessa a lista de usuários do arquivo principal
  banco_senai.usuarios.add(Usuario(novoUsername, novaSenha, 'cliente'));

  print("Usuário '${novoUsername}' com perfil de cliente criado com sucesso!");
}
