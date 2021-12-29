import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learn/components/gradient_outline.dart';
import 'package:learn/models/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Feather.camera),
              onPressed: () {},
              color: Colors.black,
            );
          },
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 35.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Feather.send),
            onPressed: () {},
            color: Colors.black,
          )
        ],
        elevation: 0.2,
      ),
      body: Column(
        children: [
          Container(
            height: 110,
            color: Colors.white24,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.white24,
                height: 104,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            MyOutlinedButton(
                                onPressed: () {},
                                gradient: const LinearGradient(
                                    colors: [Colors.indigo, Colors.pink]),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(stories[index].imageUrl),
                                    radius: 28,
                                  ),
                                )),
                            const SizedBox(height: 6.0),
                            Text(
                              stories[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          const Divider(
            thickness: .2,
            color: Colors.grey,
            height: 0,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage(stories[index].imageUrl),
                                        radius: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 7.0),
                                        child: Text(
                                          posts[index].sender.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.more_horiz),
                                tooltip: 'Navigation menu',
                                onPressed: () {},
                              ),
                            ],
                          ),
                          // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                          Container(
                              child: Image.asset(
                            posts[index].postImg,
                            fit: BoxFit.cover,
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: posts[index].isLiked
                                        ? const Icon(
                                            Ionicons.heart,
                                            color: Colors.red,
                                          )
                                        : const Icon(Ionicons.heart_outline),
                                    tooltip: 'Navigation menu',
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Ionicons.chatbubble_outline,
                                      size: 22.0,
                                    ),
                                    tooltip: 'Navigation menu',
                                    onPressed: () {},
                                  ),
                                  const Icon(
                                    Feather.send,
                                    size: 22.0,
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: posts[index].bookmarked
                                    ? const Icon(
                                        FontAwesome.bookmark,
                                      )
                                    : const Icon(FontAwesome.bookmark_o),
                                tooltip: 'Navigation menu',
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                posts[index].viewsCount.toString() + ' Views',
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              )),
                          posts[index].comments.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, bottom: 10.0),
                                  child: Column(
                                      children: posts[index]
                                          .comments
                                          .map((item) => Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 3),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      color: Colors.black87),
                                                ),
                                              ))
                                          .toList()),
                                )
                              : const Text(
                                  "hv",
                                  style: TextStyle(color: Colors.black87),
                                ),
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                posts[index].time,
                                style: const TextStyle(color: Colors.grey),
                              )),
                          const Divider(
                            thickness: .2,
                            color: Colors.grey,
                            height: 0,
                          ),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
