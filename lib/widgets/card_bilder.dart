import 'dart:io';

import 'package:birthday_data/model/User.dart';
import 'package:flutter/material.dart';

Card buildCard(UserModel userModel){

  // List<String> nameCardList = [];
  // List<String> dataCardList = [];
  // List<String> photoURlCardList = [];
  //
  // String nameCardModel = userModel.nameModel;
  // String dataCardModel = userModel.dataModel;
  // String photoURLCardModel = userModel.photoURLModel;
  //
  // nameCardList.add(nameCardModel);
  // dataCardList.add(dataCardModel);
  // photoURlCardList.add(photoURLCardModel);



  return Card(
    child: Column(
      children: [
        Container(
          height: 200,
          child: Image.file(File(userModel.photoURLModel)),
        ),
        Container(
          child: Text(userModel.nameModel),
        ),
        Container(
          child: Text(userModel.dataModel),
        )
      ],
    ),
  );
}