import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/forum/forumTernak.dart';

void main() {
  runApp(const PostForumApp());
}

class PostForumApp extends StatelessWidget {
  const PostForumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: PostForum(),
      ),
    );
  }
}

class PostForum extends StatefulWidget {
  const PostForum({Key? key}) : super(key: key);

  @override
  _PostForumState createState() => _PostForumState();
}

class _PostForumState extends State<PostForum> {
  final _controller = TextEditingController();
  bool _isInputEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateInputState);
  }

  void _updateInputState() {
    setState(() {
      _isInputEmpty = _controller.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 390,
            height: 844,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
            child: Stack(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForumTernak()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 22, top: 52),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 26,
                  top: 95,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/avatar.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 305,
                  top: 46,
                  child: GestureDetector(
                    onTap: () {
                      // Tambahkan logika untuk menanggapi tombol "Post" di sini
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForumTernak(),
                        ),
                      );
                      print('Post button tapped!');
                    },
                    child: Container(
                      width: 63,
                      height: 33,
                      decoration: ShapeDecoration(
                        color: _isInputEmpty
                            ? const Color(0xFF81C1A7)
                            : const Color(0xFF50BE92),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 83,
                  top: 90,
                  child: SizedBox(
                    width: 240,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: _controller,
                        maxLines: null,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                        onChanged: (text) {
                          _updateInputState();
                        },
                        decoration: InputDecoration(
                          hintText: _isInputEmpty ? 'What’s happening?' : '',
                          hintStyle: const TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(8),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: 390,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(color: Color(0xFFEAEAEA)),
                        top: BorderSide(width: 1, color: Color(0xFFEAEAEA)),
                        right: BorderSide(color: Color(0xFFEAEAEA)),
                        bottom: BorderSide(color: Color(0xFFEAEAEA)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  bottom: 13,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.clear();
                        _isInputEmpty = true;
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 120,
                  bottom: 12,
                  child: Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.attachment,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                Positioned(
                  left: 71,
                  bottom: 13,
                  child: Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
