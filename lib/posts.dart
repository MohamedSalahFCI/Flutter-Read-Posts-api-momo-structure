class Posts {
  final String userId;
  final String id;
  final String title;
  final String body;

  Posts({this.userId, this.id, this.title, this.body});
  factory Posts.fromJson(Map<String, dynamic> json) {
    return new Posts(
        userId: json['userId'].toString(),
        id: json['id'].toString(),
        title: json['title'],
        body: json['body']);
  }
}
