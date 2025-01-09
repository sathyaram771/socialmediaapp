import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../models/post_model.dart';
import '../models/global.dart';

class HomeScreen extends StatefulWidget {
  static final GlobalKey<_HomeScreenState> homeScreenKey = GlobalKey<_HomeScreenState>();
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  List<PostModel> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    // Simulating an API call with a delay
    await Future.delayed(Duration(seconds: 2));
    posts = Global.posts; // Replace with an actual API call if needed
    setState(() {
      isLoading = false; // Data has been fetched, stop showing loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator while fetching
          : posts.isNotEmpty
          ? buildPostList()
          : Center(child: Text('No posts available')), // Show if no posts are found
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Get.toNamed('/create-post');
          setState(() {});
        },
      ),
    );
  }

  Widget buildPostList() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                post.title[0].toUpperCase(),
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
            onTap: () {
              Get.toNamed('/post-details', arguments: post);
            },
          ),
        );
      },
    );
  }
}
