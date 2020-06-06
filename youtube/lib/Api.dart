import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDgvEPcltVyMK3gFrR9R8oK6dWZ2Bxde4I";
// const CHAVE_YOUTUBE_API = "AIzaSyDfnbRwNlFrfNWrVJspeo_vMG66sOMMa4I";
// const CHAVE_YOUTUBE_API = "AIzaSyDN_g_blWNFIX7VzxqRxl4jaJNCuUn9CCg";

const ID_CANAL_ANDROID = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const ID_CANAL_FUNHAUS = "UCboMX_UNgaPBsUOIgasn3-Q";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL_FUNHAUS"
      "&q=$pesquisa"
    );

    print("");
    print( "Codigo de status: ${response.statusCode}" );
    print("");
    //status code 400: nao achou servidor
    //status code 403: servidor entendeu, mas nao autorizou

    if( response.statusCode == 200 ){

      Map<String, dynamic> dadosJson = json.decode( response.body );

      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();

      return videos;

    } else {

    }
  }
}