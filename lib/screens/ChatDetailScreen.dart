import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:ins/utils/colors.dart';
import 'package:ins/models/chat_detail_json.dart';
import 'package:ins/models/chat_json.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart' show KeyboardAvoider;
import 'package:keyboard_actions/keyboard_actions.dart';

class ChatDetailScreen extends StatefulWidget {
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(155),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                        // padding: EdgeInsets.only(left: 30),
                        splashRadius: 20,
                        icon: Icon(Icons.arrow_back_ios, color: textBlack),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(height: 20),
                    Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(chats[0].profile),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 15),
                    Text(
                      chats[0].userName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.video_call),
                      iconSize: 30,
                      onPressed: () {}),
                  SizedBox(width: 5),
                  IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.info),
                      iconSize: 30,
                      onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
      body: getBody(size),
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
  //                 splashRadius: 20,
  //                 icon: Icon(Icons.arrow_back_ios, color: textBlack),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 }
  //               ),
  //               SizedBox(width: 10),
  //               Container(
  //                 height: 33,
  //                 width: 33,
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   image: DecorationImage(
  //                     image: NetworkImage(chats[0].profile),
  //                     fit: BoxFit.cover
  //                   )
  //                 ),
  //               ),
  //               SizedBox(width: 15),
  //               Text(
  //                 chats[0].userName,
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               )
  //             ],
  //           ),
  //           Row(
  //             children: [
  //               IconButton(
  //                 splashRadius: 20,
  //                 icon: Icon(Icons.video_call),
  //                 onPressed: () {}
  //               ),
  //               SizedBox(width: 5),
  //               IconButton(
  //                 splashRadius: 20,
  //                 icon: Icon(Icons.info),
  //                 onPressed: () {}
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget getBody(size) {
    return KeyboardAvoider(
      autoScroll: true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: size.height * 0.73,
              child: ListView(
                  children: List.generate(chatDetails.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ChatBubbles(
                    isMe: chatDetails[index].isMe,
                    profile: chatDetails[index].profile,
                    message: chatDetails[index].message,
                    messageNo: chatDetails[index].messageNo,
                    key: null,
                  ),
                );
              })),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 15, bottom: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: bgGrey.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Container(
                          width: (size.width - 40) * 0.47,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: TextField(
                              cursorColor: textBlack.withOpacity(0.5),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Message...",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: textBlack.withOpacity(0.5))),
                            ),
                          ),
                        ),
                        Container(
                          width: (size.width - 40) * 0.31,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.mic),
                              Icon(Icons.image),
                              Icon(Icons.sticky_note_2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubbles extends StatelessWidget {
  final bool isMe;
  final String profile, message;
  final int messageNo;

  const ChatBubbles(
      {required Key? key,
      required this.isMe,
      required this.profile,
      required this.message,
      required this.messageNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusMessage(messageNo),
                color: bgGrey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profile), fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusMessage(messageNo),
                color: bgGrey.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  getBorderRadiusMessage(messageNo) {
    if (isMe) {
      if (messageNo == 1) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if (messageNo == 2) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        );
      } else if (messageNo == 3) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    } else {
      if (messageNo == 1) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if (messageNo == 2) {
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else if (messageNo == 3) {
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    }
  }
}
