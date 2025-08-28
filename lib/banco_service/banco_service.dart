// lib/banco_service.dart

import 'package:flutter/material.dart';
import 'package:ui_senai_bank/backend/conta.dart';
import 'package:ui_senai_bank/backend/contaCorrente.dart';
import 'package:ui_senai_bank/backend/contaPoupanca.dart';
import 'package:ui_senai_bank/backend/usuario.dart';
import 'package:ui_senai_bank/backend/cadastrarUsuario.dart';

class BancoService {
  final List<Conta> contas;
  final List<Usuario> usuarios;

  BancoService(this.contas, this.usuarios);

  // A função de login foi movida para esta classe para centralizar a lógica
  Usuario? buscarUsuario(String username, String senha) {
    try {
      return usuarios.firstWhere(
        (user) => user.username == username && user.senha == senha,
      );
    } catch (e) {
      return null;
    }
  }

  // --- Funções de Operações Bancárias ---

  String realizarTransferencia(
    Conta contaOrigem,
    Conta contaDestino,
    double valor,
  ) {
    if (valor <= 0) {
      return "Valor de transferência inválido.";
    }

    if (contaOrigem.saldo >= valor) {
      contaOrigem.saldo -= valor;
      contaDestino.saldo += valor;
      return "Transferência de R\$${valor.toStringAsFixed(2)} realizada com sucesso de ${contaOrigem.titular} para ${contaDestino.titular}!";
    } else {
      return "Saldo insuficiente para a transferência.";
    }
  }

  String sacar(Conta conta, double valor) {
    if (valor <= 0) {
      return "Valor de saque inválido.";
    }

    if (conta is ContaCorrente) {
      if (conta.sacarComChequeEspecial(valor)) {
        return "Saque de R\$${valor.toStringAsFixed(2)} realizado com sucesso!";
      } else {
        return "Saldo e limite de cheque especial insuficientes.";
      }
    } else {
      if (conta.saldo >= valor) {
        conta.saldo -= valor;
        return "Saque de R\$${valor.toStringAsFixed(2)} realizado com sucesso!";
      } else {
        return "Saldo insuficiente.";
      }
    }
  }

  String depositar(Conta conta, double valor) {
    if (valor <= 0) {
      return "Valor de depósito inválido.";
    }
    conta.saldo += valor;
    return "Depósito de R\$${valor.toStringAsFixed(2)} realizado com sucesso! Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.";
  }

  String simularRendimento(Conta conta, double taxa) {
    if (conta is ContaPoupanca) {
      double rendimento = conta.saldo * taxa;
      conta.saldo += rendimento;
      return "Rendimento de R\$${rendimento.toStringAsFixed(2)} aplicado com sucesso! Novo saldo: R\$${conta.saldo.toStringAsFixed(2)}.";
    } else {
      return "Esta conta não é uma Conta Poupança.";
    }
  }

  String cadastrarConta(String titular, String tipoConta, double saldoInicial) {
    // Lógica para cadastrar a conta
    Conta novaConta;
    if (tipoConta == "corrente") {
      novaConta = ContaCorrente(titular, saldoInicial);
    } else if (tipoConta == "poupanca") {
      novaConta = ContaPoupanca(titular, saldoInicial);
    } else {
      return "Tipo de conta inválido.";
    }
    contas.add(novaConta);
    return "Conta de ${novaConta.titular} cadastrada com sucesso!";
  }

  // Funções de leitura que retornam dados, em vez de imprimir
  List<Conta> getContas() {
    return contas;
  }

  String getSaldo(Conta conta) {
    return "R\$${conta.saldo.toStringAsFixed(2)}";
  }

  // Método para cadastrar um novo usuário
  String cadastrarUsuario(String username, String senha) {
    // Verifica se já existe um usuário com o mesmo username
    final existe = usuarios.any((user) => user.username == username);
    if (existe) {
      return "Usuário já cadastrado.";
    }
    // Cria e adiciona o novo usuário
    usuarios.add(Usuario(username, senha));
    return "Usuário $username cadastrado com sucesso!";
  }
}
