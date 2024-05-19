import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/elements/utils.dart';
import 'package:education_app/pages/aboutus.dart';
import 'package:education_app/pages/saved.dart';
import 'package:education_app/pages/settings.dart';
import 'package:education_app/pages/sign-in.dart';
import 'package:education_app/resources/add_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;

  // Declare currentUser here
  late User? currentUser; 

  // Initialize currentUser in initState
  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth
        .instance.currentUser; 
  }
  final usersCollection = FirebaseFirestore.instance.collection("users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(10, 99, 61, 50),
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white), 
            ),
          ),
          TextButton(
            onPressed: () async {
              if (newValue.trim().length > 0) {
                if (currentUser != null) {
                  await usersCollection
                      .doc(currentUser!.email!)
                      .update({field: newValue});
                  setState(() {});
                }
              }
              Navigator.of(context).pop();
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    if (_image != null) {
      saveProfile();
    }
  }

  void saveProfile() async {
  String email = FirebaseAuth.instance.currentUser!.email!;
  String resp = await StoreData().saveData(email, _image!);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(10, 99, 61, 50),
                Color.fromRGBO(78, 138, 103, 50),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(251, 241, 221, 50),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              _image != null
                                  ? CircleAvatar(
                                      radius: 64,
                                      backgroundImage: MemoryImage(_image!),
                                    )
                                  : const CircleAvatar(
                                      radius: 64,
                                      backgroundImage: NetworkImage(
                                          "data:image/jpeg;base64,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"),
                                    ),
                              Positioned(
                                bottom: -10,
                                left: 80,
                                child: IconButton(
                                  onPressed: selectImage,
                                  icon: Icon(Icons.add_a_photo),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  userData['username'],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 57, 107, 61),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  userData['email'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 57, 107, 61)
                                        .withOpacity(0.75),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: () => editField("username"),
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  style: ButtonStyle(
                                    fixedSize:
                                        MaterialStateProperty.all(Size(130, 0)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(78, 138, 103, 50)),
                                    overlayColor: MaterialStateProperty.all(
                                        Color.fromRGBO(78, 138, 103, 50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromRGBO(10, 99, 61, 50),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  child: ListTile(
                                    leading: const Icon(Icons.bookmark,
                                        color: Colors.white),
                                    title: const Text("Saved",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SavedPage()),
                                      );
                                    },
                                    trailing: const Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromRGBO(10, 99, 61, 50),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  child: ListTile(
                                    leading: const Icon(Icons.logout,
                                        color: Colors.white),
                                    title: const Text("Sign Out",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignInPage()),
                                      );
                                    },
                                    trailing: const Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromRGBO(10, 99, 61, 50),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 20),
                                  child: ListTile(
                                    leading: const Icon(Icons.book,
                                        color: Colors.white),
                                    title: const Text("About EcoAction",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AboutUsPage()),
                                      );
                                    },
                                    trailing: const Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
