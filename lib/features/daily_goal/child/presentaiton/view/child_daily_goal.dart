import 'package:flutter/material.dart';

class ChildDailyGoal extends StatelessWidget {
  const ChildDailyGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Daily Goal Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Child Daily Goal Screen!'),
      ),
    );
  }
}