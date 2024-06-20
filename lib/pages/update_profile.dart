import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isProcessing = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 50),
          child: const Text('Update Profile', 
          style: TextStyle(color: Colors.white),),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
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
      backgroundColor: const Color.fromRGBO(251, 241, 221, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _currentPasswordController,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Current password cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _newPasswordController,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value!.isNotEmpty && value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                cursorColor: Colors.black,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
                validator: (value) {
                  if (value!.isNotEmpty && value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isProcessing ? null : _updateProfile,
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(78, 138, 103, 50)),
                    overlayColor: MaterialStatePropertyAll(
                        Color.fromRGBO(78, 138, 103, 50)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });

      try {
        final User? user = _auth.currentUser;

        if (_usernameController.text.trim().isNotEmpty) {
          await user!.updateDisplayName(_usernameController.text.trim());
          await _firestore.collection('users').doc(user.email).update({
            'username': _usernameController.text.trim(),
          });
        }

        if (_currentPasswordController.text.isNotEmpty && _newPasswordController.text.isNotEmpty) {
          final credential = EmailAuthProvider.credential(
            email: user!.email!,
            password: _currentPasswordController.text.trim(),
          );
          await user.reauthenticateWithCredential(credential);
          await user.updatePassword(_newPasswordController.text.trim());
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Color.fromRGBO(78, 138, 103, 50),
          ),
        );

        _usernameController.clear();
        _currentPasswordController.clear();
        _newPasswordController.clear();
        _confirmPasswordController.clear();

        setState(() {
          _isProcessing = false;
        });

        Navigator.pop(context);
      } catch (error) {
        setState(() {
          _isProcessing = false;
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Authentication Error'),
            content: const Text('Failed to authenticate user. Please re-enter your current password and try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Color.fromRGBO(10, 99, 61, 50)),
                ),
              ),
            ],
            backgroundColor: const Color.fromRGBO(251, 241, 221, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
      }
    }
  }
}
