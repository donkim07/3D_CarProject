import 'package:flutter/material.dart';
import 'package:flutter_3d/lecturelesson2.dart';
import 'package:flutter_3d/sign_in_lecture.dart';
import 'package:flutter_3d/sign_in_student.dart';
import 'package:flutter_3d/studenthomepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class lecturehomepage extends StatefulWidget {
  const lecturehomepage(String text, int currentuser, {Key key})
      : super(key: key);

  @override
  State<lecturehomepage> createState() => _lecturehomepage();
}

TextEditingController lecname = TextEditingController(
    text: Hive.box("lecturer").getAt(currentuser).toString());
TextEditingController lecemail = TextEditingController(
    text: Hive.box("lecturer-email").getAt(currentuser).toString());
TextEditingController lecpassword = TextEditingController(
    text: Hive.box("lecturer-password").getAt(currentuser).toString());

class _lecturehomepage extends State<lecturehomepage> {
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
              itemBuilder: (BuildContext context) {},
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
                  return lecturelesson2();
                }));
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
              itemBuilder: (BuildContext context) {},
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
          Row(
            children: [
              OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF464646)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    side:
                        MaterialStateProperty.all<BorderSide>(BorderSide.none),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Text(""),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Change username',
                                  ),
                                  controller: lecname,
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Change email',
                                  ),
                                  controller: lecemail,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Change password',
                                  ),
                                  controller: lecpassword,
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Hive.box("lecturer")
                                              .putAt(currentuser, lecname.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Save name'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Hive.box("lecturer-email").putAt(
                                              currentuser, newemail.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Save email'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Hive.box("lecturer-password").putAt(
                                              currentuser, lecpassword.text);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Save password'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text("profile")),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Hive.box("showlesson").put(1, true);
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        backgroundColor: Color(0xFF464646),
                        message: "lecture on pistons enabled for students",
                      ),
                    );
                  },
                  onLongPress: () {
                    Hive.box("showlesson").put(1, false);
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        backgroundColor: Color(0xFF464646),
                        message: "Lesson disabled for students",
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF464646)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    side:
                        MaterialStateProperty.all<BorderSide>(BorderSide.none),
                  ),
                  child: Text(
                    "Enable lesson",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
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
                                  "Pistons and how they work.",
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
                              'https://raw.githubusercontent.com/shukran-yega/3d-cars/a2dbb81c96866cb9d294899e7aa2dea19f47f7a8/engine_work_animation_-_low_poly.glb',
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
                              "Illustration on how pistons work!",
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
                                "Piston assembly within an engine ",
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
                                      if (value.isEmpty) {
                                        return 'Please enter your password';
                                      }
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
      ),
    );
  }
}
