import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  @override

  String pesquisa;

  Inicio( this.pesquisa );

  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override

  _listarVideos(String pesquisa){

    Api api = Api();
    return api.pesquisar(pesquisa);

  }
  
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos( widget.pesquisa ),
      builder: (context, snapshot){
        switch( snapshot.connectionState ){
          case ConnectionState.none :
          case ConnectionState.waiting :
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Aguarde aí...",
                  style: TextStyle(
                    fontSize: 30
                  )
                ),
                CircularProgressIndicator()
              ]
            )
            // child: CircularProgressIndicator()
          );
          break;
          case ConnectionState.active :
          case ConnectionState.done : 
          if( snapshot.hasData ){
            return ListView.separated(
              itemBuilder: (context, index){
              List<Video> videos = snapshot.data;
              Video video = videos[index];
                return GestureDetector(
                  onTap: (){
                    FlutterYoutube.playYoutubeVideoById(
                      apiKey: CHAVE_YOUTUBE_API, 
                      videoId: video.id,
                      autoPlay: true,
                      fullScreen: true
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.imagem),
                          )
                        ),
                      ),
                      ListTile(
                        title: Text( video.titulo ),
                        subtitle: Text( video.canal )
                      )
                    ],
                  )
                );
              },
              separatorBuilder: (context, index){
                return Divider(
                  height: 2,
                  color: Colors.grey
                );
              },
              itemCount: snapshot.data.length,
            );
          }else{
            return Center(
              child: Text(
                "nenhum dado a ser exibido, servidor do youtube impediu a autorizacao :(",
                textAlign: TextAlign.center,)
            );
          }
          break;
        }
      },
    );
  }
}