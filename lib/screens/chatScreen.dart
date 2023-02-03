import 'package:flutter/material.dart';
import 'package:ins/screens/ChatDetailScreen.dart';
import 'package:ins/utils/colors.dart';
import 'package:ins/models/chat_json.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Padding(padding: EdgeInsets.only(top: 40, left: 20));

    return Scaffold(
      appBar: PreferredSize(
        // padding: EdgeInsets.all(4.0),
        preferredSize: Size.fromHeight(85.0),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  children: [
                    IconButton(
                      splashRadius: 15,
                      icon: Icon(Icons.arrow_back_ios, color: textBlack),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Chats",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 10),
                child: Row(
                  children: [
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.video_call),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                    SizedBox(width: 5),
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    SizedBox(width: 30)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // appbar: getAppBar(),

      body: getBody(size),
      bottomSheet: getBottomSheet(),
    );
  }

  // Widget getAppBar() {
  //   return PreferredSize(
  //     preferredSize: Size.fromHeight(55),
  //     child: SafeArea(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Row(
  //             children: [
  //               IconButton(
  //                 splashRadius: 15,
  //                 icon: Icon(Icons.arrow_back_ios, color: textBlack),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //               ),
  //               SizedBox(width: 10),
  //               Text(
  //                 "Chats",
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               IconButton(
  //                 splashRadius: 20,
  //                 // icon: Icon(Feather.video),
  //                 icon: Icon(Icons.camera),
  //                 onPressed: () {},
  //               ),
  //               SizedBox(width: 5),
  //               IconButton(
  //                 splashRadius: 20,
  //                 icon: Icon(Icons.camera),
  //                 // icon: Icon(Feather.edit),
  //                 onPressed: () {},
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget getBody(size) {
    return ListView(
      children: [
        // SizedBox(height: 20.0),
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: size.width * 0.375,
                  height: 45,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Center(
                      child: Text(
                        "Chats",
                        style: TextStyle(
                            color: selectedIndex == 0
                                ? textBlack
                                : textBlack.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.375,
                  height: 45,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Center(
                      child: Text(
                        "Rooms",
                        style: TextStyle(
                            color: selectedIndex == 1
                                ? textBlack
                                : textBlack.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: size.width,
              decoration: BoxDecoration(color: bgGrey),
            ),
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getChats(size),
            getRooms(size),
          ],
        ),
      ],
    );
  }

  Widget getChats(size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: 41,
            width: (size.width - 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: bgGrey.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: TextField(
                  cursorColor: textBlack.withOpacity(0.5),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: textBlack.withOpacity(0.5),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: textBlack.withOpacity(0.5),
                      fontSize: 18.0,
                    ),
                  )),
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(chats.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ChatDetailScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: (size.width - 20) * 0.15,
                      width: (size.width - 20) * 0.15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(chats[index].profile),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          chats[index].dateTime == "now"
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: bgWhite),
                                        color: success),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: (size.width - 20) * 0.42,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chats[index].userName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${chats[index].description} • ${chats[index].dateTime}",
                              style: TextStyle(
                                  fontSize: 16, height: 1, color: textGrey),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   width: (size.width - 20) * 0.15,
                    //   alignment: Alignment.centerRight,
                    //   child: Icon(
                    //     Icons.camera,
                    //     color: textBlack.withOpacity(0.5),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget getRooms(size) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            // SvgPicture.asset("assets/images/video.svg", width: 100),
            SizedBox(height: 20),
            Text(
              "Video Chat With Anyone",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Invite up to 50 people to join a video chat, even if they don't have Instagram or Messenger.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, height: 1.5, color: textBlack.withOpacity(0.8)),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primary,
              ),
              child: Center(
                child: Text("Create Room", style: TextStyle(color: textWhite)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheet() {
    if (selectedIndex == 0) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
            color: bgLightGrey,
            border: Border(
                top: BorderSide(width: 1, color: bgGrey.withOpacity(0.3)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera,
              color: primary,
            ),
            SizedBox(width: 10),
            Text(
              "Camera",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: primary),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 1,
      );
    }
  }
}
