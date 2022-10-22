import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.pending), label: "Pending Tasks"),
        BottomNavigationBarItem(
            icon: Icon(Icons.check), label: "Completed Tasks"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Favorite Tasks")
      ],
    );
  }
}
