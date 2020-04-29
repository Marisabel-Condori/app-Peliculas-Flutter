import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pelicula_original/models/pelicula_model.dart';

class SwiperTarjetas extends StatelessWidget {

  final List<Pelicula> peliculas;
  SwiperTarjetas({ @required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
    //  padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.59,
        layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'), 
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  fit: BoxFit.cover,
                ),
              );
            },
            itemCount: peliculas.length,
          //  pagination: new SwiperPagination(),
          //  control: new SwiperControl(),
          ),
    );
  }
}