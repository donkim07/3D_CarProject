import 'package:flutter/material.dart';
import 'package:flutter_3d/sign_in_lecture.dart';
import 'package:flutter_3d/startup.dart';
import 'package:flutter_3d/studenthomepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class lecturelesson2 extends StatefulWidget {
  const lecturelesson2({Key? key}) : super(key: key);

  @override
  State<lecturelesson2> createState() => _lecturelesson2();
}

class _lecturelesson2 extends State<lecturelesson2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e2e2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFe0e2e2),
        title: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    value: 'menu1',
                    child: Text('Menu Item 1'),
                  ),
                ];
              },
              child: Center(
                child: Text(
                  "Pistons",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return startup();
                }));
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 'menu1',
                    child: Text('Menu Item 1'),
                  ),
                ];
              },
              child: Center(
                child: Text(
                  "Engine",
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
                    value: 'menu1',
                    child: Text('Menu Item 1'),
                  ),
                ];
              },
              child: Center(
                child: Text(
                  "Spark plug",
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
                Hive.box("showlesson2").put(1, true);
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: Color(0xFF464646),
                    message: "Lecture on the engine enabled",
                  ),
                );
              },
              onLongPress: () {
                Hive.box("showlesson2").put(1, false);
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: Color(0xFF464646),
                    message: "Lesson disabled for students",
                  ),
                );
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
                "Enable lesson",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Visibility(
        visible: true,
        child: SingleChildScrollView(
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
                                  "The engine and how it works.",
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
                            children: [],
                          ),
                          SizedBox(
                            height: 120,
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
                              'https://raw.githubusercontent.com/shukran-yega/3d-cars/ff11efbed9a060f464f7279cee27acbf0a0c35e1/animated_engine_v8.glb',
                          alt: "A 3D model of a car",
                          autoRotate: false,
                          cameraControls: true,
                          autoPlay: true,
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
                              "Illustration on how the engine work!",
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
                                "Engine assembly",
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
                              SizedBox(
                                width: 450,
                                child: TextFormField(
                                    controller: feedback,
                                    maxLines: 2,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: "feedback",
                                      labelText: 'feedback',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Hive.box("namedfeedback")
                                          .add(username2.text);
                                      Hive.box("feedback").add(feedback.text);
                                      feedback.clear();
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        const CustomSnackBar.success(
                                          backgroundColor: Color(0xFF464646),
                                          message: "Adding feedback.",
                                        ),
                                      );
                                    },
                                    child: Text("send feedback")),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                          // Expanded(
                          //   child: Container(
                          //     height: 700,
                          //     width: 800,
                          //     child: ModelViewer(
                          //       src:
                          //           'https://raw.githubusercontent.com/shukran-yega/3d-cars/a2dbb81c96866cb9d294899e7aa2dea19f47f7a8/v8_engine.glb',
                          //       alt: "A 3D model of a car",
                          //       autoRotate: false,
                          //       cameraControls: true,
                          //       autoPlay: true,
                          //       scale: ("5.1 5.1 5.1"),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
