import 'package:flutter/material.dart';
import 'package:pelicula_original/provider/peliculas_provider.dart';
import 'package:pelicula_original/widgets/movie_horizontal.dart';
import 'package:pelicula_original/widgets/swiper_tarjetas_widget.dart';

class HomePage extends StatelessWidget {

  final peliProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cine', ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _tarjetas(),
          _footer(context),
        ],)
    );
  }

  Widget _tarjetas() {
    return Container(
    //  color: Colors.red,
      child: FutureBuilder(
        future: peliProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){return SwiperTarjetas(peliculas: snapshot.data);}
          else{
            return Container(
              height: 300.0,
              child: Center( child: CircularProgressIndicator() )
            );
          }
        },
      ),
    );
  }

  Widget _footer(context) {
    return Container(
    //  color: Colors.blue,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead)),
          SizedBox(height: 0.5,),
          FutureBuilder(
            future: peliProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if(snapshot.hasData){
                return MovieHorizontal(peliculas: snapshot.data);
              }else{
                return CircularProgressIndicator();}
            },
          ),

        ],
      ),
    );
  }
}