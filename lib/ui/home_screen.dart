import 'package:flutter/material.dart';

import '../widgets/card_bilder.dart';
import 'form_people.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birhday calendar'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const AddPeopleBirthday())
                );
              },
              icon: Icon(Icons.add)
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
