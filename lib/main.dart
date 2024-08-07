import 'package:blog_exlporer/screens/blog_list_screen.dart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BlogExplorerApp());
}

class BlogExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlogListScreen(),
    );
  }
}
