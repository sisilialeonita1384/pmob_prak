import 'dart:typed_data';
import 'package:education_app/providers/don_articles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:education_app/elements/utils.dart';

class AddDonationArticlePage extends StatefulWidget {
  const AddDonationArticlePage({super.key});

  @override
  _AddDonationArticlePageState createState() => _AddDonationArticlePageState();
}

class _AddDonationArticlePageState extends State<AddDonationArticlePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameArticleController = TextEditingController();
  final TextEditingController descriptionArticleController = TextEditingController();
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(10, 99, 61, 50),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(10, 99, 61, 50),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
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
            'Add Donation Article',
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
              _buildShadowedTextField(
                controller: nameArticleController,
                labelText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the title of your article';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              _buildShadowedTextField(
                controller: descriptionArticleController,
                labelText: 'Description',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              _image != null
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: MemoryImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 10),
              _buildImageButton(),
              SizedBox(height: 45.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (_image != null) {
                      try {
                        // Upload image first to get the URL
                        String imageUrl = await Provider.of<DonationArticles>(context, listen: false)
                            .uploadImage(_image!);

                        // Add article to Firestore with image URL
                        await Provider.of<DonationArticles>(context, listen: false)
                            .addArticle(
                          nameArticleController.text,
                          imageUrl,
                          descriptionArticleController.text,
                        );
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
                                      'Article is Posted!',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                    SizedBox(height: 20.0),
                                    const Text(
                                      'Your article has been successfully posted. Thank you for sharing your insights with the community!',
                                      style: TextStyle(color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                          Color.fromRGBO(10, 99, 61, 50),
                                        ),
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
                        print("Added Article Data to Firestore");
                      } catch (error) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Error creating article $error"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      print("Please select an image");
                    }
                  }
                },
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(130, 0)),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(78, 138, 103, 50)),
                  overlayColor: MaterialStatePropertyAll(
                      Color.fromRGBO(78, 138, 103, 50)),
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
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildImageButton() {
    return GestureDetector(
      onTap: selectImage,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(10, 99, 61, 50),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 16),
            Icon(Icons.image, color: Colors.white),
            SizedBox(width: 16),
            Text(
              _image == null ? 'Select Image' : 'Image Selected',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Spacer(),
            if (_image != null)
              Container(
                margin: EdgeInsets.all(8.0),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: MemoryImage(_image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DonationArticles(),
      child: AddDonationArticlePage(),
    ),
  );
}