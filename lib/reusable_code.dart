import 'package:flutter/material.dart';

class Reusablecode extends StatelessWidget {
  Reusablecode({required this.colour,this.codeChild});

  final Widget? codeChild;
  final Color? colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:codeChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color:colour ,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}