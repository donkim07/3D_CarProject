import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class feedback1 extends StatefulWidget {
  const feedback1({Key? key}) : super(key: key);

  @override
  _feedback1State createState() => _feedback1State();
}

class _feedback1State extends State<feedback1> {
  int _boxLength = 0;  // Initialize with default value
  int randomNumber = Random().nextInt(9000) + 1000;

  @override
  void initState() {
    super.initState();
    // Get the initial length of the box.
    _boxLength = Hive.box("feedback").length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e2e2),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Feed back'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          // Use the variable to determine the number of items in the list.
          itemCount: _boxLength,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      )),
                  trailing: IconButton(
                      onPressed: () {
                        // Delete the item from the box.
                        Hive.box("feedback").deleteAt(index);
                        Hive.box("namedfeedback").deleteAt(index);
                        // Call setState() to update the state variables.
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.info(
                            message: "Changes have taken effect.",
                          ),
                        );
                        setState(() {
                          _boxLength = Hive.box("feedback").length;
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey,
                      )),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "Name: " +
                              Hive.box("namedfeedback").getAt(index).toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "feedback: " +
                                Hive.box('feedback').getAt(index).toString(),
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0),
                        //   child: Text(
                        //     "Successfully registered lecturer in IALS",
                        //     style:
                        //     TextStyle(fontSize: 15, color: Colors.black),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
