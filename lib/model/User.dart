import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String nameModel = 'init';
  String dataModel = 'init';
  String photoURLModel = 'init';

  List<UserModel> listOfCards = [];

  // Map data = {
  //   'name': 'init',
  //   'date': 'init',
  //   'photoURl': 'init',
  // };

  void updateModel(String name, String data, String pathPhoto) {
    nameModel = name;
    dataModel = data;
    photoURLModel = pathPhoto;
    notifyListeners();
  }

  void addCardToList(UserModel userCard){
    listOfCards.add(userCard);
  }

}