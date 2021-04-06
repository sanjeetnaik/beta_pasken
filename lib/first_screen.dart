import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:studentship/input/inputs.dart';
import 'package:studentship/screens/display.dart';
import 'sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:intl/intl.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  File file;
  File file1;
  bool isIgnore = false;
  bool isFinal = false;
  Map lsss = {};
  Map lsss1 = {};
  @override
  void initState() {
    super.initState();
    print("start");
    // openFile('${userr.uid}');
    print("created");
    _openfile();

    lsss = {
      "\"1\"": null,
      "\"2\"": null,
      "\"3\"": null,
      "\"4\"": null,
      "\"5\"": null,
    };

    _setisIgnore();
    print(isIgnore);
  }

  _setisIgnore() async {
    await _openfile1();
    var value = await _read1();
    if (value != null) {
      setState(() {
        isIgnore = true;
      });
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

    file1 = File('${directory.path}/my.txt');
    file1.delete();
    print("delete file 1");
    file1 = new File('${directory.path}/my.txt');
  }

  Future _clearfile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    file = File('${directory.path}/my_file.txt');
    file.delete();
    file = new File('${directory.path}/my_file.txt');
  }

  _write1(String text) async {
    _clearfile1();
    var value = await _read1();

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

  void dispose() {
    super.dispose();
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
        "\"4\"": null,
        "\"5\"": null,
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
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            DropdownButton(
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
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Log Out'),
                      ],
                    ),
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  signOutGoogle();
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg1.png"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                isIgnore != true
                    ? Container(
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
                            var output;
                            String previousinput = await _read();
                            if (previousinput != null) {
                              output = json.decode(previousinput);
                            }

                            print("previous input : ");
                            print(output.runtimeType);

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
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      )
                    : Text(''),
                Container(
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
                    child: Text('Read Data',
                        style: TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                ),
                isIgnore != true
                    ? Container(
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
                          onPressed: () {
                            _clearfile();
                          },
                          child: Text('Clear Data',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue)),
                        ),
                      )
                    : Text(""),
                isIgnore != true
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 145, 77, 0.8),
                          border: Border.all(color: Colors.blue, width: 4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            await _read1();
                            int counter = 0;
                            print("final data :");
                            var ls = {};
                            var value = await _read();
                            if (value != null) {
                              ls['questions'] = value;
                            }

                            if (value != null) {
                              var output = json.decode(value);
                              for (var k in output.values) {
                                if (k != null) {
                                  counter++;
                                }
                              }
                            }

                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "ARE YOU SURE ?",
                              desc:
                                  "You have only entered $counter questions. Do you wish to continue? You cannot revert once you press yes!",
                              buttons: [
                                DialogButton(
                                  radius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                      color: Colors.orange, width: 6),
                                  height: 60,
                                  child: Text(
                                    "YES",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 24),
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      isIgnore = true;
                                    });
                                    await _write1("true");
                                    await _read1();
                                    var user =
                                        FirebaseAuth.instance.currentUser.email;
                                    print("dekhle :");
                                    print(ls);

                                    ls['useremail'] = user;
                                    print(ls);

                                    //final list [useremailid,{"1": "ui", "2": "123", "3": null, "4": null, "5": null}]

                                    Navigator.pop(context);
                                  },
                                  color: Colors.white,
                                ),
                                DialogButton(
                                  radius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(
                                      color: Colors.orange, width: 6),
                                  height: 60,
                                  child: Text(
                                    "NO",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 24),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  color: Colors.white,
                                )
                              ],
                            ).show();

                            dynamic currentTime = DateFormat.yMEd()
                                .add_jms()
                                .format(DateTime.now());
                            print("tis the dates");
                            print(currentTime);

                            print(ls);
                            print(counter);
                          },
                          child: Text(
                            'Final Submit',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      )
                    : Text(""),
                Container(
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
                    onPressed: () {
                      setState(() {
                        isIgnore = false;
                      });
                    },
                    child: Text("Revert",
                        style: TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
