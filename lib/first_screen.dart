import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:studentship/input/inputs.dart';
import 'package:studentship/screens/display.dart';
import 'sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'dart:convert';

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
    var userr = FirebaseAuth.instance.currentUser;
    // openFile('${userr.uid}');
    print("created");
    _openfile();
    _openfile1();
    lsss = {
      "\"1\"": null,
      "\"2\"": null,
      "\"3\"": null,
      "\"4\"": null,
      "\"5\"": null,
    };

    lsss1 = {
      "\"isIgnore\"": null,
    };
    _setisIgnore();
  }

  _setisIgnore() async {
    var ls = [];
    var value = await _read1();
    if (value != null) {
      ls.add(value);
    } else {
      setState(() {
        isIgnore = false;
      });
    }
    print("object");
    print(ls);
  }

  _openfile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    bool check = File('${directory.path}/my_file.txt').existsSync();

    if (check == true) {
      setState(() {
        file = File('${directory.path}/my_file.txt');
      });
      print("File exists");
    } else {
      setState(() {
        file = new File('${directory.path}/my_file.txt');
      });
      print("File don't exists");
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
    print("delete fil 1");
    file1 = new File('${directory.path}/my.txt');
  }

  _write1(String text) async {
    var value = await _read1();
    if (value != null) {
      text = value + " " + text;
    }
    print(text);
    await file1.writeAsString(text);
  }

  Future<String> _read1() async {
    String text;
    try {
      text = await file1.readAsString();
      print("text is ");
      print(text);
      text = text.toString();
    } catch (e) {
      print(e);
      print("Couldn't read file");
    }
    return text;
  }

  Future _clearfile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    file = File('${directory.path}/my_file.txt');
    file.delete();
    file = new File('${directory.path}/my_file.txt');
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
          automaticallyImplyLeading: false,
          title: Text('Home'),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isIgnore != true
                    ? RaisedButton(
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
                            var a = await _clearfile();
                            await _write(lsss.toString());
                            _clearlsss();
                            var value = await _read();
                            if (value != null) {
                              print("tis the value : " + value);
                            }
                            // _updatelsss();
                          }
                        },
                        child: Text('Enter Rooster'),
                      )
                    : Text(''),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
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
                  child: Text('Read Data'),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    _clearfile();
                  },
                  child: Text('Clear Data'),
                ),
                SizedBox(
                  height: 30,
                ),
                isIgnore != true
                    ? RaisedButton(
                        onPressed: () async {
                          int counter = 0;
                          print("final data :");
                          var ls = [];
                          var value = await _read();
                          if (value != null) {
                            ls.add(value);
                          }
                          var output = json.decode(value);
                          if (output != null) {
                            for (var k in output.values) {
                              if (k != null) {
                                counter++;
                              }
                            }
                          }

                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "WARNING!",
                            desc:
                                "You have only entered $counter questions. Do you wish to continue?",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isIgnore = true;
                                    lsss1[_conversion("isIgnore")] =
                                        _conversion("1");
                                  });
                                  print(lsss1);
                                  await _clearfile1();
                                  await _write1(lsss1.toString());
                                  Navigator.pop(context);
                                },
                                color: Color.fromRGBO(0, 179, 134, 1.0),
                              ),
                              DialogButton(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(116, 116, 191, 1.0),
                                  Color.fromRGBO(52, 138, 199, 1.0)
                                ]),
                              )
                            ],
                          ).show();

                          print(ls);
                          print(counter);
                        },
                        child: Text('Final Submit'),
                      )
                    : Text(""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
