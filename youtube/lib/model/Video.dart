class Video {

  String id;
  String titulo;
  String canal;
  String descricao;
  String imagem;   
  String canalId;

  Video({
    this.id,
    this.titulo,
    this.descricao,
    this.canal,
    this.imagem,
    this.canalId,
  });


  factory Video.fromJson(Map<String, dynamic> json){
      return Video(
        id: json["id"]["videoId"],
        canalId: json["snippet"]["channelId"],
        titulo: json["snippet"]["title"],
        descricao: json["snippet"]["description"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelTitle"],
    );
  }
  
}
