import 'package:flutter/material.dart';

class InOutFltBtn extends StatelessWidget {
  InOutFltBtn({this.color, this.heroTag, this.function});

  final Color? color;
  final VoidCallback? function;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: color,
        child: Icon(Icons.add, color: Colors.black38),
        onPressed: function);
  }
}
