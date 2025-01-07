import 'package:dio/dio.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> fetchPosts() async {
    try {
      Response response = await _dio.get("$baseUrl/posts");
      return response.data;
    } catch (e) {
      throw Exception("Failed to fetch posts");
    }
  }

  Future<List<dynamic>> fetchComments(int postId) async {
    try {
      Response response = await _dio.get("$baseUrl/posts/$postId/comments");
      return response.data;
    } catch (e) {
      throw Exception("Failed to fetch comments");
    }
  }

  Future<Map<String, dynamic>> fetchUser(int userId) async {
    try {
      Response response = await _dio.get("$baseUrl/users/$userId");
      return response.data;
    } catch (e) {
      throw Exception("Failed to fetch user data");
    }
  }

  Future<void> createPost(Map<String, dynamic> postData) async {
    try {
      Response response = await _dio.post("$baseUrl/posts", data: postData);
      if (response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      throw Exception("Failed to create post");
    }
  }
  Future<void> createComment(Map<String, dynamic> commentData) async {
    try {
      Response response = await _dio.post("$baseUrl/comments", data: commentData);
      if (response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      throw Exception("Failed to add comment");
    }
  }
}
