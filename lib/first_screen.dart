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
  @override
  void initState() {
    super.initState();
    print("start");
    var userr = FirebaseAuth.instance.currentUser;
    openFile('${userr.uid}');
    print("created");
  }

  void dispose() {
    super.dispose();
  }

  var lsss = [];
  int _counter = 0;
  File file;
  var filePath;
  var storageData = {};
  var user = FirebaseAuth.instance.currentUser;

  Future openFile(String username) async {
    try {
      print("yolo");
      String dir = (await getApplicationDocumentsDirectory()).path;
      print(dir);
      this.file = new File('$dir/helloworld.txt');
      print(this.file);
      bool check = this.file.existsSync();
      print(check);
      if (check != false) {
        print('file exists');
        this.filePath = file.uri;
        print(this.filePath);
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  }

  void _incrementCounter(var dataa) async {
    print("hiya");
    setState(() {
      _counter++;
      this.storageData['"$_counter"'] = {
        '"question"': '"question${dataa[0][0].toString()}"'
      };
      print(this.storageData);
      // appendFile(this.storageData);
      writeFile(this.storageData);
      var data = readFile();
      print(data);
    });
  }

  void writeFile(var data) async {
    file.writeAsStringSync(data.toString());
    await readFile();
  }

  Future<dynamic> readFile() async {
    try {
      String data = await this.file.readAsString();
      print("file data : " + data.toString());
      var returnData = jsonDecode(data);
      print("hello " + returnData.toString());
      print(returnData["1"]);
      return returnData;
    } catch (e) {
      print(e);
    }
  }

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
                  onPressed: () {
                    print(user.displayName);
                    setState(() async {
                      lsss = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Input()),
                      );
                    });
                    print(lsss);
                    _incrementCounter(lsss);
                    print("done");
                  },
                  child: Text('Play Game!!'),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Read Data'),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('LeaderBoard'),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
