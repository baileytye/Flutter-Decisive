
class Criteria{
  String name, notes, unit;
  Type type;
  Importance importance;
  double expected, weight;
  bool moreIsBetter;

  Criteria({
    this.name = "Criteria name",
    this.notes = "",
    this.unit = "",
    this.type = Type.number,
    this.importance = Importance.normal,
    this.expected = 0.0, 
    this.weight = 1.0,
    this.moreIsBetter = true,
  });
}

enum Type {
  number, starRating, checkbox, averaging
}

enum Importance {
  high, normal, low, custom, exclude
}