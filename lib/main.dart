import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'screens/post_details_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/create_post_screen.dart';
import '../models/global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Global global = Global();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/post-details', page: () => PostDetailsScreen()),
        GetPage(name: '/user-profile', page: () => UserProfileScreen()),
        GetPage(name: '/create-post', page: () => CreatePostScreen()),
      ],
    );
  }
}
