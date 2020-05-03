class Cast{
  List<Actor> actores = List();

  Cast.fromJsonList(List<dynamic> json){
    if(json == null){return;}

    for (var item in json) {
      final actor = Actor.fromJson(item);
      actores.add(actor);
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
    castId     = json['cast_Id'];
    character = json['character'];
    creditId = json['credit_Id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_Path'];
  }

  getFotoImg(){
    if(profilePath == null){
      return 'https://www.freeiconspng.com/uploads/person-icon-person-icon-17.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}