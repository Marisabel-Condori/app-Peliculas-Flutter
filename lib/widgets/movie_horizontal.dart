import 'package:flutter/material.dart';
import 'package:pelicula_original/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.21,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1, viewportFraction: 0.28
        ),
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((peli){
      return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'), 
                image: NetworkImage( peli.getPopularesImg() ), 
                fit: BoxFit.cover,
                height: 100.0,
                width: 80.0,
                ),
            ),
            SizedBox(height: 5.0,),
            Text(
              peli.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,

              )
          ],
        ),
      );
    }).toList();
  }
}