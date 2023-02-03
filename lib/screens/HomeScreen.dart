import 'package:flutter/material.dart';
import 'package:ins/models/post_model.dart';
import 'package:ins/screens/PostPage.dart';
import 'package:ins/screens/ProfileScreen.dart';
import 'package:ins/screens/SearchScreen.dart';
import 'package:ins/screens/FolowScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(index),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() => index = value),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32.0,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32.0,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Background color
                    onPrimary: Colors.grey,
                    shadowColor: Color.fromARGB(255, 0, 177, 216),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => print('Upload photo'),
                  child: Icon(
                    Icons.add,
                    size: 35.0,
                    color: Colors.black,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 32.0,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage('assets/images/user2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return PostPage(); // Create this function, it should return your first page as a widget
      case 1:
        return SearchScreen(); // Create this function, it should return your second page as a widget
      case 2:
      // return _buildThirdPage(); // Create this function, it should return your third page as a widget
      case 3:
        return FolowScreen(); // Create this function, it should return your fourth page as a widget
      case 4:
        return ProfileScreen();
    }

    return Center(
      child: Text("There is no page builder for this index."),
    );
  }
}
