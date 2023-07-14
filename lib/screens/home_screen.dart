import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:track_my_expenses/screens/history_screen.dart';
import 'package:track_my_expenses/store/item_list.dart';
import 'package:track_my_expenses/utils/colors.dart';
import 'add_expense_screen.dart';
import 'expenses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 1;
  final _pageNo = [AddExpense(), Expenses(), History(), History()];

  @override
  Widget build(BuildContext context) => Provider<ItemList>(
        create: (_) => ItemList(),
        child: Scaffold(
          body: _pageNo[selectedPage],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/black-leather.jpg"),
                  fit: BoxFit.cover),
            ),
            child: ConvexAppBar(
              color: Colors.white60,
              activeColor: Colors.white60,
              backgroundColor: pub_dev,
              initialActiveIndex: 1,
              items: [
                TabItem(
                    icon: Icons.add_rounded,
                    title: 'הוסף',
                    fontFamily: 'BebasNeue'),
                TabItem(icon: Icons.home),
                TabItem(icon: Icons.history, title: 'היסטוריה'),
                TabItem(icon: Icons.stacked_bar_chart, title: 'סטטיסטיקה')
              ],
              onTap: (int i) {
                setState(
                  () {
                    selectedPage = i;
                  },
                );
              },
            ),
          ),
        ),
      );
}
