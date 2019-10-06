
class Criteria{
  String name, notes, unit;
  Type type;
  Importance importance;
  double expected, weight;
  bool moreIsBetter;
}

enum Type {
  number, starRating, checkbox, averaging
}

enum Importance {
  high, normal, low, custom, exclude
}