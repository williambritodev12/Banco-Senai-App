import 'pessoa.dart';

// Classe que herda de Pessoa e adiciona um CNPJ.

class PessoaJuridica extends Pessoa {
  String cnpj;
  get tipoPessoa => "PJ";
  PessoaJuridica(super.nome, this.cnpj);
}
