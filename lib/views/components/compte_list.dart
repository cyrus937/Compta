import 'package:compta/models/boisson.dart';
import 'package:compta/views/components/compte_title.dart';
import 'package:flutter/material.dart';

class CompteList extends StatelessWidget {
  CompteList({
    Key? key,
  }) : super(key: key);

  List<Boisson> boissons = [
    Boisson(
        id: 1, nom: 'res', date: 'dgsd', quantite: 5, type: TypeBoisson.biere),
    Boisson(
        id: 2, nom: 'res', date: 'dgsd', quantite: 5, type: TypeBoisson.biere),
    Boisson(
        id: 3, nom: 'res', date: 'dgsd', quantite: 5, type: TypeBoisson.biere),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.00),
        child: Expanded(
          child: ListView(
            /*padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),*/
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.03),
            children: <Widget>[
              CompteTitle(
                title: boissons[0].nom,
                date: boissons[0].date,
              ),
              CompteTitle(
                title: boissons[1].nom,
                date: boissons[1].date,
              ),
              CompteTitle(
                title: boissons[2].nom,
                date: boissons[2].date,
              ),
              CompteTitle(
                title: boissons[0].nom,
                date: boissons[0].date,
              ),
              CompteTitle(
                title: boissons[0].nom,
                date: boissons[0].date,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
