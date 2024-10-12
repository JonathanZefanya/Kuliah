// ignore_for_file: public_member_api_docs, sort_constructors_first
class Medicine {
  final int? id;
  final String name;
  final int frequency;

  Medicine({
    this.id,
    required this.name,
    required this.frequency,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'frequency': frequency,
    };
  }
}
