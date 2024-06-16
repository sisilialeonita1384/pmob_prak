import 'package:education_app/models/donation.dart';
import 'package:education_app/pages/history.dart';
import 'package:education_app/providers/donations.dart';
import 'package:flutter/material.dart';

class DonateFormPage extends StatefulWidget {
  final String title;

  const DonateFormPage({Key? key, required this.title}) : super(key: key);

  @override
  _DonateFormPageState createState() => _DonateFormPageState();
}

class _DonateFormPageState extends State<DonateFormPage> {
  final Donations controller = Donations();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameDonationController =
      TextEditingController();
  final TextEditingController emailDonationController = TextEditingController();
  final TextEditingController ageDonationController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(10, 99, 61, 50),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(10, 99, 61, 50),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.red),
          ),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Donate Now',
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
        backgroundColor: Color.fromRGBO(251, 241, 221, 50),
        body: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(10, 99, 61, 50),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 30.0),
                _buildShadowedTextField(
                  controller: fullNameDonationController,
                  labelText: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30.0),
                _buildShadowedTextField(
                  controller: ageDonationController,
                  labelText: 'Age',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30.0),
                _buildShadowedTextField(
                  controller: paymentController,
                  labelText: 'Amount of Payment',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the amount of payment';
                    }
                    return null;
                  },
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                SizedBox(height: 45.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await controller.addDonation(
                          fullNameDonationController.text,
                          emailDonationController.text,
                          ageDonationController.text,
                          paymentController.text,
                          widget.title,
                        );
                        showSuccessDialog(context);
                        print("Added Donation Data to Firestore");
                      } catch (error) {
                        showErrorDialog(context, error);
                      }
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(120, 40)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(10, 99, 61, 50)),
                    overlayColor: MaterialStateProperty.all(
                        Color.fromRGBO(78, 138, 103, 50)),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShadowedTextField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?)? validator,
    int maxLines = 1,
    TextStyle? style,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
        ),
        validator: validator,
        maxLines: maxLines,
        style: style,
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(251, 241, 221, 50),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color.fromRGBO(10, 99, 61, 50),
                  size: 100,
                ),
                SizedBox(height: 20.0),
                const Text(
                  'Thank You for Your Donation!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 20.0),
                const Text(
                  'We greatly appreciate your generous contribution. Your support helps us continue our mission and make a positive impact.',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(10, 99, 61, 50)),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showErrorDialog(BuildContext context, error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Error mendaftar donasi: $error"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
