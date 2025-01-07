import 'package:get/get.dart';
import '../models/post_model.dart';
import '../models/comment_model.dart';
import '../models/user_model.dart';

class AppData {
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;

  AppData._internal();

  final RxList<PostModel> posts = RxList<PostModel>();
  final RxMap<int, List<CommentModel>> comments = RxMap<int, List<CommentModel>>();
  final RxMap<int, UserModel> users = RxMap<int, UserModel>();

  void addPosts(List<PostModel> newPosts) => posts.addAll(newPosts);

  void addComments(int postId, List<CommentModel> newComments) {
    comments[postId] = newComments;
  }

  void addUser(int userId, UserModel user) {
    users[userId] = user;
  }
}
