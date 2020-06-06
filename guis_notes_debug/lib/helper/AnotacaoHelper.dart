import 'package:guis_notes_debug/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {

  static final String nomeTabela = "anotacao";
  static final String colunaId = 'id';
  static final String colunaTitulo = 'titulo';
  static final String colunaDescricao = 'descricao';
  static final String colunaData = 'data';
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal(){

  }

  get db async {
    if( _db != null ){
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async{

    String sql = "CREATE TABLE anotacao ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
    "titulo VARCHAR, "
    "descricao TEXT, "
    "data DATETIME "
    ")";
    await db.execute(sql);

  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, 'banco_minhas_anotacoes.db');

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate );
    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async{

    //nao tem _  pq agt ta usando metodo get 
    var bancoDados = await db;

    int id = await bancoDados.insert(nomeTabela, anotacao.anotacaoToMap() );

    return id;
  } 

  read() async {

    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC";
    List anotacoes = await bancoDados.rawQuery( "SELECT * FROM anotacao" );
    // print("anotacoes: $anotacoes");
    return anotacoes;
  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async{
    
    var bancoDados = await db;
    //retorna ate itens atualizados
    await bancoDados.update(
      nomeTabela, anotacao.anotacaoToMap(),
      where: 'id = ?',
      whereArgs: [anotacao.id]
    );
  }

  Future<int> removerAnotacao( Anotacao anotacao ) async{

    var bancoDados = await db;
    //retorna ate itens deletados
    return await bancoDados.delete(
      nomeTabela,
      where: 'id = ?',
      whereArgs: [anotacao.id]
    );
  }

}