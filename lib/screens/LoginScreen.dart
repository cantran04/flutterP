import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ins/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignupScreen.dart';
import 'HomeScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ins/screens/PostPage.dart';

// import 'package:url_launcher_example/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isRememberMe = false;
  bool forceWebView = true;

  var _isObscured;

  void initState() {
    super.initState();
    _isObscured = true;
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 10.0),
              ),
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person_outline_rounded,
                color: Colors.black38,
              ),
              hintText: 'Số điện thoại, tên người dùng hoặc email',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPassWord() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 60,
          child: TextField(
            obscureText: _isObscured,
            // maxLength: 16,

            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 10.0),
                ),
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black38,
                ),
                hintText: 'password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
                suffixIcon: IconButton(
                  // padding: const EdgeInsets.only(right: 12.0,
                  icon: _isObscured
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassbtn() {
    return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 0),
        child: TextButton(
          onPressed: () => print('Forgot password pressed'),
          child: Text('Forgot Password?',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        ));
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                }),
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLoginbtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          fixedSize: Size.fromWidth(100),
          padding: EdgeInsets.all(20),
        ),
        child: Text("Log in",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      ),
    );
  }

  Widget buildLoginFb() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              const url = 'https://facebook.com';
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Could not launch $url';
              }
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.facebook, color: Color.fromARGB(255, 4, 77, 160)),
                SizedBox(width: 20.0),
                Text('Đăng nhập bằng tài khoản facebook',
                    style: TextStyle(
                        color: Color.fromARGB(255, 72, 19, 196),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignupbtn() {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              )
            },
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Don\'t have an Account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ))
          ]),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.black,
          child: Stack(children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'instagram',
                    style: GoogleFonts.explora(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 62.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                buildEmail(),
                SizedBox(height: 20),
                buildPassWord(),
                SizedBox(height: 10),
                buildForgotPassbtn(),
                buildRememberCb(),
                SizedBox(height: 25),
                buildLoginbtn(),
                SizedBox(height: 10),
                buildLoginFb(),
                SizedBox(height: 35),
                buildSignupbtn(),
              ],
            ))
          ])),
    );
  }
}
