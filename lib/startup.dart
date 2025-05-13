import 'package:flutter/material.dart';
import 'package:flutter_3d/admin_sign_in.dart';
import 'package:flutter_3d/guesthomepage.dart';
import 'package:flutter_3d/sign_in_lecture.dart';
import 'package:flutter_3d/sign_in_student.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class startup extends StatefulWidget {
  const startup({Key? key}) : super(key: key);

  @override
  State<startup> createState() => _startupState();
}

class _startupState extends State<startup> {
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
                    child: Text('About'),
                    value: 'about',
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
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('About'),
                    value: 'about',
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
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text('About'),
                    value: 'about',
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return admin_sign_in();
                }));
              },
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
                "Admin page",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Make learning about cars fun with \n intereactive 3D models",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF464646)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Our platform supports both Lectures and Students please select how you \nwould like to continue as:",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 50,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return guest_home_page();
                                    }));
                                  },
                                  child: Text(
                                    "Guest",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF464646))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFF464646))),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return sign_in_student();
                                      }));
                                    },
                                    child: Text(
                                      "Student",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 50,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return sign_in();
                                    }));
                                  },
                                  child: Text(
                                    "Lecturer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF464646))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(
                                "https://img.icons8.com/external-others-inmotus-design/256/external-BMW-mercedes-and-bmw-others-inmotus-design-2.png",
                                width: 50,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                "https://img.icons8.com/external-tal-revivo-regular-tal-revivo/256/external-toyota-motor-corporation-is-a-japanese-multinational-automotive-manufacturer-automotive-regular-tal-revivo.png",
                                width: 50,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                "https://img.icons8.com/windows/256/rolls-royce.png",
                                width: 50,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                "https://img.icons8.com/carbon-copy/256/chevrolet.png",
                                width: 80,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                "https://img.icons8.com/carbon-copy/256/volkswagen.png",
                                width: 80,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 570,
                      width: 800,
                      child: ModelViewer(
                        src:
                            'https://raw.githubusercontent.com/shukran-yega/3d-cars/a2dbb81c96866cb9d294899e7aa2dea19f47f7a8/toyota_4runner.glb',
                        alt: "A 3D model of a car",
                        autoRotate: false,
                        cameraControls: true,
                        autoPlay: false,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Learn more as a student with interactive\n 3D models",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ubuntu(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF464646)),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Our platform supports both Lectures and Students please select how you \nwould like to continue as:",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Our platform supports both Lectures and Students please select how you \nwould like to continue as:",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF464646))),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return sign_in();
                                    }));
                                  },
                                  child: Text(
                                    "Continue as Student/Lecturer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          height: 700,
                          width: 800,
                          child: ModelViewer(
                            src:
                                'https://raw.githubusercontent.com/shukran-yega/3d-cars/ff11efbed9a060f464f7279cee27acbf0a0c35e1/animated_engine_v8.glb',
                            alt: "A 3D model of a car",
                            autoRotate: false,
                            cameraControls: true,
                            autoPlay: true,
                            scale: ("5.1 5.1 5.1"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  color: Color(0xFFe0e2e2),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Looking for a quick guide?\n your at the right spot",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF464646)),
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Our platform supports both Lectures and Students please select how you \nwould like to continue as:",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Our aim is to provide an platform to which common people like you and me can \nlearn more about cars and solutions to common problem we might face, \nThrough the use of interactive 3D models",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Our platform supports both Lectures and Students please select how you \nwould like to continue as:",
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFF464646))),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return guest_home_page();
                                      }));
                                    },
                                    child: Text(
                                      "Continue as Guest",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: 700,
                            width: 800,
                            child: ModelViewer(
                              src:
                                  'https://raw.githubusercontent.com/shukran-yega/3d-cars/a2dbb81c96866cb9d294899e7aa2dea19f47f7a8/v8_engine.glb',
                              alt: "A 3D model of a car",
                              autoRotate: false,
                              cameraControls: true,
                              autoPlay: true,
                              scale: ("5.1 5.1 5.1"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
