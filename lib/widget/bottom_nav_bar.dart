import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smart_ahwa/view/home_view.dart';
import 'package:smart_ahwa/view/report_view.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    Widget page;
    switch (index) {
      case 0:
        page = HomeView();
        break;
      case 1:
        page = ReportView(orders: []);
        break;
      default:
        return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: GNav(
        selectedIndex: currentIndex,
        onTabChange: (index) => _onTap(context, index),
        rippleColor: Colors.grey,
        hoverColor: Colors.grey,
        haptic: true,
        curve: Curves.easeInCubic,
        duration: Duration(milliseconds: 900),
        gap: 16,
        color: Colors.grey,
        iconSize: 32,
        // ignore: deprecated_member_use
        tabBackgroundColor: Colors.brown.withOpacity(0.1),
        tabs: const [
          GButton(icon: Icons.dashboard, text: 'Dashboard'),
          GButton(icon: Icons.bar_chart, text: 'Reports'),
        ],
      ),
    );
  }
}
