import 'conta.dart';

class ContaPoupanca extends Conta {
  ContaPoupanca(super.titular, super.saldo);

  // Sobrescreve o getter de tipo para exibir o tipo correto
  @override
  String get tipo => "Conta Poupança";

  // Método para simular o rendimento mensal da poupança
  void simularRendimento(double taxaJurosMensal) {
    if (saldo > 0) {
      double rendimento = saldo * taxaJurosMensal;
      saldo += rendimento;
      print("Rendimento de R\$${rendimento.toStringAsFixed(2)} aplicado.");
      print("Novo saldo: R\$${saldo.toStringAsFixed(2)}.");
    } else {
      print("Não há saldo para render.");
    }
  }
}
