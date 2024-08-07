import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogService {
  static const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  static const String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'x-hasura-admin-secret': adminSecret,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey('blogs')) {
        return (data['blogs'] as List)
            .map((blog) => Blog.fromJson(blog))
            .toList();
      } else {
        throw Exception('Key "blogs" not found in response');
      }
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}

class Blog {
  final String title;
  final String imageUrl;
  bool isFavorite; // Add this property

  Blog({required this.title, required this.imageUrl, this.isFavorite = false});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'] ??
          false, // Adjust this if the API provides this info
    );
  }
}
