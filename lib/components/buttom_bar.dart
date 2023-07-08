// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:track_my_expenses/components/home_screen.dart';
//
// import 'expenses_screen.dart';
//
// class ButtomBar extends StatefulWidget {
//   @override
//   State<ButtomBar> createState() => _ButtomBarState();
// }
//
// class _ButtomBarState extends State<ButtomBar> {
//   final _pageNo = [HomeScreen.id, Expenses.id];
//   @override
//   Widget build(BuildContext context) {
//     return ConvexAppBar(
//       initialActiveIndex: 0,
//       items: [
//         TabItem(icon: Icons.home, title: 'Home'),
//         TabItem(icon: Icons.add, title: 'Add'),
//         TabItem(icon: Icons.map, title: 'Discovery'),
//       ],
//       onTap: (int i) => Navigator.pushNamed(context, _pageNo[i]),
//     );
//   }
// }
//
// // class ButtomBar extends StatelessWidget {
// //   int selectedPage = 0;
// //   final _pageNo = [HomeScreen.id, Expenses.id];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         bottomNavigationBar: ConvexAppBar(
// //       initialActiveIndex: 0,
// //       items: [
// //         TabItem(icon: Icons.home, title: 'Home'),
// //         TabItem(icon: Icons.add, title: 'Add'),
// //         TabItem(icon: Icons.map, title: 'Discovery'),
// //       ],
// //       onTap: (int i) => Navigator.pushNamed(context, _pageNo[i]),
// //     ));
// //   }
// // }
