import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wise/Models/postModel.dart';
import 'package:wise/Models/userData.dart';
import 'package:wise/Screens/Topics.dart';
import 'package:wise/Screens/mail_screen.dart';
import 'package:wise/Screens/newPost.dart';
import 'package:wise/Screens/onboarding.dart';
import 'package:wise/Screens/search.dart';
import 'package:wise/Screens/settings.dart';
import 'package:wise/classes/DarkThemeProvider.dart';
import 'package:wise/classes/progress.dart';

import 'home_screen.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  final userData currentUser;

  Timeline({this.currentUser});

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  CollectionReference rb = Firestore.instance.collection('user');
  List<post> posts;
  List<String> followingList = [];
  List<UserResult> userResults = [];
  @override
  void initState() {
    super.initState();
    getusers();
    getTimeline();
    getFollowing();
  }

  getusers() async {
    List<UserResult> Results = [];

    QuerySnapshot snapshot = await rb.getDocuments();
    snapshot.documents.forEach((doc) {
      // print(doc.data);
      userData user = userData.FromDocument(doc);
      UserResult userResult = UserResult(user);

      Results.add(userResult);
    });
    setState(() {
      userResults = Results;
    });
  }

  getTimeline() async {
    QuerySnapshot snapshot = await timelineRef
        .document(widget.currentUser.id)
        .collection('timelinePosts')
        .orderBy('timestamp', descending: true)
        .getDocuments();
    List<post> posts =
        snapshot.documents.map((doc) => post.FromDocument(doc)).toList();
    setState(() {
      this.posts = posts;
    });
  }

  getFollowing() async {
    QuerySnapshot snapshot = await followingRef
        .document(currentUser.id)
        .collection('userFollowing')
        .getDocuments();
    setState(() {
      followingList = snapshot.documents.map((doc) => doc.documentID).toList();
    });
  }

  buildTimeline() {
    if (posts == null) {
      return SliverList(
        delegate: SliverChildListDelegate([circularProgress()]),
      );
    } else if (posts.isEmpty) {
      return SliverList(
        delegate: SliverChildListDelegate([buildUsersToFollow()]),
      );
    } else {
      return SliverList(delegate: new SliverChildListDelegate(posts));
    }
  }

  buildUsersToFollow() {
//    return StreamBuilder(
//      stream:
//          usersRef.orderBy('timestamp', descending: true).limit(30).snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) {
//          return circularProgress();
//        }
//
//        snapshot.data.documents.forEach((doc) {
//          userData user = userData.FromDocument(doc);
//          final bool isAuthUser = currentUser.id == user.id;
//          final bool isFollowingUser = followingList.contains(user.id);
//          print(doc.toString());
//
//          // remove auth user from recommended list
//          if (isAuthUser) {
//            return;
//          } else if (isFollowingUser) {
//            return;
//          } else {
//            UserResult userResult = UserResult(user);
//            userResults.add(userResult);
//            print(userResults.length);
//          }
//        });
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.2),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person_add,
                  color: Theme.of(context).primaryColor,
                  size: 30.0,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  "Find Users to Follow",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Column(children: userResults),
        ],
      ),
    );
//      },
//    );
  }

  @override
  Widget build(context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // backgroundColor: themeChange.darkTheme ? Colors.grey[900] : Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('hgfd');
          Navigator.pushNamed(context, newPost.id);
        },
        backgroundColor:
            themeChange.darkTheme ? Colors.grey[600] : Colors.black,
        elevation: 10,
        child: IconButton(
          icon: Icon(
            Icons.edit,
            color: !themeChange.darkTheme ? Colors.white : Colors.black,
          ),
        ),
      ),

      // backgroundColor: Colors.black12,
      body: RefreshIndicator(
        onRefresh: () => getTimeline(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              bottom: PreferredSize(
                child: Container(
                  color: themeChange.darkTheme ? Colors.white : Colors.black,
                  height: 0.3,
                ),
                preferredSize: Size.fromHeight(4.0),
              ),
              titleSpacing: 5,
              title: Text(
                "Wise",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              leading: IconButton(
                padding: EdgeInsets.all(5),
                //iconSize: 30.0,
                icon: Icon(
                  Icons.email,
                  //size: 35.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Mail(),
                    ),
                  );
                },
              ),

              centerTitle: true,

              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(5),
                  //iconSize: 30.0,
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(5),
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => setting(),
                      ),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(5),
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onboarding(),
                      ),
                    );
                  },
                )
              ],
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
