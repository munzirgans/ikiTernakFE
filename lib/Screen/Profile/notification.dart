import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';

void main() {
  runApp(const Notif());
}

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          NotificationScreen(),
        ]),
      ),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool myTernakNotification = false;
  bool forumNotification = false;
  bool popupNotification = false;
  bool vibrateMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
          child: Stack(
            children: [
              Positioned(
                left: 28,
                top: 100,
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 140,
                child: _buildToggle(
                  'Turn On IkiTernak notification',
                  myTernakNotification,
                  (value) {
                    setState(() {
                      myTernakNotification = value;
                    });
                  },
                ),
              ),
              Positioned(
                left: 26,
                top: 209,
                child: _buildToggle(
                  'Turn on forum notification',
                  forumNotification,
                  (value) {
                    setState(() {
                      forumNotification = value;
                    });
                  },
                ),
              ),
              Positioned(
                left: 26,
                top: 278,
                child: _buildToggle(
                  'Show pop-up notification',
                  popupNotification,
                  (value) {
                    setState(() {
                      popupNotification = value;
                    });
                  },
                ),
              ),
              Positioned(
                left: 26,
                top: 347,
                child: _buildToggle(
                  'Allow vibrate mode',
                  vibrateMode,
                  (value) {
                    setState(() {
                      vibrateMode = value;
                    });
                  },
                ),
              ),
              Positioned(
                left: 20,
                top: 51,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Userprofile()),
                    );
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 328,
                top: 51,
                child: ElevatedButton(
                  onPressed: () {
                    // Implementasi aksi untuk tombol "Save" di sini
                    print('Save button pressed');
                    // Menampilkan dialog jika turn on myTernak Notification menyala
                    if (myTernakNotification) {
                      _showSuccessDialog();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Menghilangkan warna latar
                    shadowColor: Colors.transparent, // Menghilangkan bayangan
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggle(String label, bool value, Function(bool) onChanged) {
    return Container(
      width: 339,
      height: 59,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFEBEBEB)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          Spacer(),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor:
                Color.fromARGB(255, 255, 255, 255), // Color when toggle is ON
            activeTrackColor: Color.fromARGB(255, 82, 171, 141),
            inactiveThumbColor: Color.fromARGB(255, 255, 255, 255),
            inactiveTrackColor:
                Colors.grey[400]!, // Thumb color when toggle is OFF
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan dialog notifikasi berhasil dinyalakan
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notifications turned on successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
