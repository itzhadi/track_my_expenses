import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_my_expenses/screens/history_screen.dart';
import 'package:track_my_expenses/screens/setup_screen.dart';

import '../utils/constants.dart';
import 'add_expense_screen.dart';
import 'expenses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  final _pageNo = [Expenses(), AddExpense(), History(), Setup()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white60,
      //   title: Center(
      //     child: Text("Track My Expenses", style: kAppBarTextStyle),
      //   ),
      // ),
      body: _pageNo[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.black38,
        activeColor: Colors.black38,
        backgroundColor: Colors.white60,
        initialActiveIndex: 1,
        items: [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.add, title: 'הוסף הוצאה'),
          TabItem(icon: Icons.history_edu, title: 'היסטוריה'),
          TabItem(icon: Icons.history_edu, title: 'הגדרות'),
        ],
        onTap: (int i) {
          setState(
            () {
              selectedPage = i;
            },
          );
        },
      ),
    );
  }
}
