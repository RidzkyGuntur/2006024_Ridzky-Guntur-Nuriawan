import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  final categories = [
    "School",
    "Tech",
    "Literature",
    "Nature",
    "Gen-z",
    "Car",
    "Sport",
    "Game",
  ];

  int _selectedBarItemIndex = 0;
  _selectTabBar(int value) {
    setState(() {
      _selectedBarItemIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              orientation == Orientation.portrait
                  ? Container(
                      height: MediaQuery.of(context).padding.top,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: HeaderWidget(
                  user: widget.user,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SearchBoxWidget(),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: MenuWidget(),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpandedSectionWidget(
                        size: size,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ConstrainedBoxWidget(
                        size: size,
                        categories: categories,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
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
      },
    );
  }
}
