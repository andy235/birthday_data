import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddPeopleBirthday extends StatefulWidget {
  const AddPeopleBirthday({Key? key}) : super(key: key);

  @override
  State<AddPeopleBirthday> createState() => _AddPeopleBirthdayState();
}

class _AddPeopleBirthdayState extends State<AddPeopleBirthday> {
  final _picker = ImagePicker();
  File? _image;

  final _nameController = TextEditingController();
  final _data = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  void _pickImage() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(file!.path);
    });
    // if (mounted && file != null) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute<void>(
    //           builder: (BuildContext context) =>
    //               VideoEditorPage(file: File(file.path))));
    // }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _pickImage();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _data.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавление именинника"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildImagePicker(context),
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'ФИО именинника',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                  ),
                )
              ),
            ),
          ),
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'ФИО именинника',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                  ),
                )
              ),
            ),
          ),


        ],
      ),
    );
  }

  Column buildImagePicker(BuildContext context) {
    return Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xffFDCF09),
                  child: _image != null
                      ? Image.file(
                    _image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              child: Text('Добавить фото'),
              onPressed: () {
                _showPicker(context);
              },
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        );
  }
}
