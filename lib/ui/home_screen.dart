import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';
import '../widgets/card_bilder.dart';
import 'form_people.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> listOfCard = [];
  int _selectedIndex = 0;


  void addCardToListMethod(UserModel userCard) {
    setState(() {
      listOfCard.add(userCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    final newUserModel = context.read<UserModel>();
    String getName = Provider.of<UserModel>(context).nameModel.toString();
    // String getDate = Provider.of<UserModel>(context).dataModel.toString();
    // String getPhotoURL = Provider.of<UserModel>(context).photoURLModel.toString();

    if ( getName != 'init') {
      addCardToListMethod(newUserModel);
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Календарь дней рождений'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPeopleBirthday()));
                },
                icon: Icon(Icons.add)),
          ],
          leading: IconButton(
            onPressed: () {
              print(listOfCard);
              print(listOfCard[0].nameModel);
              print(listOfCard[1].nameModel);
              print(listOfCard[2].nameModel);
            },
            icon: Icon(Icons.search_rounded),
          ),
        ),
        body: Center(
          child: Text(
            'Добавьте новых именинников',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    List<Widget> _cards = <Widget>[
      Scaffold(
        body: ListView.builder(
          itemCount: listOfCard.length,
          itemBuilder: (context, index) {
            return buildCard(listOfCard[index])
            // Card(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: 200,
            //         child: Image.asset(listOfCard[index].photoURLModel),
            //       ),
            //       Container(
            //         child: Text(listOfCard[index].nameModel),
            //       ),
            //       Container(
            //         child: Text(listOfCard[index].dataModel),
            //       )
            //     ],
            //   ),
            // )
            ;
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь дней рождений'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPeopleBirthday()));
              },
              icon: Icon(Icons.add)),
        ],
        leading: IconButton(
          onPressed: () {
            // print(listOfCard[0].nameModel);
            print(listOfCard[0].photoURLModel);
          },
          icon: Icon(Icons.search_rounded),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: _cards,
          ),
          //_cards.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
