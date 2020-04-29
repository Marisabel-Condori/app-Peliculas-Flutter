class Peliculas{
  Peliculas();
  List<Pelicula> listPeliculas = List();

  Peliculas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null){ return; }

    for (var item in jsonList) {
      final objPelicula = new Pelicula.fromJsonMap(item);
      listPeliculas.add(objPelicula);
    }
  }
}

class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap( Map<String, dynamic> json ){
    popularity      = json['popularity'] / 1;
    voteCount       = json['vote_count'];
    video           = json['video'];
    posterPath      = json['poster_path'];
    id              = json['id'];
    adult           = json['adult'];
    backdropPath    = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle   = json['original_title'];
    genreIds        = json['genre_ids'].cast<int>();
    title           = json['title'];
    voteAverage     = json['vote_average'] /1;
    overview        = json['overview'];
    releaseDate     = json['release_date'];
  }

  getPosterImg(){
    if(posterPath == null){
      return 'https://st4.depositphotos.com/14953852/24651/v/450/depositphotos_246517344-stock-illustration-image-available-icon-vector-flat.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getPopularesImg(){
    if(posterPath == null){
      return 'https://st4.depositphotos.com/14953852/24651/v/450/depositphotos_246517344-stock-illustration-image-available-icon-vector-flat.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
