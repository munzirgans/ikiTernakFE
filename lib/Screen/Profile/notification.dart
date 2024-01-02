import 'package:flutter/material.dart';

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
          Notification(),
        ]),
      ),
    );
  }
}

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
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
          decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
          child: Stack(
            children: [
              const Positioned(
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
                  'Turn On MyTernak notification',
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
                    // Implementasi aksi untuk tombol "Cancel" di sini
                    print('Cancel button pressed');
                  },
                  child: const Text(
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
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // Menghilangkan warna latar
                    shadowColor: Colors.transparent, // Menghilangkan bayangan
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
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
          side: const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          const Spacer(),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color.fromARGB(
                255, 255, 255, 255), // Color when toggle is ON
            activeTrackColor: const Color.fromARGB(255, 82, 171, 141),
            inactiveThumbColor: const Color.fromARGB(255, 255, 255, 255),
            inactiveTrackColor:
                Colors.grey[400]!, // Thumb color when toggle is OFF
          ),
        ],
      ),
    );
  }
}
