import 'package:guis_notes_debug/helper/AnotacaoHelper.dart';

class Anotacao{

  int _id;
  String _titulo;
  String _descricao;
  String _data;
  
  Anotacao(this._titulo, this._descricao, this._data);

  Anotacao.toList(Map<String, dynamic> map){
    this._id = map['id'];
    this._titulo = map['titulo'];
    this._descricao = map['descricao'];
    this._data = map['data'];
  }

  int get id => _id;
  String get titulo => _titulo;
  String get descricao => _descricao;
  String get data => _data;

  set id(int value) => _id = value;
  set titulo(String value) => _titulo = value;
  set descricao(String value) => _descricao = value;
  set data(String value) => _data = value;

  Map anotacaoToMap(){

    Map<String, dynamic> map = {
      "titulo": this._titulo,
      "descricao": this._descricao,
      "data" : this._data
    };

    if( this._id != null ){
      map["id"] = this._id;
    }

    return map;

  }

}