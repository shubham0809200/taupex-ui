import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTabs({required int index, required int currentPage}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: const EdgeInsets.only(right: 5),
    height: 4,
    width: 25,
    decoration: BoxDecoration(
      color:
          currentPage == index ? Colors.white : Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
