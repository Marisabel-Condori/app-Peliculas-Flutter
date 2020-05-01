import 'package:flutter/material.dart';
import 'package:pelicula_original/models/pelicula_model.dart';

class DetallePelicula extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(child: Text('detalleeeeeeeeeeeeeee:  ${pelicula.title}')),
    );
  }
}