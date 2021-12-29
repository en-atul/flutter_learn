import 'package:learn/models/user.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final String postImg;
  final int viewsCount;
  final bool haveComment;
  final List<String> comments;
  final bool bookmarked;
  Message(
      {required this.sender,
      required this.time,
      this.text = "",
      required this.isLiked,
      this.postImg = "",
      this.viewsCount = 0,
      required this.haveComment,
      this.bookmarked = false,
      this.comments = const [""]});
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/images/greg.jpg',
);
final User james = User(
  id: 2,
  name: 'James',
  imageUrl: 'assets/images/james.jpg',
);
final User john = User(
  id: 3,
  name: 'John',
  imageUrl: 'assets/images/john.jpg',
);
final User olivia = User(
  id: 4,
  name: 'Olivia',
  imageUrl: 'assets/images/olivia.jpg',
);
final User sam = User(
  id: 5,
  name: 'Sam',
  imageUrl: 'assets/images/sam.jpg',
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/images/sophia.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/images/steven.jpg',
);

// stories
List<User> stories = [sam, steven, olivia, john, greg, james, sophia];

//posts
List<Message> posts = [
  Message(
      sender: sam,
      time: '5 mins ago',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: true,
      viewsCount: 44,
      haveComment: false,
      comments: [
        "There is no night life in Spain. They stay up late but they get up late. That is not night life. That is delaying the day. – Ernest Hemingway",
        "Like Spain, I am bound to the past."
      ],
      postImg: 'assets/images/spain.jpg'),
  Message(
      sender: steven,
      time: '2 hrs ago',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      viewsCount: 108,
      haveComment: true,
      comments: [
        "There is no night life in Spain. They stay up late but they get up late. That is not night life. That is delaying the day. – Ernest Hemingway",
        "Like Spain, I am bound to the past."
      ],
      postImg: 'assets/images/einstein.jpg'),
  Message(
      sender: olivia,
      time: '12:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: true,
      haveComment: true,
      viewsCount: 409,
      bookmarked: true,
      comments: [
        "There is no night life in Spain. They stay up late but they get up late. That is not night life. That is delaying the day. – Ernest Hemingway",
        "Like Spain, I am bound to the past."
      ],
      postImg: 'assets/images/robert.jpeg'),
  Message(
      sender:john,
      time: '11:30 AM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: true,
      haveComment: false,
      viewsCount: 7890,
      postImg: 'assets/images/shangchi.gif'),
  Message(
      sender: greg,
      time: 'Wed, 4 days ago',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      haveComment: false,
      viewsCount: 1103,
      postImg: 'assets/images/newton.jpg'),
  Message(
      sender: sophia,
      time: '2:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      viewsCount: 471,
      haveComment: false,
      postImg: 'assets/images/iss.jpg'),
  Message(
      sender: steven,
      time: '1:30 PM',
      text: 'Hey, how\'s it going? What did you do today?',
      isLiked: false,
      haveComment: false,
      viewsCount: 340,
      postImg: 'assets/images/abominable.jpg'),
];
