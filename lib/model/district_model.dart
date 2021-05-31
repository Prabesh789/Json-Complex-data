class District {
  List bbox = [];
  String titleEng;
  String titleNep;
  Centroid centroid; //object of Cenr=troid banako ho

  District.fromJson(Map<String, dynamic> json)
      : bbox = json['bbox'],
        titleEng = json['title_en'],
        titleNep = json['title_ne'],
        centroid = Centroid.fromJson(json['centroid']);
}

class Centroid {
  List cordinates = [];

  Centroid.fromJson(Map<String, dynamic> json)
      : cordinates = json['coordinates'];
}
