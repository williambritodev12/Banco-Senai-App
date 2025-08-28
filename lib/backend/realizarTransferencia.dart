import 'dart:io';
import 'package:banco_senai/conta.dart';
import 'package:banco_senai/filtrarConta.dart';

// Função auxiliar para permitir que o usuário selecione uma conta de uma lista
Conta? _selecionarConta(List<Conta> contasEncontradas) {
  if (contasEncontradas.isEmpty) {
    return null;
  }

  if (contasEncontradas.length == 1) {
    print("Conta selecionada: ${contasEncontradas.first.tipo}");
    return contasEncontradas.first;
  }

  print("Contas encontradas:");
  for (int i = 0; i < contasEncontradas.length; i++) {
    print(
      "${i + 1}. Titular: ${contasEncontradas[i].titular} (${contasEncontradas[i].tipo})",
    );
  }

  stdout.write("Selecione a conta (1 ou 2): ");
  String? escolha = stdin.readLineSync();
  int? index = int.tryParse(escolha!) ?? -1;

  if (index! > 0 && index <= contasEncontradas.length) {
    return contasEncontradas[index - 1];
  } else {
    print("Seleção inválida.");
    return null;
  }
}

// Função principal para realizar a transferência
void realizarTransferencia(List<Conta> contas) {
  print("\n--- TRANSFERÊNCIA ---");

  // Seleção da conta de ORIGEM
  print("Conta de ORIGEM:");
  List<Conta> contasOrigem = filtrarContasPorTitular(contas);
  if (contasOrigem.isEmpty) return;

  Conta? contaOrigem = _selecionarConta(contasOrigem);
  if (contaOrigem == null) return;

  // Seleção da conta de DESTINO
  print("\nConta de DESTINO:");
  List<Conta> contasDestino = filtrarContasPorTitular(contas);
  if (contasDestino.isEmpty) return;

  Conta? contaDestino = _selecionarConta(contasDestino);
  if (contaDestino == null) return;

  stdout.write("Digite o valor a ser transferido: ");
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > 0 && valor <= contaOrigem.saldo) {
    contaOrigem.saldo -= valor;
    contaDestino.saldo += valor;
    print(
      "\nTransferência realizada com sucesso no valor de R\$${valor.toStringAsFixed(2)}, da conta de ${contaOrigem.titular} para a conta de ${contaDestino.titular}!",
    );
    print(
      "Novo saldo de ${contaOrigem.titular} (${contaOrigem.tipo}): R\$${contaOrigem.saldo.toStringAsFixed(2)}",
    );
    print(
      "Novo saldo de ${contaDestino.titular} (${contaDestino.tipo}): R\$${contaDestino.saldo.toStringAsFixed(2)}",
    );
  } else {
    print("Saldo insuficiente ou valor inválido!");
  }
}
