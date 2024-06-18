import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/pages/sign-in.dart';
import 'package:education_app/pages/update_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    if (currentUser == null) {
      throw Exception("User not authenticated");
    }
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  Future<String> uploadProfilePicture(Uint8List image) async {
    if (currentUser == null) {
      throw Exception("User not authenticated");
    }
    try {
      String imageName =
          "${currentUser!.email}_${DateTime.now().millisecondsSinceEpoch}";
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref()
          .child('profile_pictures/$imageName.jpg')
          .putData(image);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading profile picture: $e");
      return "";
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List image = await pickedFile.readAsBytes();
      String photoUrl = await uploadProfilePicture(image);
      setState(() {
        _image = image;
      });
      if (photoUrl.isNotEmpty) {
        updateUserPhotoUrl(photoUrl);
      } else {
        print("Failed to get the photo URL after upload.");
      }
    } else {
      print("No image selected.");
    }
  }

  void updateUserPhotoUrl(String photoUrl) {
    if (currentUser == null) {
      print("User not authenticated");
      return;
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .update({
      'photoUrl': photoUrl,
    }).then((value) {
      print("User photo URL updated successfully");
    }).catchError((error) {
      print("Failed to update user photo URL: $error");
    });
  }

 void showSignOutConfirmationDialog() {
  Color dialogBackgroundColor = const Color.fromRGBO(10, 99, 61, 50);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: dialogBackgroundColor,
        title: const Text(
          'Confirm Sign Out',
          style: TextStyle(color: Colors.white), 
        ),
        content: const Text(
          'Are you sure you want to sign out?',
          style: TextStyle(color: Colors.white70), 
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              signOut();
            },
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
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
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(10, 99, 61, 50),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            Map<String, dynamic>? user = snapshot.data!.data();
            if (user == null) {
              return const Center(
                child: Text("User data not found"),
              );
            }
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: selectImage,
                                child: _image != null
                                    ? CircleAvatar(
                                        radius: 64,
                                        backgroundImage: MemoryImage(_image!),
                                      )
                                    : CircleAvatar(
                                        radius: 64,
                                        backgroundImage: NetworkImage(
                                          user['photoUrl'] ??
                                              "https://via.placeholder.com/150",
                                        ),
                                      ),
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
                          const SizedBox(height: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  user['username'],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 57, 107, 61),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  user['email'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 57, 107, 61)
                                        .withOpacity(0.75),
                                    fontWeight: FontWeight.w500,
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
                                    title: const Text("Update Profile",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdateProfilePage()),
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
                                    onTap: showSignOutConfirmationDialog,
                                    trailing: const Icon(Icons.arrow_forward,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 10),                               
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
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}

Future<Uint8List?> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  if (pickedFile != null) {
    return await pickedFile.readAsBytes();
  }
  return null;
}
