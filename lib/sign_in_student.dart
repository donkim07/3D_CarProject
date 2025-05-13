import 'package:flutter/material.dart';
import 'package:flutter_3d/signup.dart';
import 'package:flutter_3d/studenthomepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController username1 = TextEditingController();
int currentuser = 0;

class sign_in_student extends StatefulWidget {
  int currentuser = 0; // Initialize with default value
  sign_in_student({Key? key}) : super(key: key);

  @override
  State<sign_in_student> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in_student> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe0e2e2),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Signup form'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              width: 470,
              height: 500,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Please sign up to continue",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF464646)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: username1,
                        autofillHints: [AutofillHints.username],
                        decoration: InputDecoration(
                          hintText: "Enter name",
                          labelText: "Enter name",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: password,
                        autofillHints: [AutofillHints.password],
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "password",
                          labelText: 'password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,
                              width: 300,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFF464646))),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    final enteredUsername = username1.text;
                                    final enteredPassword = password.text;
                                    final lectureBox = Hive.box("student");
                                    final lecturePassword =
                                        Hive.box("student-password");

                                    bool usernameExists = false;
                                    bool passwordExists = false;

                                    // Iterate over the entries (key-value pairs) in the lectureBox
                                    for (var entry
                                        in lectureBox.toMap().entries) {
                                      final value = entry
                                          .value; // The value of the item in the box
                                      final key = entry
                                          .key; // The key of the item in the box
                                      currentuser = entry.key;
                                      if (value == enteredUsername) {
                                        usernameExists = true;
                                        print(
                                            'Value that led to code break: $value');
                                        print(
                                            'Index that led to code break: $key');
                                        break;
                                      }
                                    }
                                    for (var value in lecturePassword.values) {
                                      if (value == enteredPassword) {
                                        passwordExists = true;
                                        break;
                                      }
                                    }

                                    if (usernameExists && passwordExists) {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        const CustomSnackBar.success(
                                          backgroundColor: Color(0xFF464646),
                                          message: "Welcome back",
                                        ),
                                      );
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return student(
                                            username.text, currentuser
                                        );
                                      }));
                                    } else {
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        const CustomSnackBar.error(
                                          backgroundColor: Color(0xFF464646),
                                          message: "Invalid credentials",
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return login();
                              }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Not a user sign up",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
