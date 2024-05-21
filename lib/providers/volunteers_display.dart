import 'package:education_app/pages/history.dart';
import 'package:flutter/material.dart';

class VolunteerDisplayProvider with ChangeNotifier {
  List<VolunteerDisplay> _VolunteerDisplayItem = [];

  List<VolunteerDisplay> get VolunteerDisplayItem {
    return [..._VolunteerDisplayItem];
  }

  final List<VolunteerDisplay> _volunteerDisplay = [
    VolunteerDisplay(
      title:
          "Engaging Volunteers in the Fight Against Deforestation: Opportunities and Impact",
      subtitle: 'The feature, which introduced in April as part of Instagram',
      noOfVolunteersDisplay: 16,
      image: "deforestation.jpg",
      postedOn: "Yesterday",
    ),
    VolunteerDisplay(
        title: "Together, We Can Overcome: Aid Flood Victims Today!",
        subtitle: 'The feature, which introduced in April as part of Instagram',
        noOfVolunteersDisplay: 37,
        image: "climatechange.png",
        postedOn: "4 hours ago"),
    VolunteerDisplay(
        title: "Together, We Can Overcome: Aid Flood Victims Today!",
        subtitle: 'The feature, which introduced in April as part of Instagram',
        noOfVolunteersDisplay: 37,
        image: "climatechange.png",
        postedOn: "4 hours ago"),
    VolunteerDisplay(
        title: "Together, We Can Overcome: Aid Flood Victims Today!",
        subtitle: 'The feature, which introduced in April as part of Instagram',
        noOfVolunteersDisplay: 37,
        image: "climatechange.png",
        postedOn: "4 hours ago"),
    VolunteerDisplay(
        title: "Together, We Can Overcome: Aid Flood Victims Today!",
        subtitle: 'The feature, which introduced in April as part of Instagram',
        noOfVolunteersDisplay: 37,
        image: "climatechange.png",
        postedOn: "4 hours ago"),
  ];

  List<VolunteerDisplay> get volunteerDisplayList {
    return [..._volunteerDisplay];
  }

  void addVolunteerDisplay(VolunteerDisplay volunteerDisplay) {
    _volunteerDisplay.add(volunteerDisplay);
    notifyListeners();
  }
}
