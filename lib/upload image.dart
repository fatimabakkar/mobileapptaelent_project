import 'package:flutter/material.dart';
import 'dart:io';
import 'profile.dart';// Import to handle images from the file system
void main() {
  runApp(addpost());
}
class  addpost extends StatelessWidget {
  const addpost({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

