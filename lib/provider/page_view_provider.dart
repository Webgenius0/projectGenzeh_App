import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  late final PageController controller = PageController();

  final List<String> options = [
    'Under 24',
    '35 - 44',
    '25 - 34',
    '45 - 54',
    '55 - 65',
    '65+'
  ];

  int selectedIndex = -1;

  final List<String> findus = [
    'Google Search',
    'TikTok',
    'Searched on App Store',
    'Instagram',
    'Facebook',
    'Through a Friend',
  ];

  int selectedFindus = -1;

  final List<String> maingoal = [
    'Prevent Long-Term Chronic Conditions',
    'Promote Reproductive Health',
    'Support Detoxification and Body Health',
    'Improve Skin and Respiratory Health',
    'Educate on Product Safety',
    'Reduce Personal use of Microplastics',
  ];

  int selectedgoal = -1;
}
