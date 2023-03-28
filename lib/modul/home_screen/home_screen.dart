import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categories = [    "School",    "Tech",    "Literature",    "Nature",    "Gen-z",    "Car",    "Sport",    "Game",  ];

  int _selectedBarItemIndex = 0;

  void _selectTabBar(int value) {
    setState(() {
      _selectedBarItemIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HeaderWidget(
                  user: widget.user,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchBoxWidget(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MenuWidget(),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ExpandedSectionWidget(
                  size: MediaQuery.of(context).size,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ConstrainedBoxWidget(
                  size: MediaQuery.of(context).size,
                  categories: categories,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBarItemIndex,
        onTap: _selectTabBar,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Infos",
            icon: Icon(
              Icons.newspaper_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(
              Icons.settings_applications_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
