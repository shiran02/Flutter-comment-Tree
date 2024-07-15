import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';

import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:tree/data/user_reply.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: CommentTreeWidget<Comment, UserReply>(
          // Main Comment Data--------------------------------------------------
          Comment(
              avatar: 'tree/assets/avatar_1.png',
              userName: 'SK86',
              content: 'felangel made felangel/cubit_and_beyond public '),
          [
            // Reply Data ------------------------------------------------------
            UserReply(
                avatar: 'null',
                userName: 'aruwa',
                reply: 'A Dart template generator which helps teams'),
            UserReply(
                avatar: 'null',
                userName: 'skae',
                reply:
                    'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
            UserReply(
                avatar: 'null',
                userName: 'Shiran',
                reply: 'A Dart template generator which helps teams'),
            UserReply(
                avatar: 'null',
                userName: 'Kumara',
                reply:
                    'A Dart template generator which helps teams generator which helps teams '),
          ],
          treeThemeData: TreeThemeData(lineColor: Colors.black, lineWidth: 3),

          // Roont profile Image-----------------------------------------------
          avatarRoot: (context, data) => const PreferredSize(
            preferredSize: Size.fromRadius(18),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/avatar_2.png'),
            ),
          ),

          // child Profile Image -----------------------------------------------
          avatarChild: (context, data) => const PreferredSize(
            preferredSize: Size.fromRadius(12),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/avatar_1.png'),
            ),
          ),

          // Content Root ------------------------------------------------------

          contentRoot: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.userName}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.content}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const DefaultTextStyle(
                  style: TextStyle(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          'Reply',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },

          // Content Child ------------------------------------------------------
          contentChild: (context, data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.userName}',
                        style: TextStyle(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data.reply}',
                        style: const TextStyle(),
                      ),
                    ],
                  ),
                ),
                const DefaultTextStyle(
                  style: TextStyle(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          'Reply',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
