import 'package:flutter/material.dart';

Card buildCard(){
  var name = "Артем";
  var data = "19.10.1999";
  // late var image;

  return Card(
    child: Column(
      children: [
        Container(
          height: 200,
          child: Image.asset('assets/images/img.jpg'),
        ),
        Container(
          child: Text(name),
        ),
        Container(
          child: Text(data),
        )
      ],
    ),
  );
}