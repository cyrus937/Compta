class Boisson {
  final int id;
  final String nom;
  final double quantite;
  final String date;
  final TypeBoisson type;

  Boisson(
      {required this.id,
      required this.nom,
      required this.quantite,
      required this.date,
      required this.type});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nom': this.nom,
      'quantite': this.quantite,
      'date': this.date
    };
  }
}

enum TypeBoisson { biere, jus, eau, liqueur }
