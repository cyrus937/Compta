import 'package:flutter/material.dart';

class CompteTitle extends StatelessWidget {
  final String title;
  final String date;

  const CompteTitle({Key? key, required this.title, required this.date})
      : super(key: key);

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        //elevation: 10,
        //backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              //width: 300,
              height: 250,
              //color: Colors.white54,
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100.0),
                topRight: Radius.circular(10.0),
              )),
              child: Text('Breathe in... Breathe out...'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                padding: EdgeInsets.only(top: 10.0, left: 15.0),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Text(
                      date,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                )),
            /*SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            )*/
          ],
        ),
      ),
      onTap: () => _show(context),
    );
  }
}
