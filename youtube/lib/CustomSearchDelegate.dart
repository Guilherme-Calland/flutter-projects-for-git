import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          //limpa a pesquisa
          query = "";
        }
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        //o mesmo se tivesse fazendo um pop
        /* o segundo parametro é caso quiséssemos passar
        algum valor */
        close(context, "");
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close( context, query );
    return Container();
  }

  @override
  //aquelas sugestoes que aparecem quando voce começa a digitar
  Widget buildSuggestions(BuildContext context) {
    // print("resultado digitado: $query");

    return Container();
/* 
    List<String> lista = List();

    if( query.isNotEmpty ){

      lista = [
        "android",
        "Android navegacao", 
        "IOS", 
        "Jogos",
        "openhaus",
        "demodisc",
        "filmhaus",
        "dudesoup"
      ].where(
        (texto){
          return texto.toLowerCase().startsWith( query.toLowerCase() );
        }
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text( lista[index] ),
            onTap: (){
              close(context, lista[index]);
            },
          );
        }
      );
    }else{
      return Center(
        child: Text("wẽ WẼ")
      );
    } */
  }

}