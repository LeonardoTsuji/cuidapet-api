import 'package:cuidapet_api/models/fornecedor_model.dart';
import 'package:cuidapet_api/models/usuario_model.dart';

class ChatFornecedorModel {
  ChatFornecedorModel({
    this.id,
    this.usuario,
    this.fornecedor,
    this.nome,
    this.nomePet,
    this.status,
  });

  int id;
  UsuarioModel usuario;
  FornecedorModel fornecedor;
  String nome;
  String nomePet;
  String status;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'fornecedor': fornecedor?.toMap(),
      'nome': nome,
      'nomePet': nomePet,
      'status': status,
    };
  }
}
