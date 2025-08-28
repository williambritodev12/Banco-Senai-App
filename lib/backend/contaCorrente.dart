import 'conta.dart';

class ContaCorrente extends Conta {
  // O cheque especial é um limite extra de saldo negativo.
  double limiteChequeEspecial;

  ContaCorrente(
    super.titular,
    super.saldo, {
    this.limiteChequeEspecial = 500.0,
  });

  @override
  String get tipo => "Conta Corrente";

  // Um método para sacar que considera o cheque especial.
  bool sacarComChequeEspecial(double valor) {
    if (saldo + limiteChequeEspecial >= valor) {
      saldo -= valor;
      print("Saque de R\$${valor.toStringAsFixed(2)} realizado com sucesso.");
      print("Novo saldo: R\$${saldo.toStringAsFixed(2)}.");
      return true;
    } else {
      print("Saldo insuficiente e limite do cheque especial excedido.");
      return false;
    }
  }
}
