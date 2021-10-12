import 'package:flutter/material.dart';

class File extends StatefulWidget {
  File({Key? key}) : super(key: key);

  @override
  _FileState createState() => _FileState();
}

class _FileState extends State<File> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Files'),
      ),
    );
  }
}
