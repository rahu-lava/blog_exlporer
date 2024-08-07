import 'package:flutter/material.dart';
import '../services/blog_service.dart';

class BlogDetailScreen extends StatefulWidget {
  final Blog blog;

  BlogDetailScreen({required this.blog});

  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog.title),
        actions: [
          IconButton(
            icon: Icon(
              widget.blog.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.blog.isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                widget.blog.isFavorite = !widget.blog.isFavorite;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.network(
                    widget.blog.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  widget.blog.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Add more blog details here as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
