import 'package:flutter/material.dart';
import 'package:studentship/input/inputs.dart';
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

  @override
  void initState() {
    super.initState();
    print("start");
    var userr = FirebaseAuth.instance.currentUser;
    // openFile('${userr.uid}');
    print("created");
    _openfile();
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

  var lsss = {};
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
                RaisedButton(
                  onPressed: () async {
                    var output;
                    String previousinput = await _read();
                    if (previousinput != null) {
                      output = json.decode(previousinput);
                    }

                    print("previous input : ");
                    print(output.runtimeType);

                    var storage = output;
                    if (output != null) {
                      for (var k in output.keys) {
                        print(k.runtimeType);
                      }
                    }

                    var temp = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Input(
                          storage: storage,
                        ),
                      ),
                    );

                    setState(() {
                      lsss = temp;
                    });

                    print(lsss.toString());

                    if (lsss != null && lsss != {}) {
                      var a = await _clearfile();
                      await _write(lsss.toString());
                      var value = await _read();
                      if (value != null) {
                        print("tis the value : " + value);
                      }
                      _updatelsss();
                    }
                  },
                  child: Text('Play Game!!'),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () async {
                    var value = await _read();
                    if (value != null) {
                      print("tis the value : " + value);
                    }
                  },
                  child: Text('Read Data'),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {
                    _clearfile();
                  },
                  child: Text('LeaderBoard'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
