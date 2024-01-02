import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
import 'package:ikiternak_apps/Screen/forum/postForum.dart';
import 'package:ikiternak_apps/Screen/forum/postForum.dart';

import 'postForum.dart';

void main() {
  runApp(const ForumTernak());
}

class ForumTernak extends StatelessWidget {
  const ForumTernak({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      ),
      home: Scaffold(
        body: Stack(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    'Forum Ternak',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 7,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 16,
              top: 600,
              child: buildIconButton(
                  'assets/icon/add.png', () => postForum(context)),
            ),
            const Expanded(
              child: ForumContent(
                userName: 'Anggiat Maharasi',
                location: 'Siborongborong, Sumatera Utara',
                date: 'Feb 06, 2023',
                status:
                    'Ayam saya kebakar di dapur abis itu saya makan. Itu sebabnya kenapa ya?',
                initialReplyCount: 300,
              ),
            ),
            NavigationBottomBar(),
          ],
        ),
      ),
    );
  }
}

class ForumContent extends StatefulWidget {
  final String userName;
  final String location;
  final String date;
  final String status;
  final int initialReplyCount;

  const ForumContent({
    Key? key,
    required this.userName,
    required this.location,
    required this.date,
    required this.status,
    required this.initialReplyCount,
  }) : super(key: key);

  @override
  _ForumContentState createState() => _ForumContentState();
}

class Comment {
  final String userName;
  final String comment;

  Comment({required this.userName, required this.comment});
}

class _ForumContentState extends State<ForumContent> {
  bool isLiked = false;
  List<Comment> comments = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Positioned(
          left: 20,
          top: 100,
          child: Container(
            width: 349,
            height: 207, // Adjusted height to accommodate Like and Comment
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                const BoxShadow(
                  color: Color(0x195A5A5A),
                  blurRadius: 15,
                  offset: Offset(5, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/42x42"),
                      fit: BoxFit.fill,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 0, top: 2),
                  child: Text(
                    widget.userName,
                    style: const TextStyle(
                      color: Color(0xFF1B1B1B),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: -6.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 270, right: 12, top: 4),
                  child: Text(
                    widget.date,
                    style: const TextStyle(
                      color: Color(0xFF759488),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: -9.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 12, top: 4),
                  child: Text(
                    widget.location,
                    style: const TextStyle(
                      color: Color(0xFF769589),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: -6.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 1),
                  child: SizedBox(
                    width: 309,
                    child: Text(
                      widget.status,
                      style: const TextStyle(
                        color: Color(0xFF1B1B1B),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 275, right: 12, top: 4),
                  child: Text(
                    '${comments.length} Replies',
                    style: const TextStyle(
                      color: Color(0xFF9F9F9F),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.20,
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xFF9F9F9F),
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: isLiked
                            ? const Color(0xFF73D5AE)
                            : const Color(0xFF9F9F9F),
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    const Text(
                      'Like',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () {
                        _showCommentDialog(context);
                      },
                    ),
                    const Text(
                      'Comment',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCommentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah Komentar'),
          content: TextField(
            decoration:
                const InputDecoration(hintText: 'Masukkan komentar Anda...'),
            onSubmitted: (comment) {
              setState(() {
                comments.add(Comment(userName: 'User', comment: comment));
              });
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Proses input komentar di sini
                // Anda dapat menambahkan logika tambahan jika diperlukan
                Navigator.of(context).pop();
              },
              child: const Text('Komentar'),
            ),
          ],
        );
      },
    );
  }
}

class NavigationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                'assets/icon/home_icon.png',
                width: 40,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/diary_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiaryTernak()),
                );
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/forum_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForumTernak()),
                );
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/profile_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Userprofile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildIconButton(String assetPath, VoidCallback onPressed) {
  return IconButton(
    icon: Image.asset(
      assetPath,
      width: 70,
      height: 65,
    ),
    onPressed: onPressed,
  );
}

void postForum(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PostForumApp()),
  );
}
