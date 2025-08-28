// Importe a classe Pessoa se for utilizá-la
// import 'package:banco_senai/pessoa.dart';

class Conta {
  String titular;
  double saldo;

  // O tipo será uma propriedade que a classe filha irá sobrescrever
  String get tipo => "Tipo de conta genérico";

  Conta(this.titular, this.saldo);
}
