import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class lecture extends StatefulWidget {
  const lecture({Key key}) : super(key: key);

  @override
  State<lecture> createState() => _lectureState();
}

class _lectureState extends State<lecture> {
  int _boxLength;
  TextEditingController namechange = TextEditingController();
  TextEditingController emailchange = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Get the initial length of the box.
    _boxLength = Hive.box("lecturer").length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e2e2),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registered Lectures'),
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Change existing data'),
                              content: Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: namechange,
                                      decoration: InputDecoration(
                                        hintText: "change name",
                                      ),
                                    ),
                                    TextField(
                                      controller: emailchange,
                                      decoration: InputDecoration(
                                        hintText: "change email",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Hive.box("lecturer")
                                        .putAt(index, namechange.text);
                                    // Hive.box("lecturer-email")
                                    //     .putAt(index, emailchange.text);
                                    setState(() {
                                      lecture();
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Update name'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Hive.box("lecturer")
                                    //     .putAt(index, namechange.text);
                                    Hive.box("lecturer-email")
                                        .putAt(index, emailchange.text);
                                    setState(() {
                                      lecture();
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Update email'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Hive.box("lecturer")
                                        .putAt(index, namechange.text);
                                    Hive.box("lecturer-email")
                                        .putAt(index, emailchange.text);
                                    setState(() {
                                      lecture();
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Update both'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey,
                      )),
                  trailing: IconButton(
                      onPressed: () {
                        // Delete the item from the box.
                        Hive.box("lecturer").deleteAt(index);
                        // Hive.box("lecturer-email").deleteAt(index);
                        //Hive.box("password").deleteAt(index);
                        // Call setState() to update the state variables.
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.info(
                            message: "Reload the page.",
                          ),
                        );
                        setState(() {
                          _boxLength = Hive.box("lecturer").length;
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
                              Hive.box('lecturer').getAt(index).toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Email: " +
                                Hive.box('lecturer-email')
                                    .getAt(index)
                                    .toString(),
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "password: " +
                                Hive.box('lecturer-password')
                                    .getAt(index)
                                    .toString(),
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Successfully registered lecturer in IALS",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
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
