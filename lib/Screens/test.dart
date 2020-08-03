import 'package:flutter/material.dart';
import 'package:wise/classes/category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class test extends StatefulWidget {
  static const id = 'test';
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  var data = [
    'Sports',
    'Eduction',
    'Culture',
    'Food',
    'Science',
    'Travel',
    'Work issues',
    'free time',
    'Music',
    'Movies',
    'Books',
    'Travel',
    'Hobbies',
    'Childern',
    'Pets',
    'Humor',
    'Sexual assault',
    'College Life',
    'Family Problems'
  ];

  var selected = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Icon(
                  Icons.apps,
                ),
                title: Text(
                  'Topics',
                ),
                //        backgroundColor: Colors.black,
                floating: false,
                pinned: true,
              ),
            ];
          },
          body: Stack(
            children: <Widget>[
              CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.2,
                        ),
                        delegate: SliverChildBuilderDelegate(_buildCategoryItem,
                            childCount: data.length)),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    //Category category = categories[index];
    return MaterialButton(
      onPressed: () {
        setState(() {});
      },
      elevation: 10.0,
      highlightElevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0),
      //disabledTextColor: Colors.black87,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //     if (category.icon != null) Icon(category.icon),
          //  if (category.icon != null) SizedBox(height: 5.0),
          Text(
            data[index],
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
