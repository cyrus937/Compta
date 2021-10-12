import 'dart:math';

import 'package:compta/models/boisson.dart';

class BackendService {
  static Future<List> getSuggestion(String query) async {
    await Future.delayed(Duration(seconds: 1));

    /*return List.generate(3, (index) {
      return {'name': query + index.toString(), 'price': Random().nextInt(100)};
    });*/

    Boisson b1 = Boisson(
        id: 1, nom: 'res', date: 'dgsd', quantite: 5, type: TypeBoisson.biere);
    List<String> boissons = [
      b1.id.toString() + "_" + (b1).nom,
      Boisson(
              id: 2,
              nom: 'test',
              date: 'dgsd',
              quantite: 5,
              type: TypeBoisson.biere)
          .nom,
      Boisson(
              id: 3,
              nom: 'booommm',
              date: 'dgsd',
              quantite: 5,
              type: TypeBoisson.biere)
          .nom,
    ];
    return boissons;
  }
}
