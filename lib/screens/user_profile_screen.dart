import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../models/user_model.dart';

class UserProfileScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final int userId = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder(
        future: apiService.fetchUser(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load user profile', style: TextStyle(color: Colors.red)));
          } else if (snapshot.hasData) {
            final Map<String, dynamic>? data = snapshot.data as Map<String, dynamic>?;
            if (data != null) {
              UserModel user = UserModel.fromJson(data);
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${user.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),
                        Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: Text('No data available'));
            }
          } else {
            return Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
