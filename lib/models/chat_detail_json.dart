// import 'dart:ffi';

// const chatDetails = [
//   {},
//   {
//     "id": 2,
//     "isMe": false,
//     "profile": "https://logowik.com/content/uploads/images/flutter5786.jpg",
//     "message": "How are you doing?",
//     "messageNo": 3,
//   },
//   {
//     "id": 3,
//     "isMe": true,
//     "profile": "",
//     "message": "Hi!",
//     "messageNo": 1,
//   },
//   {
//     "id": 4,
//     "isMe": true,
//     "profile": "",
//     "message": "Fine.",
//     "messageNo": 2,
//   },
//   {
//     "id": 5,
//     "isMe": true,
//     "profile": "",
//     "message": "Tngai mon khernh u tv aeon2",
//     "messageNo": 3,
//   },
//   {
//     "id": 6,
//     "isMe": false,
//     "profile": "https://logowik.com/content/uploads/images/flutter5786.jpg",
//     "message": "Nhuii mix min hav pg",
//     "messageNo": 0,
//   },
//   {
//     "id": 6,
//     "isMe": true,
//     "profile": "",
//     "message": "Eng hav ter tae yg tver min lir ey na",
//     "messageNo": 1,
//   },
//   {
//     "id": 6,
//     "isMe": true,
//     "profile": "",
//     "message": "😒😒😒",
//     "messageNo": 3,
//   },
//   {
//     "id": 7,
//     "isMe": false,
//     "profile": "https://logowik.com/content/uploads/images/flutter5786.jpg",
//     "message": "Tv oy ke somtos",
//     "messageNo": 1,
//   },
//   {
//     "id": 8,
//     "isMe": false,
//     "profile": "https://logowik.com/content/uploads/images/flutter5786.jpg",
//     "message": "Lv nv na c ey ot?",
//     "messageNo": 3,
//   },
//   {
//     "id": 9,
//     "isMe": true,
//     "profile": "",
//     "message": "Tos",
//     "messageNo": 1,
//   },
//   {
//     "id": 10,
//     "isMe": true,
//     "profile": "",
//     "message": "C nv na?",
//     "messageNo": 3,
//   },
//   {
//     "id": 11,
//     "isMe": false,
//     "profile": "https://logowik.com/content/uploads/images/flutter5786.jpg",
//     "message": "Bunchon IFL?",
//     "messageNo": 0,
//   },
//   {
//     "id": 12,
//     "isMe": true,
//     "profile": "",
//     "message": "Okay",
//     "messageNo": 0,
//   },
// ];

class chatDetail {
  int id;
  bool isMe;
  String profile;

  String message;
  int messageNo;

  chatDetail({
    required this.id,
    required this.isMe,
    required this.profile,
    required this.message,
    required this.messageNo,
  });
}

final List<chatDetail> chatDetails = [
  chatDetail(
    id: 1,
    isMe: false,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Hey!",
    messageNo: 1,
  ),
  chatDetail(
    id: 2,
    isMe: false,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "How are you doing!",
    messageNo: 2,
  ),
  chatDetail(
    id: 3,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Hi!",
    messageNo: 1,
  ),
  chatDetail(
    id: 4,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Fine!",
    messageNo: 2,
  ),
  chatDetail(
    id: 5,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Tngai mon khernh u tv aeon2",
    messageNo: 3,
  ),
  chatDetail(
    id: 6,
    isMe: false,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Nhuii mix min hav pg!",
    messageNo: 0,
  ),
  chatDetail(
    id: 6,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Eng hav ter tae yg tver min lir ey na",
    messageNo: 1,
  ),
  chatDetail(
    id: 6,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "😒😒😒!",
    messageNo: 3,
  ),
  chatDetail(
    id: 7,
    isMe: false,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Tv oy ke somtos",
    messageNo: 1,
  ),
  chatDetail(
    id: 8,
    isMe: false,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Lv nv na c ey ot?",
    messageNo: 3,
  ),
  chatDetail(
    id: 9,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Tos",
    messageNo: 1,
  ),
  chatDetail(
    id: 10,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "C nv na?",
    messageNo: 3,
  ),
  chatDetail(
    id: 11,
    isMe: false,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Bunchon IFL?",
    messageNo: 0,
  ),
  chatDetail(
    id: 12,
    isMe: true,
    profile: "https://logowik.com/content/uploads/images/flutter5786.jpg",
    message: "Okay!",
    messageNo: 0,
  ),
];
