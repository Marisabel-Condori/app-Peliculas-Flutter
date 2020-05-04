import 'package:flutter/material.dart';
 
 class DataSearch extends SearchDelegate{
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

    final listaSugerida = (query.isEmpty)? peliReciente: 
          peliculas.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            sugerencia = listaSugerida[i];
            showResults(context);
          },
        );
      }
    );
  }

 }
