import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const EditProfilePage());
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            EditProfile(),
          ],
        ),
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String selectedGender = '';
  List<String> genderOptions = ['Male', 'Female'];
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  DateTime? selectedDate;
  String avatarImageUrl =
      "https://via.placeholder.com/90x90"; // Default avatar image URL

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
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 171,
                  decoration: const BoxDecoration(color: Color(0xFF50BE92)),
                ),
              ),
              const Positioned(
                left: 166,
                top: 66,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 128,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(avatarImageUrl),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFDCE3E0)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 130,
                top: 225,
                child: Text(
                  'Joko Sudirmant',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              // Positioned(
              //   left: 167,
              //   top: 253,
              //   child: Text(
              //     'Edit Avatar',
              //     style: TextStyle(
              //       color: Color(0xFF1BA0E2),
              //       fontSize: 10,
              //       fontFamily: 'Poppins',
              //       fontWeight: FontWeight.w500,
              //       decoration: TextDecoration.underline,
              //       height: 0,
              //     ),
              //   ),
              // ),
              Positioned(
                left: 34,
                top: 297,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 323,
                      height: 25,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 323,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF50BE92)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: nameController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 34,
                top: 378,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 323,
                      height: 25,
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 323,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF50BE92)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                selectedGender.isNotEmpty
                                    ? selectedGender
                                    : 'Select Gender',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _showGenderDialog();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 33,
                top: 458,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 324,
                      height: 25,
                      child: Text(
                        'Date of Birth',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 324,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF50BE92)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: dobController,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 33,
                top: 539,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 323,
                      height: 25,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 323,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF50BE92)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: emailController,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 34,
                top: 727,
                child: GestureDetector(
                  onTap: () {
                    // Handle Submit button tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Userprofile()),
                    );
                    print('Submit Pressed');
                    print('Name: ${nameController.text}');
                    print('Gender: $selectedGender');
                    print('Date of Birth: ${dobController.text}');
                    print('Email: ${emailController.text}');
                  },
                  child: Container(
                    width: 323,
                    height: 39,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF50BE92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        const BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Cancel Button
              Positioned(
                left: 10,
                top: 11,
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
                      color: Colors.white,
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void _showGenderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Gender'),
          content: SizedBox(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: genderOptions
                  .map((gender) => ListTile(
                        title: Text(gender),
                        onTap: () {
                          setState(() {
                            selectedGender = gender;
                          });
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
