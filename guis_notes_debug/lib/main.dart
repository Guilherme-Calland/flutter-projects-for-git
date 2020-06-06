import 'package:flutter/material.dart';
import 'package:guis_notes_debug/helper/AnotacaoHelper.dart';
import 'package:guis_notes_debug/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

/* quando refizer esse projeto, siga os princípios
/de responsabilidade única com todas aquelas frescuras
de classes com mesmo nome de metodo chamando 
metodos de outras classes, talvez use github pra num
dar mta merda
 */

// CRUD - CREATE READ UPDATE DELETE


void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  TextEditingController _controladorTitulo = TextEditingController();
  TextEditingController _controladorDescricao = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> anotacoes = List<Anotacao>();

  _exibirTelaCasdastro( { Anotacao anotacao } ){

    String textoSalvarAtualizar = "";
    if( anotacao == null ){ //salvar
      _controladorTitulo.text = "";
      _controladorDescricao.text = "";
      textoSalvarAtualizar = "salvar";
    } else { //atualizar
      _controladorTitulo.text = anotacao.titulo;
      _controladorDescricao.text = anotacao.descricao;
      textoSalvarAtualizar = 'atualizar';
    }
    
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("$textoSalvarAtualizar anotacao"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _controladorTitulo,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Titulo",
                  hintText: "digite um titulo"
                )
              ),
              TextField(
                controller: _controladorDescricao,
                decoration: InputDecoration(
                  labelText: "Descricao",
                  hintText: "digite uma descricao"
                ),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=> Navigator.pop(context),
              child: Text(
                "cancelar",
                style: TextStyle(
                  color: Colors.red
                ),
              ),
            ),
            FlatButton(
              onPressed: (){
                _salvarAtualizarAnotacao(anotacao: anotacao);
                Navigator.pop(context);
              },
              child: Text(
                textoSalvarAtualizar,
                style: TextStyle(
                  color: Colors.green
                ),
              )
            )
          ],
        );
      }
    );
  }

  _salvarAtualizarAnotacao( { Anotacao anotacao }) async {

    String titulo = _controladorTitulo.text;
    String descricao = _controladorDescricao.text;
    String data = DateTime.now().toString();

    if( anotacao == null ){ //salvar
      Anotacao novaAnotacao = Anotacao( titulo, descricao, data );
      int resultado = await _db.salvarAnotacao( novaAnotacao );
    } else { //atualizar
      anotacao.titulo = titulo;
      anotacao.descricao = descricao;
      anotacao.data = data;
      int resultado = await _db.atualizarAnotacao( anotacao );
    }

    // print("salvar anotacao: $resultado");

    _controladorTitulo.clear();
    _controladorDescricao.clear();
    
    // print(novaAnotacao.titulo);

    read();
  }

  _formatarData(String data){

    initializeDateFormatting('pt-Br');

    // var formatador = DateFormat('dd/MM/y HH:mm:ss');
    var formatador = DateFormat.yMMMMd('pt_BR');

    DateTime dataConvertida = DateTime.parse( data );
    String dataFormatada = formatador.format( dataConvertida );

    return dataFormatada;

  }

  read() async {

    List data = await _db.read();
    List<Anotacao> listaTemporaria = List<Anotacao>();
    for(var map in data){
      Anotacao note = Anotacao.toList(map);
      listaTemporaria.add( note );
    }

    setState(() {
      anotacoes = listaTemporaria;
    });
    listaTemporaria = null;

    // print("Lista anotacoes: " + anotacoesRecuperadas.toString());

  }

  _removerAnotacao( Anotacao anotacao ) async {
    await _db.removerAnotacao( anotacao );
    read();
  }

  @override
  void initState(){
    super.initState();
    read();
  }

  Widget build(BuildContext context) {

    var corTema = Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotacoes"),
        backgroundColor: corTema,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: anotacoes.length,
              itemBuilder: (context, index){

                final anotacao = anotacoes[index];

                return Card(
                  // color: Colors.grey,
                  child: ListTile(
                    title: Text(anotacao.titulo),
                    subtitle: Text("${ _formatarData(anotacao.data) } - ${anotacao.descricao}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap:  (){
                            _exibirTelaCasdastro(anotacao: anotacao);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green
                            )
                          )
                        ),GestureDetector(
                          onTap: (){
                            _removerAnotacao( anotacao );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red
                            )
                          )
                        ),
                      ],
                    )
                  )
                );
              }
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: corTema,
        foregroundColor: Colors.white,
        onPressed: _exibirTelaCasdastro,
        child: Icon(Icons.add),
      ),
    );
  }
}