class Notification {
  final int? id;
  final int idRecipe;
  final String time;

  Notification({this.id, required this.idRecipe, required this.time});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_recipe': idRecipe,
      'time': time,
    };
  }

  static fromJson(Map<String, Object?> json) {}
}
