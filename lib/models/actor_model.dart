class Actores{
  List<Actor> listActores = List();

  Actores.fromJsonList(List<dynamic> json){
    if(json == null){return;}

    for (var item in json) {
      final actor = Actor.fromJson(item);
      listActores.add(actor);
    }
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJson(Map<String, dynamic> json){
    castId     = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getFotoImg(){
    if(profilePath == null){
      return 'https://www.freeiconspng.com/uploads/person-icon-person-icon-17.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}