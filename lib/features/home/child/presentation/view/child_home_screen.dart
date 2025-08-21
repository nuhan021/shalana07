import 'package:flutter/material.dart';

class ChildHomeScreen extends StatelessWidget {
  const ChildHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Child Home Screen!'),
      ),
    );
  }
}