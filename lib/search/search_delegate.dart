import 'package:flutter/material.dart';
 
 class DataSearch extends SearchDelegate{
   final peliculas = [
     'iron man',
     'iron man1',
     'iron man2',
     'iron man3',
     'capitan America'
     'thor'
     'vengadores'
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugerencias que aparece cuando la persona escribe
    return ListView.builder(
      itemCount: peliReciente.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(peliReciente[i]),
        );
      }
    );
  }

 }
