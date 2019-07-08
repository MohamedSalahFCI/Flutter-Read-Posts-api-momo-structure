import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:read_posts_api_momo_structure/posts.dart';
import 'package:read_posts_api_momo_structure/postcall.dart';

class PeopleReadingWidget extends StatefulWidget {
  @override
  _PeopleReadingWidgetState createState() => _PeopleReadingWidgetState();
}

class _PeopleReadingWidgetState extends State<PeopleReadingWidget> {
  final String _url = "https://jsonplaceholder.typicode.com/posts";
  List _data;

  Future<PostsList> getData() async {
    var res = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});

    final _resBody = json.decode(res.body);
    return new PostsList.fromJson(_resBody);
  }

  Widget _listView(_data) => new ListView.builder(
        itemCount: _data == null ? 0 : _data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[new Text(_data[index].title)],
          );
        },
      );

/*
  Widget _listView(_data) => new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[new Text(_data[1].title)],
          )
        ],
      );
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("read PostsList title "),
      ),
      body: FutureBuilder<PostsList>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //hna ana ba3at l data 3la tool 3shan ahndelha foo2 fel widget b2a lsa hashof l klam dh s7 wla eh ?
            //print(snapshot.data.title);
            return _listView(snapshot.data.myposts);
          } else if (snapshot.hasError) {
            return new Text("${snapshot.error}");
          }
          return new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}
