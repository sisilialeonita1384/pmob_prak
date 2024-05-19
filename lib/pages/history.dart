import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool _isFirstTabSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  width: 260,
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(78, 138, 103, 40),
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        left: _isFirstTabSelected ? 0 : 125,
                        child: Container(
                          width: 125,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFirstTabSelected = true;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: Text(
                                  'Volunteer',
                                  style: TextStyle(
                                    color: _isFirstTabSelected
                                        ? Color.fromRGBO(78, 138, 103, 40)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isFirstTabSelected = false;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: Text(
                                  'Donation',
                                  style: TextStyle(
                                    color: _isFirstTabSelected
                                        ? Colors.white
                                        : Color.fromRGBO(78, 138, 103, 40),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _isFirstTabSelected ? 0 : 1,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              child: ListView.builder(
                itemCount: _volunteer.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _volunteer[index];
                  return Container(
                    height: 136,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 0.1, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(78, 138, 103, 50),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                        left: 15, right: 20, bottom: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              item.postedOn,
                              style: TextStyle(fontSize: 12, color: Colors.white),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                "${item.noOfVolunteers.toString()} have joined",
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 242, 215, 0.808),
                                    fontWeight: FontWeight.bold),
                              ),
                            ])
                          ],
                        )),
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/${item.image}"),
                                ))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              child: ListView.builder(
                itemCount: _donate.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _donate[index];
                  return Container(
                    height: 136,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 0.1, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 241, 221, 50),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                        left: 15, right: 20, bottom: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              item.postedOn,
                              style: TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                " Amount: ${item.amount} ",
                                style: const TextStyle(
                                    color: Color.fromRGBO(10, 99, 61, 50),
                                    fontWeight: FontWeight.bold),
                              ),
                            ])
                          ],
                        )),
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/${item.image}"),
                                ))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Volunteer {
  final String title;
  final String subtitle;
  final int noOfVolunteers;
  final String image;
  final String postedOn;

  Volunteer(
      {required this.title,
      required this.subtitle,
      required this.noOfVolunteers,
      required this.image,
      required this.postedOn});
}

final List<Volunteer> _volunteer = [
  Volunteer(
    title:
        "Engaging Volunteers in the Fight Against Deforestation: Opportunities and Impact",
    subtitle: 'The feature, which introduced in April as part of Instagram',
    noOfVolunteers: 16,
    image: "deforestation.jpg",
    postedOn: "Yesterday",
  ),
  Volunteer(
      title: "Together, We Can Overcome: Aid Flood Victims Today!",
      subtitle: 'The feature, which introduced in April as part of Instagram',
      noOfVolunteers: 37,
      image: "climatechange.png",
      postedOn: "4 hours ago"),
];

class Donate {
  final String title;
  final String amount;
  final String image;
  final String postedOn;

  Donate(
      {required this.title,
      required this.amount,
      required this.image,
      required this.postedOn});
}

final List<Donate> _donate = [
  Donate(
    title:
         "Planting Hope, Preserving Nature: Donate Rp10,000 to Plant 1 Tree and Change the Future of the Environment!",
    amount: "Rp 300.000",
    image: "deforestation.jpg",
    postedOn: "Yesterday",
  ),
  Donate(
      title: "End Food Waste, Feed Hope: Donate to Sustainable Food Solutions!",
      amount: "Rp 100.000",
      image: "foodwaste.jpg",
      postedOn: "4 hours ago"),
];
