import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class guest_home_page extends StatefulWidget {
  const guest_home_page({key});

  @override
  State<guest_home_page> createState() => _guest_home_pageState();
}

class _guest_home_pageState extends State<guest_home_page> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1330) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Guest homepage",
              //'Screen Size: ${constraints.maxWidth.toString()}',
              style: TextStyle(color: Color(0xFF464646)),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Flat tire.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF464646)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Step 1.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  "assets/flat1.gif",
                  height: 500,
                  width: 400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Step 2.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  "assets/flat2.gif",
                  height: 500,
                  width: 400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Step 3.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  "assets/flat3.gif",
                  height: 500,
                  width: 400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Step 4.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  "assets/flat4.gif",
                  height: 500,
                  width: 400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Step 5.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  "assets/flat5.gif",
                  height: 500,
                  width: 400,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Step 6.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Image.asset(
                  "assets/flat6.gif",
                  height: 500,
                  width: 400,
                )
              ],
            ),
          ),
        );
      } else if (constraints.maxWidth >= 1330) {
        return Scaffold(
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
                  itemBuilder: (BuildContext context) {},
                  child: Center(
                    child: Text(
                      "Flat tire",
                      style: TextStyle(color: Color(0xFF464646)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {},
                  child: Center(
                    child: Text(
                      "Dash board symbols",
                      style: TextStyle(color: Color(0xFF464646)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton(
                  itemBuilder: (BuildContext context) {},
                  child: Center(
                    child: Text(
                      "Oil change",
                      style: TextStyle(color: Color(0xFF464646)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 520,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Flat tire.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF464646)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our aim is to provide an platform to which common people like you and me can learn more about cars and solutions to common problem we might face, Through the use of interactive 3D models",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    "Step 1.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/flat1.gif",
                        height: 600,
                        width: 600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    "Step 2.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/flat2.gif",
                        height: 600,
                        width: 600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    "Step 3.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/flat3.gif",
                        height: 600,
                        width: 600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    "Step 4.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/flat4.gif",
                        height: 600,
                        width: 600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    "Step 5.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/flat5.gif",
                        height: 600,
                        width: 600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                  child: Text(
                    "Step 6.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                        fontSize: 25,
                        color: Color(0xFF464646),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/flat6.gif",
                        height: 600,
                        width: 600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models"
                        "Our aim is to provide an platform\n to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
