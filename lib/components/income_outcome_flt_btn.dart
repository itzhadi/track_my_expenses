import 'package:flutter/material.dart';

class InOutFltBtn extends StatelessWidget {
  InOutFltBtn({this.color, this.function});

  final Color? color;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: color,
        child: Icon(Icons.add, color: Colors.black38),
        onPressed: function);
  }
}
