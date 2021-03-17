import 'package:flutter/material.dart';
import 'package:studentship/dataa/lists.dart';
import 'package:studentship/screens/user.dart';

class Screen0 extends StatefulWidget {
  @override
  _Screen0State createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  var obj = listme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Color(0xFF1D1E33),
          title: Center(
            child: Text(
              'Leaderboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(3, 40, 0, 30),
              itemCount: obj.dict.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 50,
                      height: 50,
                      child: Center(
                        child: Text(
                          '${index + 1}.',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: 90,
                      height: 50,
                      child: Center(
                        child: Text(
                          '${obj.ls1[index]}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 90,
                      height: 50,
                      child: Center(
                        child: Text(
                          '${obj.ls2[index]}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Text(
                        'view profile',
                        style: TextStyle(
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => User(
                              name: obj.ls1[index],
                              score: obj.ls2[index],
                              year: obj.ls3[index],
                              branch: obj.ls4[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
