import 'package:compta/views/components/compte_list.dart';
import 'package:compta/views/compte.dart';
import 'package:compta/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Accueil extends StatefulWidget {
  Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _nomController = TextEditingController();

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Nouveau Compte",
                        style: TextStyle(color: Colors.orangeAccent),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.orangeAccent),
                        ),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          bottom: 1,
                        ),
                        child: TextFormField(
                            validator: (val) {
                              return val!.isEmpty
                                  ? "Le nom ne doit pas être vide"
                                  : null;
                            },
                            controller: _nomController,
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("Nom")),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ],
                  )),
              actions: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.orangeAccent),
                      ),
                      onPressed: () {
                        /*if(_formKey.currentState.validate()){
                      // Do something like updating SharedPreferences or User Settings etc.*/
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Compte(),
                            settings: RouteSettings(
                              arguments: _nomController.text,
                            ),
                          ),
                        );
                        //}
                      },
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
        onPressed: () async {
          await showInformationDialog(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.assignment_outlined,
                    size: 30.0,
                    color: Colors.orangeAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "Compta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  '12 files',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              /*padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.05),*/
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.height * 0.05),
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.height * 0.05))),
              child: CompteList(),
            ),
          )
        ],
      ),
    );
  }
}
