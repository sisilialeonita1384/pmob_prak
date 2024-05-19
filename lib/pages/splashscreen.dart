import 'package:education_app/elements/custom_shape.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: ClipPath(
              clipper: CustomShape(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            floating: false,
            pinned: true,
            elevation: 0.0,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: 250,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo ecoact.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signin");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900,
                          fixedSize: const Size(
                            50,
                            50,
                          ),
                        ),
                        child: const Text(
                          "Get To Know More",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  