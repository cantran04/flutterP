import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginScreen.dart';
import 'SignupScreen.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WelcomScreen extends StatefulWidget {
  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Color.fromRGBO(0, 0, 0, 1),
        child: Stack(
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GradientText(
                    'Instagram',
                    style: GoogleFonts.explora(
                      fontStyle: FontStyle.italic,
                      fontSize: 58.0,
                    ),
                    gradientType: GradientType.radial,
                    radius: 2.5,
                    colors: const [
                      Color.fromARGB(255, 0, 140, 255),
                      Color.fromARGB(255, 255, 17, 0),
                      Color.fromARGB(255, 0, 253, 228),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(90), // Image radius
                      // child: Image.network(
                      //     'https://i2.wp.com/blogdeptunhien.com/wp-content/uploads/2020/06/tro-thanh-co-gai-xinh-dep.jpg?fit=660%2C380&ssl=1',
                      //     fit: BoxFit.cover),
                      child: Image(
                        image: AssetImage('assets/images/user2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text('trancan',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    fixedSize: Size.fromWidth(100),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Text("Log in",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      //backgroundColor: Colors.white, // background
                      primary: Colors.white, // foreground
                    ),
                    child: Text('Switch accounts',
                        style: TextStyle(color: Colors.blue, fontSize: 15)),
                    onPressed: () {
                      //Code Here
                    },
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?',
                        style: TextStyle(color: Colors.grey, fontSize: 15)),
                    TextButton(
                      style: TextButton.styleFrom(
                        //backgroundColor: Colors.white, // background
                        primary: Colors.white, // foreground
                      ),
                      child: Text('Sig up',
                          style: TextStyle(color: Colors.blue, fontSize: 15)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                        );
                      },
                    )
                  ],
                )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
