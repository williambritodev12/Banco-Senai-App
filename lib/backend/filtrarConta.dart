import 'dart:io';
import 'package:banco_senai/conta.dart';

/// Filtra contas pelo nome do titular e retorna uma lista de contas.
List<Conta> filtrarContasPorTitular(List<Conta> contas) {
  stdout.write("Digite o nome do titular da conta: ");
  String filtrarTitular = stdin.readLineSync()!;

  List<Conta> contasEncontradas = contas
      .where(
        (conta) => conta.titular.toLowerCase() == filtrarTitular.toLowerCase(),
      )
      .toList();

  if (contasEncontradas.isEmpty) {
    print("Nenhuma conta do titular '$filtrarTitular' foi encontrada.");
  }

  return contasEncontradas;
}
