import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
import 'package:ikiternak_apps/Screen/forum/postForum.dart';
import 'package:ikiternak_apps/environtment.dart';
import 'package:ikiternak_apps/main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() {
  runApp(const ForumTernak());
}

class ForumTernak extends StatelessWidget {
  const ForumTernak({Key? key});
  Future<List<Map<String, dynamic>>> loadPage() async {
    await Future.delayed(const Duration(milliseconds: 800));
    var token = prefs.getString('jwtToken');
    const String path = '/forumternak';
    String? apiURL = Env.apiURL! + path;
    var response = await http.get(
      Uri.parse(apiURL),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    List<Map<String, dynamic>> result =
        List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      ),
      home: Scaffold(
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: loadPage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Map<String, dynamic>> forumData = snapshot.data!;
              return ListView.builder(
                  itemCount: forumData.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const Column(
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
                      );
                    } else {
                      Map<String, dynamic> data = forumData[index - 1];
                      DateTime dateFormat = DateTime.parse(data['createdAt']);
                      String formatDate =
                          DateFormat("MMM dd, yyyy").format(dateFormat);
                      return ForumContent(
                        userName: data['user']['name'],
                        location: "TEST",
                        date: formatDate,
                        status: data['description'],
                        initialReplyCount: 0,
                        userNameAlignment: CrossAxisAlignment.start,
                        locationAlignment: CrossAxisAlignment.end,
                        dateAlignment: CrossAxisAlignment.start,
                        statusAlignment: CrossAxisAlignment.center,
                      );
                    }
                  }
                  // children: const [
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 16.0,
                  //           vertical: 4.0,
                  //         ),
                  //         child: Text(
                  //           'Forum Ternak',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 18,
                  //             fontFamily: 'Poppins',
                  //             fontWeight: FontWeight.w500,
                  //             height: 7,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   ForumContent(
                  //     userName: 'Anggiat Maharasi',
                  //     location: 'Siborongborong, Sumatera Utara',
                  //     date: 'Feb 06, 2023',
                  //     status:
                  //         'Ayam saya kebakar di dapur abis itu saya makan. Itu sebabnya kenapa ya?',
                  //     initialReplyCount: 300,
                  //     userNameAlignment: CrossAxisAlignment.start,
                  //     locationAlignment: CrossAxisAlignment.end,
                  //     dateAlignment: CrossAxisAlignment.start,
                  //     statusAlignment: CrossAxisAlignment.center,
                  //   ),
                  //   ForumContent(
                  //     userName: 'John Doe',
                  //     location: 'City X, State Y',
                  //     date: 'Jan 01, 2023',
                  //     status:
                  //         'I have a question about cattle breeding. Can anyone help me?',
                  //     initialReplyCount: 50,
                  //     userNameAlignment: CrossAxisAlignment.start,
                  //     locationAlignment: CrossAxisAlignment.end,
                  //     dateAlignment: CrossAxisAlignment.start,
                  //     statusAlignment: CrossAxisAlignment.center,
                  //   ),
                  //   ForumContent(
                  //     userName: 'Jane Doe',
                  //     location: 'City Z, State W',
                  //     date: 'Mar 15, 2023',
                  //     status: 'Looking for advice on poultry farming.',
                  //     initialReplyCount: 120,
                  //     userNameAlignment: CrossAxisAlignment.start,
                  //     locationAlignment: CrossAxisAlignment.end,
                  //     dateAlignment: CrossAxisAlignment.start,
                  //     statusAlignment: CrossAxisAlignment.center,
                  //   ),
                  //   // Add more ForumContent widgets as needed...
                  // ],
                  );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
        bottomNavigationBar: NavigationBottomBar(),
        floatingActionButton: Positioned(
          bottom: 20,
          right: 16,
          child: IconButton(
            icon: Image.asset(
              'assets/icon/add.png',
              width: 50,
              height: 50,
            ),
            onPressed: () {
              submit(context);
            },
          ),
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
  final CrossAxisAlignment userNameAlignment;
  final CrossAxisAlignment locationAlignment;
  final CrossAxisAlignment dateAlignment;
  final CrossAxisAlignment statusAlignment;
  final TextAlign textAlign;

  const ForumContent({
    Key? key,
    required this.userName,
    required this.location,
    required this.date,
    required this.status,
    required this.initialReplyCount,
    this.userNameAlignment = CrossAxisAlignment.start,
    this.locationAlignment = CrossAxisAlignment.start,
    this.dateAlignment = CrossAxisAlignment.start,
    this.statusAlignment = CrossAxisAlignment.start,
    this.textAlign = TextAlign.start,
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
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white, // Set the background color to white
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors
                        .transparent, // Add this line to make the background transparent
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          color: Color(0xFF1B1B1B),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: const TextStyle(
                          color: Color(0xFF759488),
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
              Text(
                '${comments.length} Replies',
                style: const TextStyle(
                  color: Color(0xFF9F9F9F),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.20,
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
    return Container(
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
    );
  }
}

Widget buildIconButton(String assetPath, VoidCallback onPressed) {
  return Positioned(
    bottom: 20,
    right: 16,
    child: IconButton(
      icon: Image.asset(
        assetPath,
        width: 70,
        height: 65,
      ),
      onPressed: onPressed,
    ),
  );
}

void submit(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const PostForumApp(),
    ),
  );
}
