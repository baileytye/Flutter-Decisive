class Option {
  String name, notes, imagePath;
  double price, rating;
  DateTime dateCreated;

  List<double> criteriaValues;

  Option({
    this.name = "Option name",
    this.notes = "",
    this.imagePath = "",
    this.dateCreated,
    this.criteriaValues = const [],
  });
}
