class Pokemon {
  final int id;
  final String name;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final sprites = json["sprites"];
    final other = sprites["other"];
    String imageUrl = other["dream_world"]["front_default"];
    final name = json['name'][0].toUpperCase() + json['name'].substring(1);
    return Pokemon(
      id: json['id'],
      name: name,
      imageUrl: imageUrl,
    );
  }
  @override
  String toString() {
    return "Pokemon: $name, $imageUrl, $id";
  }
}
