import 'package:education_app/pages/sign-in.dart';
import 'package:education_app/pages/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  String _storedImageUrl = "";
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    loadStoredImageUrl();
  }

  void loadStoredImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedImageUrl = prefs.getString('profileImageUrl') ?? "";
    });
    if (_storedImageUrl.isNotEmpty) {
      loadProfileImage(_storedImageUrl);
    }
  }

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

  void updateUserPhotoUrl(String photoUrl) async {
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
      // Update stored image URL
      saveImageUrlLocally(photoUrl);
    }).catchError((error) {
      print("Failed to update user photo URL: $error");
    });
  }

  void saveImageUrlLocally(String photoUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profileImageUrl', photoUrl);
    setState(() {
      _storedImageUrl = photoUrl;
    });
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

  void loadProfileImage(String photoUrl) async {
    var response = await http.get(Uri.parse(photoUrl));
    if (response.statusCode == 200) {
      setState(() {
        _image = response.bodyBytes;
      });
    } else {
      print("Failed to load profile image");
    }
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
                                        backgroundImage: _storedImageUrl
                                                .isNotEmpty
                                            ? NetworkImage(_storedImageUrl)
                                            : AssetImage(
                                                    'assets/default_avatar.png')
                                                as ImageProvider,
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
                                    onTap: signOut,
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
                                      // Navigate to AboutUsPage
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
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}
