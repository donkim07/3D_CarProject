import 'package:flutter/material.dart';
import 'package:flutter_3d/admin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class admin_sign_in extends StatefulWidget {
  const admin_sign_in({Key? key}) : super(key: key);

  @override
  State<admin_sign_in> createState() => admin_sign_inState();
}

class admin_sign_inState extends State<admin_sign_in> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe0e2e2),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Admin Sign in'),
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
                      "Please sign in to continue",
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
                  AutofillGroup(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                            controller: username,
                            autofillHints: [AutofillHints.givenName],
                            decoration: InputDecoration(
                              hintText: "Enter name",
                              labelText: "Enter name",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter username';
                              }
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
                              if (value.isEmpty) {
                                return 'Please enter your password';
                              }
                            }),
                      ),
                    ]),
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
                                  if (_formKey.currentState.validate() &&
                                      password.text == "123" &&
                                      username.text == "group3") {
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      const CustomSnackBar.success(
                                        backgroundColor: Color(0xFF464646),
                                        message: "Welcome administrator",
                                      ),
                                    );
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return admin();
                                    }));
                                  } else {
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      const CustomSnackBar.error(
                                        backgroundColor: Color(0xFF464646),
                                        message: "Invalid admin credentials",
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) {
                          //           return admin();
                          //         }));
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text(
                          //       "Not a user sign up",
                          //       style:
                          //       TextStyle(color: Colors.blue, fontSize: 15),
                          //     ),
                          //   ),
                          // )
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
