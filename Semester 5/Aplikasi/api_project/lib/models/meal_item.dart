class MealItem {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealItem({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) {
    return MealItem(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}