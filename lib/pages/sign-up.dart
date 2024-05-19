import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Logo(),
            _FormContent(),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo ecoact.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<_FormContent> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreement = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var db = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              cursorColor: Colors.green.shade900,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.75)),
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.person, color: Colors.green.shade900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade900),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade900),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            _gap(),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Please enter a valid email';
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.75)),
                hintText: 'Enter your email',
                prefixIcon:
                    Icon(Icons.email_outlined, color: Colors.green.shade900),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade900),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade900),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            _gap(),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.75)),
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outline_rounded,
                    color: Color.fromARGB(255, 27, 94, 32)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            _gap(),
            TextFormField(
              controller: _confirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }

                if (_confirmPasswordController.text !=
                    _passwordController.text) {
                  return 'Passwords do not match';
                }

                return null;
              },
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.75)),
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outline_rounded,
                    color: Color.fromARGB(255, 27, 94, 32)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(_isConfirmPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green.shade900, width: 1.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            _gap(),
            CheckboxListTile(
              value: _agreement,
              hoverColor: Colors.green.shade900,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _agreement = value;
                });
              },
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("by Sign Up, you agree to the",
                      style: TextStyle(fontSize: 12)),
                  SizedBox(height: 2),
                  Text("Privacy Policy & Terms of Service",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (!_agreement) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'You must agree to the terms and conditions to continue',
                          ),
                        ),
                      );
                      return;
                    }
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((userCredential) {
                      final user = <String, dynamic>{
                        "username": _usernameController.text,
                        "email": _emailController.text,
                        "password": _passwordController.text,
                      };
                      db
                          .collection("users")
                          .doc(_emailController.text)
                          .set(user)
                          .then((value) {
                        print("User added successfully");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }).catchError(
                              (error) => print("Failed to add user: $error"));
                    }).catchError((error) {
                      print("Failed to create user: $error");
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => SizedBox(height: 16);
}
