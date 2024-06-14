
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/pages/aboutus.dart';
import 'package:education_app/pages/saved.dart';
import 'package:education_app/pages/sign-in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  ProfilePage({required this.userData, Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePage> {
  final firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (currentUser != null) {
      DocumentSnapshot userDoc = await firestore.collection('users').doc(currentUser!.email).get();
      setState(() {
        userData = userDoc.data() as Map<String, dynamic>;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (selectedImage != null) {
      try {
        String fileName = randomAlphaNumeric(10);
        Reference storageRef =
            FirebaseStorage.instance.ref().child("profile_images/$fileName");
        UploadTask uploadTask = storageRef.putFile(selectedImage!);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        await firestore.collection("users").doc(currentUser?.email).update({
          'profileImage': downloadUrl,
        });
        _fetchUserData(); // Fetch user data again to update the profile image
      } catch (e) {
        print("Error uploading image: $e");
      }
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    String profileImageUrl =
        userData['profileImage'] as String? ?? "assets/images/about-img.jpg";
    String username =
        userData['username'] as String? ?? 'No Username';
    String email = userData['email'] as String? ?? 'No Email';

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipOval(
                    child: profileImageUrl.startsWith('http')
                        ? Image.network(
                            profileImageUrl,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            profileImageUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: _pickImage,
                    icon: Icon(Icons.add_a_photo),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    username,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 57, 107, 61),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    email,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 57, 107, 61).withOpacity(0.75),
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
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 0)),
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
            SizedBox(
              height: 300, // Set a fixed height for the list
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromRGBO(10, 99, 61, 50),
                    ),
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: ListTile(
                      leading: const Icon(Icons.bookmark, color: Colors.white),
                      title: const Text("Saved",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SavedPage()),
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
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title: const Text("Sign Out",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                          (Route<dynamic> route) => false,
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
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: ListTile(
                      leading: const Icon(Icons.book, color: Colors.white),
                      title: const Text("About EcoAction",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsPage()),
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
    );
  }

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
              if (newValue.trim().isNotEmpty) {
                if (currentUser != null) {
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(currentUser?.email)
                      .update({field: newValue});
                  setState(() {
                    widget.userData[field] = newValue;
                  });
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
}
