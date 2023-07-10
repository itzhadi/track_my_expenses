import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:track_my_expenses/screens/history_screen.dart';
import 'add_expense_screen.dart';
import 'expenses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  final _pageNo = [AddExpense(), Expenses(), History()];

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
          TabItem(icon: Icons.add_rounded, title: 'הוסף'),
          TabItem(icon: Icons.home, title: 'בית'),
          TabItem(icon: Icons.history, title: 'היסטוריה'),
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
