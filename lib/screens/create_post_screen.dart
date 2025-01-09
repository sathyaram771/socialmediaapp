import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';

class CreatePostScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: bodyController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String postTitle = titleController.text.trim();
                String postBody = bodyController.text.trim();

                if (postTitle.isNotEmpty && postBody.isNotEmpty) {
                  final postData = {
                    "title": postTitle,
                    "body": postBody,
                  };

                  try {
                    await apiService.createPost(postData);
                    Get.snackbar('Success', 'Post created successfully');
                    await Get.toNamed('/');
                  } catch (e) {
                    Get.snackbar('Error', 'Failed to create post');
                  }
                } else {
                  Get.snackbar('Validation', 'Title and body cannot be empty');
                }
              },
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
