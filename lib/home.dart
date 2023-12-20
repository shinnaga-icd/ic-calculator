import 'package:flutter/material.dart';
import 'package:ic_calculator/features/calc/calc_view.dart';
import 'package:ic_calculator/features/history/history_view.dart';
import 'package:ic_calculator/core/state/calc_history.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CalcHistory(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            const CalcView(),
            HistoryView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'calc'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'history'),
          ],
          onTap: (index) => _pageController.jumpToPage(index),
        ),
      ),
    );
  }
}
