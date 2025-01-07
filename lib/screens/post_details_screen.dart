import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';

class PostDetailsScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final PostModel post = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.toNamed('/user-profile', arguments: post.userId);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(post.body, style: TextStyle(fontSize: 18)),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Comments', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: FutureBuilder(
              future: apiService.fetchComments(post.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Failed to load comments', style: TextStyle(color: Colors.red)));
                } else {
                  List<CommentModel> comments = (snapshot.data as List)
                      .map((json) => CommentModel.fromJson(json))
                      .toList();
                  return ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(comment.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(comment.body),
                          leading: Icon(Icons.comment, color: Colors.blue),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
