// Esta é a classe-base. Ela Representa o que é comum a todas as pessoas.
abstract class Pessoa {
  String nome;
  get tipoPessoa => null; // Pode ser PF ou PJ

  Pessoa(this.nome);
}
