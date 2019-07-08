import 'package:read_posts_api_momo_structure/posts.dart';

class PostsList {
  final List<Posts> myposts;

  PostsList({this.myposts});

  factory PostsList.fromJson(List<dynamic> json) {
    List<Posts> myposts = new List<Posts>();
    myposts = json.map((i) => Posts.fromJson(i)).toList();
    return new PostsList(myposts: myposts);
  }
}
