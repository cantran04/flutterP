import 'package:flutter/material.dart';
import 'package:ins/models/post_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ins/screens/chatScreen.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'package:fluttericon/font_awesome_icons.dart';

import 'ProfileScreen.dart';
import 'ViewPostScreen.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int index = 0;

  @override
  Widget _buildPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 620.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage(posts[index].authorImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      posts[index].authorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(posts[index].timeAgo),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () => print('More'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(children: [
                      Text(
                        posts[index].caps,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(posts[index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  onPressed: () => print('Like post'),
                                ),
                                Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.chat),
                                  iconSize: 30.0,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ViewPostScreen(
                                          post: posts[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  '350',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          iconSize: 30.0,
                          onPressed: () => print('Save post'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GradientText(
                    'Instagram',
                    style: GoogleFonts.explora(
                      fontStyle: FontStyle.italic,
                      fontSize: 42.0,
                    ),
                    gradientType: GradientType.radial,
                    radius: 2.5,
                    colors: const [
                      Color.fromARGB(255, 0, 140, 255),
                      Color.fromARGB(255, 255, 17, 0),
                      Color.fromARGB(255, 0, 253, 228),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.live_tv),
                          iconSize: 28.0,
                          color: Colors.grey,
                          onPressed: () => print("IGTV")),
                      SizedBox(width: 16.0),
                      Container(
                        width: 35.0,
                        child: IconButton(
                          padding: EdgeInsets.only(right: 10.0),
                          icon: Icon(Icons.send_rounded),
                          iconSize: 30.0,
                          color: Colors.grey,
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(),
                              ),
                            )
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
            width: double.infinity,
            height: 100.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 10.0);
                  }
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(135, 255, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 60.0,
                          width: 60.0,
                          image: AssetImage(stories[index - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          _buildPost(0),
          _buildPost(1),
          _buildPost(2),
        ],
      ),
    );
  }
}
