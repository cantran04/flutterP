import 'package:flutter/material.dart';
import 'package:ins/models/post_model.dart';

class FolowScreen extends StatefulWidget {
  @override
  _FolowScreenState createState() => _FolowScreenState();
}

class _FolowScreenState extends State<FolowScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Padding(padding: const EdgeInsets.all(8.0), child: Row()),
      // ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    Container(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.6 / 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Container(
                        child: Image(
                          image: AssetImage(listPosts[index]),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
