import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/volunteers.dart';
import '../providers/donations.dart';
import '../models/history_volunteers.dart';
import '../models/history_donations.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool _isFirstTabSelected = true;

  @override
  Widget build(BuildContext context) {
    final volunteersProvider = Provider.of<Volunteers>(context);
    final donationsProvider = Provider.of<Donations>(context);

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
          _buildVolunteerHistoryWidget(volunteersProvider),
          _buildDonationHistoryWidget(donationsProvider),
        ],
      ),
    );
  }

  Widget _buildVolunteerHistoryWidget(Volunteers volunteersProvider) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: FutureBuilder<List<VolunteerHistory>>(
          future: volunteersProvider.getVolunteerHistory(),
          builder: (context, snapshot) {
            print('Snapshot connection state: ${snapshot.connectionState}');

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No volunteer history found.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return Container(
                    height: 136,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item.registeredAt.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDonationHistoryWidget(Donations donationsProvider) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: FutureBuilder<List<DonationHistory>>(
          future: donationsProvider.getDonationHistory(),
          builder: (context, snapshot) {
            print('Snapshot connection state: ${snapshot.connectionState}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No donation history found.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return Container(
                    height: 136,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                item.registeredAt.toString(),
                                style: const TextStyle(fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    " Amount: ${item.amount} ",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(10, 99, 61, 50),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
