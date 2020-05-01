import 'package:flutter/material.dart';
import 'package:pelicula_original/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = PageController( initialPage: 1, viewportFraction: 0.28);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent-200){
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.21,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
       // children: _tarjetas(context),
       itemBuilder: (context, i){
         return _tarjeta(context, peliculas[i]);
       },
       itemCount: peliculas.length,
      ),
    );
  }

  _tarjeta(BuildContext context, Pelicula peli){
    final tar = Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'), 
                image: NetworkImage( peli.getPopularesImg() ), 
                fit: BoxFit.cover,
                height: 100.0,  width: 80.0,
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

      return GestureDetector(
        child: tar,
        onTap: (){
          print('titulo de la pelicula ${peli.title}');
        },
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
                height: 100.0,  width: 80.0,
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