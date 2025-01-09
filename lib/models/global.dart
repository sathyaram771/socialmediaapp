import '../api/api_service.dart';
import '../models/post_model.dart';

class Global {
  final ApiService apiService = ApiService();
  static late List<PostModel> posts;

  Global() {
    posts = [];
    apiService.fetchPosts().then(
          (dynamicList) => posts = dynamicList.map((item) => PostModel.fromJson(item)).toList(),
    );
  }
}
