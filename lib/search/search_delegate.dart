import 'package:flutter/material.dart';
import 'package:pelicula_original/models/pelicula_model.dart';
import 'package:pelicula_original/provider/peliculas_provider.dart';
 
 class DataSearch extends SearchDelegate{
   final peliProvider = PeliculasProvider();
   String sugerencia ='';
   final peliculas = [
     'iron man',
     'iron man1',
     'iron man2',
     'iron man3',
     'capitan America',
     'thor',
     'vengadores',
   ];
   final peliReciente = [
     'spiderman',
     'capitan america'
   ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query = '';
        })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icono de la izquierda del Appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation
      ),
        onPressed: (){
          close(context, null);
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea resultados que vamos a mostrar
    return Center(
      child: Container(
        width: 300.0,
        height: 200.0,
        color: Colors.deepOrange,
        child: Text(sugerencia),
      )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias que aparece cuando la persona escribe

    if(query.isEmpty){return Container();}
    
    return FutureBuilder(
      future: peliProvider.buscaPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){
          final peli = snapshot.data;
          return ListView(
            children: peli.map((pelicula){
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/img/no-img'), 
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.contain,
                  width: 50.0,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  pelicula.uniqueId = '';
                  close(context, null);
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

 }
