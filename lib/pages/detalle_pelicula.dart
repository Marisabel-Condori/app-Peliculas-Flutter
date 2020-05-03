import 'package:flutter/material.dart';
import 'package:pelicula_original/models/actor_model.dart';
import 'package:pelicula_original/models/pelicula_model.dart';
import 'package:pelicula_original/provider/peliculas_provider.dart';

class DetallePelicula extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pelicula), 
          SliverList(delegate: SliverChildListDelegate(
            [
              _posterTitulo(context, pelicula),
              _descripcion(pelicula),
              _actores(pelicula)
            ]
          ))
          ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.indigoAccent,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        centerTitle: true,
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'), 
          image: NetworkImage(pelicula.getBackgroundImg()),
        //  fadeInDuration: Duration(milliseconds: 300),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context ,Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,
            )
          ),
          SizedBox(width: 15.0,),
          Flexible(child: Column(
            children: <Widget>[
              Text(pelicula.title, style: Theme.of(context).textTheme.title, overflow: TextOverflow.ellipsis,),
              Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis),
              Row(children: <Widget>[
                Icon(Icons.star_border),
                SizedBox(width: 10.0,),
                Text(pelicula.voteAverage.toString())
              ],)
            ],
          ))
        ],
      ),
    );
  }

  _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  _actores(Pelicula pelicula){
    final peliProvider = PeliculasProvider();
    return FutureBuilder(
      future: peliProvider.getActores(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){ return _crearActores(snapshot.data);}
        else{return CircularProgressIndicator();}
      },
    );
  }

  _crearActores(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: actores.length,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.28
        ),
        itemBuilder: (context, i){
          return Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: FadeInImage(
                    height: 140.0,
                    placeholder: AssetImage('assets/img/no-image.jpg'), 
                    image: NetworkImage(actores[i].getFotoImg())),
                ),
                Text(actores[i].name, overflow: TextOverflow.ellipsis,),
              ],
            ),
          );
          //Text(actores[i].name);
        }
      ),
    );
  }
}
