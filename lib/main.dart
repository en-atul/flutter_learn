import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn/screens/activity.dart';
import 'package:learn/screens/feed.dart';
import 'package:learn/screens/post.dart';
import 'package:learn/screens/profile.dart';
import 'package:learn/screens/search.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insatgram UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _currentTab = 0;
  late PageController _pageController;


// final List<Widget> _tabs = [
//     const FeedScreen(), // see the HomeTab class below
//     const SearchScreen() // see the SettingsTab class below
//   ];


  @override
  void initState() {
    super.initState();
     _pageController = PageController();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          FeedScreen(),
          SearchScreen(),
          PostScreen(),
          ActivityScreen(),
          ProfileScreen(
          ),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
        activeColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              MaterialCommunityIcons.home_variant,
              size: 32.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AntDesign.search1,
              size: 27.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AntDesign.plussquareo,
              size: 25.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              AntDesign.hearto,
              size: 25.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
