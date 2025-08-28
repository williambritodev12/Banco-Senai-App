import 'pessoa.dart';

// Classe que herda de Pessoa e adiciona um CPF.

class PessoaFisica extends Pessoa {
  String cpf;
  get tipoPessoa => 'PF';

  PessoaFisica(super.nome, this.cpf);
}
