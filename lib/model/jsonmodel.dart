class JsonModel {
  String position;
  String name;
  String image;
  String velocity;
  String distance;
  String description;
  String tempc;
  String tempf;

  JsonModel(
      {required this.position,
      required this.name,
      required this.image,
      required this.velocity,
      required this.distance,
      required this.description,
      required this.tempf,
      required this.tempc});
}
