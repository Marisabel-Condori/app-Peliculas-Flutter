import 'dart:async';
import 'dart:convert';

import 'package:pelicula_original/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider{

  String _url      = 'api.themoviedb.org';
  String _apiKey   = '4ff241d64b62613bfd9cd597188f9028';
  String _languaje = 'es-ES';

  int _popularesPage = 0;

  List<Pelicula> _populares = new List();
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink  =>_popularesStreamController.sink.add; 

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void dispose(){
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{
    final resp = await  http.get(url);
    final decodeData =  json.decode(resp.body);
    final oPelicula = Peliculas.fromJsonList(decodeData['results']);
    return oPelicula.listPeliculas;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key'  : _apiKey,
      'languaje' : _languaje
    });  
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key'  : _apiKey,
      'languaje' : _languaje,
      'page'     : _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    return resp;
  }
  

}