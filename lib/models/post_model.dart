class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String caps;
  String imageUrl;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.caps,
    required this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Bé Thị Âu Mỹ',
    authorImageUrl: 'assets/images/post1.jpg',
    timeAgo: '5 min',
    caps: 'Everything you can imagine is real',
    imageUrl: 'assets/images/post1.jpg',
  ),
  Post(
    authorName: '-.-',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '10 min',
    caps: 'Hello heart eyes for you',
    imageUrl: 'assets/images/post0.jpg',
  ),
  Post(
    authorName: 'Tony',
    authorImageUrl: 'assets/images/user3.png',
    timeAgo: '15 min',
    caps: 'Life\'s too mysterious to take too serious',
    imageUrl: 'assets/images/post2.jpg',
  ),
];

final List<String> stories = [
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
  'assets/images/user0.png',
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
];

final List<String> listPosts = [
  'assets/images/pf/post-1.jpg',
  'assets/images/pf/post-2.jpg',
  'assets/images/pf/post-3.jpg',
  'assets/images/pf/post-4.jpg',
  'assets/images/pf/post-5.jpg',
  'assets/images/pf/post-6.jpg',
  'assets/images/pf/post-7.jpg',
  'assets/images/pf/post-8.jpg',
  'assets/images/pf/post-9.jpg',
];
