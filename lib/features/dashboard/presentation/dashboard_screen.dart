import 'package:flutter/material.dart';
import 'package:s_s_s/features/dashboard/presentation/discard_water.dart';
import 'package:s_s_s/features/dashboard/presentation/Remaining_water.dart';

import '../widgets/tab_bar_widget.dart';
import 'home_screen.dart';

class Dashboard_screen extends StatefulWidget {
  const Dashboard_screen({Key? key}) : super(key: key);

  @override
  State<Dashboard_screen> createState() => _Dashboard_screenState();
}

class _Dashboard_screenState extends State<Dashboard_screen> {
  int currentIndex = 0;

  List pages = <Widget>[
    const HomeScreen(),
    const RemainingWaterScreen(),
    const DiscardWaterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: Colors.white,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabBarIconButton(
                color: currentIndex == 0 ? Colors.red : Colors.grey,
                onPress: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                iconImage: Icons.home,
              ),
              TabBarIconButton(
                color: currentIndex == 1 ? Colors.red : Colors.grey,
                onPress: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                iconImage: Icons.water_drop,
              ),
              TabBarIconButton(
                color: currentIndex == 2 ? Colors.red : Colors.grey,
                onPress: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                iconImage: Icons.transfer_within_a_station,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
