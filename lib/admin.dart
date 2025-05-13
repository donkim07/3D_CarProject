import 'package:flutter/material.dart';
import 'package:flutter_3d/LectureDB.dart';
import 'package:flutter_3d/feedback.dart';
import 'package:flutter_3d/studentDB.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e2e2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFe0e2e2),
        title: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "IALS",
            style: TextStyle(
                color: Color(0xFF464646),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 'settings',
                  ),
                ];
              },
              child: Center(
                child: Text(
                  "Car Library",
                  style: TextStyle(color: Color(0xFF464646)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 'settings',
                  ),
                ];
              },
              child: Center(
                child: Text(
                  "About us",
                  style: TextStyle(color: Color(0xFF464646)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("UDSM"),
                  onTap: () {
                    launchUrl(
                      Uri.parse("https://www.udsm.ac.tz/"),
                    );
                  },
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Github repository"),
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                          "https://www.bing.com/ck/a?!&&p=94bece45567570b7JmltdHM9MTY3OTcwMjQwMCZpZ3VpZD0wYjIxZDM1ZC0xY2VmLTYwZGMtMGE2ZS1jMTgyMWQxMjYxM2YmaW5zaWQ9NTE4Mg&ptn=3&hsh=3&fclid=0b21d35d-1cef-60dc-0a6e-c1821d12613f&psq=github&u=a1aHR0cHM6Ly9naXRodWIuY29tLw&ntb=1"),
                    );
                  },
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("sketch Fab"),
                  onTap: () {
                    launchUrl(Uri.parse("https://sketchfab.com/"));
                  },
                ),
              ],
              child: Center(
                child: Text(
                  "Special Thanks",
                  style: TextStyle(color: Color(0xFF464646)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 'settings',
                  ),
                ];
              },
              child: Center(
                child: Text(
                  "Feedback",
                  style: TextStyle(color: Color(0xFF464646)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 400,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF464646)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
              ),
              child: Text(
                "Contact us",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Select the database you wish to view.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF464646)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        height: 90,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF464646))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return studentDB();
                            }));
                          },
                          child: Text(
                            "View student DB",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        height: 90,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF464646))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return lecture();
                            }));
                          },
                          child: Text(
                            "View lecturer DB",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                        height: 90,
                        width: 200,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF464646))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return feedback1();
                            }));
                          },
                          child: Text(
                            "User feedback",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Before proceeding,any changes made to the database are permanent and cannot be undone. This should only be done by group c members which are me, donald, mbalike and cizer."),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "The databse being used here is hive as it is much fater than sql and nosql options."),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "This is still a work in progress and changes can still occur"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
