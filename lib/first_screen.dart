import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:studentship/input/inputs.dart';
import 'package:studentship/login_page.dart';
import 'package:studentship/screens/display.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/questionbank.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'screens/Aboutus.dart';
import 'sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:studentship/dataa/lists.dart';
import 'screens/leaderboard.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  File file;
  AnimationController controller;
  Animation animation;
  File file1;
  var acceptable = [];
  bool prog1 = true;
  bool prog2 = true;
  bool isIgnore = false;
  bool isFinal = false;
  bool dateacceptable = false;
  Map lsss = {};
  Map lsss1 = {};
  var alertstyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      isButtonVisible: false);
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.grey,
      end: Colors.white,
    ).animate(controller);

    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.decelerate,
    // );

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
    print("start");
    // openFile('${userr.uid}');
    print("created");
    _openfile();

    lsss = {
      "\"1\"": null,
      "\"2\"": null,
      "\"3\"": null,
    };

    String currentTime = DateFormat.yMEd().add_jms().format(DateTime.now());
    print("tis the dates");

    DateTime date1 = DateTime.now();
    DateTime date2 = DateTime.parse("2021-05-07 19:00:04");
    if (date1.isBefore(date2)) {
      setState(() {
        dateacceptable = true;
      });
    }

    _setisIgnore();
    print(isIgnore);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  _setisIgnore() async {
    await _openfile1();
    var value = await _read1();

    if (dateacceptable == false) {
      setState(() {
        isIgnore = true;
      });
    } else {
      if (value != null) {
        setState(() {
          isIgnore = true;
        });
      }
    }
  }

  _openfile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    bool check = File('${directory.path}/my_file.txt').existsSync();

    if (check == true) {
      setState(() {
        file = File('${directory.path}/my_file.txt');
      });
    } else {
      setState(() {
        file = new File('${directory.path}/my_file.txt');
      });
    }
  }

  _openfile1() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    print(directory.toString());
    bool check = File('${directory.path}/my.txt').existsSync();

    if (check == true) {
      setState(() {
        file1 = File('${directory.path}/my.txt');
      });
      print("File exists");
    } else {
      setState(() {
        file1 = new File('${directory.path}/my.txt');
      });
      print("File don't exists");
    }
  }

  Future _clearfile1() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    setState(() {
      file1 = File('${directory.path}/my.txt');
    });

    file1.delete();
    print("delete file 1");
    setState(() {
      file1 = new File('${directory.path}/my.txt');
    });
  }

  Future _clearfile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    setState(() {
      file = File('${directory.path}/my_file.txt');
    });

    file.delete();
    setState(() {
      file = new File('${directory.path}/my_file.txt');
    });
  }

  _write1(String text) async {
    await _clearfile1();
    print(text);
    await file1.writeAsStringSync(text);
  }

  Future<String> _read1() async {
    String text;
    try {
      text = await file1.readAsString();
      text = text.toString();
      print("text is ");
      print(text);
      text = text.toString();
    } catch (e) {
      print(e);
      print("Couldn't read file");
    }
    return text;
  }

  _write(String text) async {
    var value = await _read();
    if (value != null) {
      text = value + " " + text;
    }
    await file.writeAsString(text);
  }

  Future<String> _read() async {
    String text;
    try {
      text = await file.readAsString();
      text = text.toString();
    } catch (e) {
      print(e);
      print("Couldn't read file");
    }
    return text;
  }

  Future _updatelsss() async {
    var output;
    String previousinput = await _read();
    if (previousinput != null) {
      print(previousinput);

      output = json.decode(previousinput);
    }
    print(output);
    return output;
  }

  void _clearlsss() {
    setState(() {
      lsss = {
        "\"1\"": null,
        "\"2\"": null,
        "\"3\"": null,
      };
    });
  }

  String _conversion(String k) {
    k = "\"" + k + "\"";
    return k;
  }

  var storageData = {};
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: Colors.orange,
                elevation: 0,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.orangeAccent,
                  size: 40,
                ),
                items: [
                  DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    value: 'logout',
                  ),
                  DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    value: 'About Us',
                  ),
                ],
                onChanged: (itemIdentifier) {
                  if (itemIdentifier == 'logout') {
                    FirebaseAuth.instance.signOut();
                    signOutGoogle();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  }
                  if (itemIdentifier == 'About Us') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  }
                },
              ),
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg1.png"), fit: BoxFit.cover),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    isIgnore != true
                        ? Column(
                            children: [
                              Text(
                                "DEADLINE:",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              TypewriterAnimatedTextKit(
                                speed: Duration(milliseconds: 120),
                                text: [
                                  '7th May 7pm',
                                ],
                                textStyle: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        : Container(),
                    isIgnore != true
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          )
                        : Container(),
                    isIgnore != true
                        ? Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 145, 77, 1),
                                    width: 4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  var output;
                                  String previousinput = await _read();
                                  if (previousinput != null) {
                                    output = json.decode(previousinput);
                                  }
                                  if (output != null) {
                                    int counter = 1;
                                    for (var k in output.values) {
                                      if (k != null) {
                                        k = _conversion(k);
                                        String tempcounter =
                                            _conversion(counter.toString());
                                        setState(() {
                                          print(tempcounter);
                                          lsss[tempcounter] = k;
                                        });
                                      }
                                      counter++;
                                    }
                                  }

                                  var temp = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Input(
                                        storage: lsss,
                                      ),
                                    ),
                                  );

                                  setState(() {
                                    lsss = temp;
                                  });

                                  if (lsss != null && lsss != {}) {
                                    await _clearfile();
                                    await _write(lsss.toString());
                                    _clearlsss();
                                    var value = await _read();
                                    if (value != null) {
                                      print("tis the value : " + value);
                                    }
                                    // _updatelsss();
                                  }
                                },
                                child: Text(
                                  'Enter Rooster',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                ),
                              ),
                            ),
                          )
                        : Text(''),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 145, 77, 1), width: 4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            var ls = [];
                            var value = await _read();
                            if (value != null) {
                              ls.add(value);
                            }
                            print("object");
                            print(ls);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Display(
                                  questions: ls,
                                ),
                              ),
                            );
                          },
                          child: Text('My Questions',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                        ),
                      ),
                    ),
                    isIgnore != true
                        ? Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 145, 77, 1),
                                    width: 4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  Alert(
                                    context: context,
                                    type: AlertType.none,
                                    title: "Data Cleared",
                                    desc: "All your data has been cleared.",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Noice!",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                  _clearfile();
                                },
                                child: Text('Clear Data',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue)),
                              ),
                            ),
                          )
                        : Container(),
                    isIgnore != true
                        ? Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 145, 77, 0.8),
                                border:
                                    Border.all(color: Colors.blue, width: 4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  var dont = false;
                                  DateTime date1 = DateTime.now();
                                  DateTime date2 =
                                      DateTime.parse("2021-05-07 19:00:04");
                                  if (date1.isBefore(date2)) {
                                    print(date1);
                                  } else {
                                    await _clearfile();
                                    await Alert(
                                      context: context,
                                      type: AlertType.none,
                                      title: "Session Expired",
                                      desc:
                                          "Time to submit rooster has expired.",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Damn :(",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: 120,
                                        )
                                      ],
                                    ).show();
                                    setState(() {
                                      dont = true;
                                    });
                                    await _write1("true");
                                    await _read1();
                                    FirebaseAuth.instance.signOut();
                                    signOutGoogle();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage(),
                                      ),
                                    );
                                  }

                                  await _read1();
                                  int counter = 0;
                                  print("final data :");
                                  var ls = {};
                                  var ls1 = [];
                                  var value = await _read();
                                  if (value != null) {
                                    ls['questions'] = value;
                                    var ls2 = json.decode(ls["questions"]);
                                    ls1.add(ls2["1"]);
                                    ls1.add(ls2["2"]);
                                    ls1.add(ls2["3"]);
                                  }

                                  if (value != null) {
                                    var output = json.decode(value);
                                    for (var k in output.values) {
                                      if (k != null) {
                                        counter++;
                                      }
                                    }
                                  }
                                  if (dont == false) {
                                    if (counter != 3) {
                                      Alert(
                                        context: context,
                                        type: AlertType.warning,
                                        title: "ARE YOU SURE ?",
                                        desc:
                                            "You have only entered $counter questions. Do you wish to continue? You cannot revert once you press yes!",
                                        buttons: [
                                          DialogButton(
                                            radius: BorderRadius.all(
                                                Radius.circular(20)),
                                            border: Border.all(
                                                color: Colors.orange, width: 6),
                                            height: 60,
                                            child: Text(
                                              "YES",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 24),
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                isIgnore = true;
                                              });
                                              await _write1("true");
                                              await _read1();
                                              print(file1.path);
                                              var user = FirebaseAuth
                                                  .instance.currentUser.email;
                                              print("dekhle :");
                                              print(ls);
                                              print(ls1);

                                              ls['useremail'] = user;
                                              final dbRef = FirebaseDatabase
                                                  .instance
                                                  .reference()
                                                  .child("questions");
                                              dbRef.push().set({
                                                "username": ls['useremail'],
                                                "questions": ls1
                                              });

                                              print(ls);

                                              Navigator.pop(context);
                                            },
                                            color: Colors.white,
                                          ),
                                          DialogButton(
                                            radius: BorderRadius.all(
                                                Radius.circular(20)),
                                            border: Border.all(
                                                color: Colors.orange, width: 6),
                                            height: 60,
                                            child: Text(
                                              "NO",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 24),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: Colors.white,
                                          )
                                        ],
                                      ).show();
                                    } else {
                                      print("i still submitted it");
                                      setState(() {
                                        isIgnore = true;
                                      });
                                      await _write1("true");
                                      await _read1();
                                      print(file1.path);
                                      var user = FirebaseAuth
                                          .instance.currentUser.email;
                                      print("dekhle :");
                                      print(ls);
                                      print(ls1);

                                      ls['useremail'] = user;
                                      final dbRef = FirebaseDatabase.instance
                                          .reference()
                                          .child("questions");
                                      dbRef.push().set({
                                        "username": ls['useremail'],
                                        "questions": ls1
                                      });
                                    }
                                  }
                                },
                                child: Text(
                                  'Final Submit',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    isIgnore != false
                        ? Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 145, 77, 1),
                                    width: 4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  var returns = true;
                                  var obj = listme();
                                  print(obj);

                                  Alert(
                                    context: context,
                                    style: alertstyle,
                                    title: "Fetching Your Data",
                                    desc: "Please Wait!",
                                    image: Image.asset("assets/giphy.gif"),
                                  ).show();

                                  var ola = await obj.myrequest();
                                  print(ola);
                                  print(obj.dict);

                                  print(Navigator.of(context));

                                  returns = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Screen0(
                                        obj: obj,
                                      ),
                                    ),
                                  );

                                  print(returns);

                                  String str = Navigator.of(context).toString();
                                  var me1 = str.split(" ");
                                  str = "";
                                  str = me1[me1.length - 2];
                                  print(str);

                                  print(Navigator.of(context));
                                  if (returns == false && str != '2') {
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text('Leaderboard',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue)),
                              ),
                            ),
                          )
                        : Container(),
                    isIgnore != false
                        ? Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 145, 77, 1),
                                    width: 4),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  var obj = QB();
                                  var returns = true;

                                  Alert(
                                    context: context,
                                    style: alertstyle,
                                    title: "Fetching Your Data",
                                    desc: "Please Wait!",
                                    image: Image.asset("assets/giphy.gif"),
                                  ).show();

                                  var obtained = await obj.getQB();

                                  print(Navigator.of(context));

                                  returns = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QB(
                                        dict: obtained,
                                      ),
                                    ),
                                  );

                                  print(returns);

                                  String str = Navigator.of(context).toString();
                                  var me1 = str.split(" ");
                                  str = "";
                                  str = me1[me1.length - 2];
                                  print(str);

                                  print(Navigator.of(context));
                                  if (returns == false && str != '2') {
                                    Navigator.of(context).pop();
                                  }

                                  var questions;
                                  print(questions);
                                },
                                child: Text('Probable Questions',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue)),
                              ),
                            ),
                          )
                        : Container(),
                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height * 0.1,
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(
                    //           color: Color.fromRGBO(255, 145, 77, 1), width: 4),
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(25),
                    //       ),
                    //     ),
                    //     child: FlatButton(
                    //       onPressed: () async {
                    //         setState(() {
                    //           isIgnore = false;
                    //         });
                    //         await _clearfile1();
                    //       },
                    //       child: Text("Revert",
                    //           style:
                    //               TextStyle(fontSize: 20, color: Colors.blue)),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
