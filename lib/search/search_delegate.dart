import 'package:flutter/material.dart';
 
 class DataSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          print('CLICK');
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
          print('presionando el leadig');
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
    return Container();
  }

 }
