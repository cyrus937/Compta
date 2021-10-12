import 'package:compta/models/data.dart';
import 'package:compta/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

/*class Compte extends StatefulWidget {
  Compte({Key? key}) : super(key: key);

  @override
  _CompteState createState() => _CompteState();
}*/

class Compte extends StatelessWidget {
  Compte({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _nomController = TextEditingController();
          final TextEditingController _quantiteController =
              TextEditingController();
          final TextEditingController _typeAheadController =
              TextEditingController();
          String _selectedCity;

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ajout d'une Boisson",
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
                        child: TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: _typeAheadController,
                              decoration: textFieldInputDecoration("Nom fff")),
                          suggestionsCallback: (pattern) {
                            return BackendService.getSuggestion(pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.toString()),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          onSuggestionSelected: (suggestion) {
                            _typeAheadController.text = suggestion.toString();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select a city';
                            }
                          },
                          onSaved: (value) => _selectedCity = value.toString(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
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
                            controller: _quantiteController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("Quantité")),
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
    final title = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
        onPressed: () async {
          await showInformationDialog(context);
        },
      ),
      appBar: AppBar(
        title: Text(title.toString()),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Container(
          child: Text('Compte'),
        ),
      ),
    );
  }
}
