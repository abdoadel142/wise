import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise/Models/postModel.dart';
import 'package:wise/Screens/home_screen.dart';
import 'package:wise/classes/progress.dart';

class topicScreen extends StatefulWidget {
  final String topicname;
  topicScreen({this.topicname});

  @override
  _topicScreenState createState() =>
      _topicScreenState(topicname: this.topicname);
}

class _topicScreenState extends State<topicScreen> {
  final String topicname;
  _topicScreenState({this.topicname});
  List<post> posts;
  @override
  void initState() {
    getTimeline();
    super.initState();
  }

  getTimeline() async {
    QuerySnapshot snapshot = await topicsRef
        .document(topicname)
        .collection('topicPosts')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<post> posts =
        snapshot.documents.map((doc) => post.FromDocument(doc)).toList();
    setState(() {
      this.posts = posts;
    });
  }

  buildTimeline() {
    if (posts == null) {
      return SliverList(
        delegate: SliverChildListDelegate([circularProgress()]),
      );
    } else {
      return SliverList(delegate: new SliverChildListDelegate(posts));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
      body: RefreshIndicator(
        onRefresh: () => getTimeline(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                topicname,
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
              ),

              //     backgroundColor: Colors.black,
              elevation: 0,
              floating: true,
            ),
            buildTimeline()
          ],
        ),
      ),
    );
  }
}
