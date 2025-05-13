import 'package:flutter/material.dart';
import 'package:flutter_3d/sign_in_lecture.dart';
import 'package:flutter_3d/sign_in_student.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

TextEditingController username = TextEditingController();

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                        controller: username,
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
                      controller: email,
                      autofillHints: [AutofillHints.email],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null; // Return null if the validation is successful
                      },
                    ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFF464646))),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    Hive.box("student").add(username.text);
                                    Hive.box("student-email").add(email.text);
                                    Hive.box("student-password")
                                        .add(password.text);
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      CustomSnackBar.success(
                                        message:
                                            "Sign up successful now please login",
                                      ),
                                    );
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return sign_in_student();
                                    }));
                                  }
                                },
                                child: Text(
                                  "Continue as student",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xFF464646))),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    Hive.box("lecturer").add(username.text);
                                    Hive.box("lecturer-email").add(email.text);
                                    Hive.box("lecturer-password")
                                        .add(password.text);
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      CustomSnackBar.success(
                                        backgroundColor: Color(0xFF464646),
                                        message:
                                            "Signup successful now please login",
                                      ),
                                    );
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return sign_in();
                                    }));
                                  }
                                },
                                child: Text(
                                  "Continue as Lecturer",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
