import 'package:education_app/models/vol_article.dart';
import 'package:education_app/providers/volunteers.dart';
import 'package:flutter/material.dart';

class VolunteerFormPage extends StatefulWidget {
  const VolunteerFormPage({super.key});

  @override
  _VolunteerFormPageState createState() => _VolunteerFormPageState();
}

class _VolunteerFormPageState extends State<VolunteerFormPage> {
  final Volunteers controller = Volunteers();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String? _selectedProvince;
  String? _selectedCity;

  final Map<String, List<String>> _provinceCityMap = {
    'Aceh': ['Banda Aceh', 'Lhokseumawe', 'Langsa', 'Sabang', 'Subulussalam'],
    'Sumatera Utara': [
      'Medan',
      'Binjai',
      'Tebing Tinggi',
      'Pematang Siantar',
      'Tanjungbalai'
    ],
    'Sumatera Barat': [
      'Padang',
      'Bukittinggi',
      'Payakumbuh',
      'Solok',
      'Sawahlunto'
    ],
    'Riau': ['Pekanbaru', 'Dumai'],
    'Jambi': ['Jambi'],
    'Sumatera Selatan': [
      'Palembang',
      'Lubuklinggau',
      'Prabumulih',
      'Pagar Alam'
    ],
    'Bengkulu': ['Bengkulu'],
    'Lampung': ['Bandar Lampung', 'Metro'],
    'Kepulauan Bangka Belitung': ['Pangkal Pinang'],
    'Kepulauan Riau': ['Tanjung Pinang', 'Batam'],
    'Jakarta': [
      'Jakarta Pusat',
      'Jakarta Utara',
      'Jakarta Barat',
      'Jakarta Selatan',
      'Jakarta Timur'
    ],
    'Jawa Barat': ['Bandung', 'Bogor', 'Bekasi', 'Depok', 'Sukabumi'],
    'Jawa Tengah': ['Semarang', 'Solo', 'Yogyakarta', 'Magelang', 'Purwokerto'],
    'Jawa Timur': ['Surabaya', 'Malang', 'Kediri', 'Blitar', 'Madiun'],
    'Banten': ['Serang', 'Cilegon', 'Tangerang', 'Tangerang Selatan'],
    'Bali': ['Denpasar'],
    'Nusa Tenggara Barat': ['Mataram', 'Bima'],
    'Nusa Tenggara Timur': ['Kupang'],
    'Kalimantan Barat': ['Pontianak', 'Singkawang'],
    'Kalimantan Tengah': ['Palangka Raya'],
    'Kalimantan Selatan': ['Banjarmasin', 'Banjarbaru'],
    'Kalimantan Timur': ['Samarinda', 'Balikpapan', 'Bontang'],
    'Kalimantan Utara': ['Tanjung Selor'],
    'Sulawesi Utara': ['Manado', 'Bitung', 'Tomohon', 'Kotamobagu'],
    'Sulawesi Tengah': ['Palu'],
    'Sulawesi Selatan': ['Makassar', 'Parepare', 'Palopo'],
    'Sulawesi Tenggara': ['Kendari', 'Baubau'],
    'Gorontalo': ['Gorontalo'],
    'Sulawesi Barat': ['Mamuju'],
    'Maluku': ['Ambon', 'Tual'],
    'Maluku Utara': ['Ternate', 'Tidore Kepulauan'],
    'Papua': ['Jayapura'],
    'Papua Barat': ['Manokwari', 'Sorong'],
  };

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
              'Join Volunteer',
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FutureBuilder<List<ArtikelVolunteer>>(
                future: controller.getVolunteerArticles(),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data![0].nameArticle,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _buildShadowedTextField(
                      controller: fullNameController,
                      labelText: 'Full Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    _buildShadowedTextField(
                      controller: emailController,
                      labelText: 'E-mail',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    _buildShadowedTextField(
                      controller: ageController,
                      labelText: 'Age',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    _buildShadowedDropdown(
                      value: _selectedProvince,
                      items: _provinceCityMap.keys
                          .map((province) => DropdownMenuItem<String>(
                                value: province,
                                child: Text(province),
                              ))
                          .toList(),
                      labelText: 'Province',
                      onChanged: (value) {
                        setState(() {
                          _selectedProvince = value;
                          _selectedCity = null;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your province';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    _buildShadowedDropdown(
                      value: _selectedCity,
                      items: (_selectedProvince != null
                              ? _provinceCityMap[_selectedProvince]!
                              : [])
                          .map((city) => DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              ))
                          .toList(),
                      labelText: 'City',
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your city';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.0),
                    _buildShadowedTextField(
                      controller: reasonController,
                      labelText: 'Reason for Volunteering',
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your reason for volunteering';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 45.0),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await Volunteers().addVolunteer(
                            fullNameController.text,
                            emailController.text,
                            ageController.text,
                            _selectedProvince as String,
                            _selectedCity as String,
                            reasonController.text,
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
                                        'Registration Successful!',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      const Text(
                                        'Announcement will be sent via email.',
                                        style: TextStyle(color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20.0),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
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
                          print("Added Volunteer Data to Firestore");
                        } catch (error) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content:
                                    Text("Error mendaftar volunteer $error"),
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
                          print(
                              "Error adding volunteer data to Firestore: $error");
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
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
            ]),
          ),
        ));
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

  Widget _buildShadowedDropdown({
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required String labelText,
    required void Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
        ),
        validator: validator,
        style: TextStyle(color: Colors.white),
        dropdownColor: Color.fromRGBO(78, 138, 103, 50),
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {}
}

void main() {
  runApp(VolunteerFormPage());
}
