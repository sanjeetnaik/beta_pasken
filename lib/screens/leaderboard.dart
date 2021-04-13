import 'package:flutter/material.dart';
import 'package:studentship/dataa/lists.dart';
import 'package:studentship/screens/user.dart';

class Screen0 extends StatefulWidget {
  var obj;
  Screen0({this.obj});
  @override
  _Screen0State createState() => _Screen0State();
}

class _Screen0State extends State<Screen0> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("yeh lo");
    int i = 0;
    print(widget.obj.dict[i.toString()]);
    print("\"0\"");
    print("0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.blue,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: widget.obj.dict.length != 0
                ? ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    itemCount: widget.obj.dict.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: 50,
                            child: Center(
                              child: Text(
                                '${index + 1}.',
                                style: TextStyle(
                                    fontSize:
                                        (index == 0 || index == 1 || index == 2)
                                            ? 25
                                            : 20,
                                    color:
                                        (index == 0 || index == 1 || index == 2)
                                            ? Color.fromRGBO(201, 160, 77, 1)
                                            : Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: MediaQuery.of(context).size.width * 0.60,
                            height: 50,
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '${widget.obj.dict[index.toString()]['name']}',
                                  style: TextStyle(
                                      fontSize: (index == 0 ||
                                              index == 1 ||
                                              index == 2)
                                          ? 25
                                          : 20,
                                      color: (index == 0 ||
                                              index == 1 ||
                                              index == 2)
                                          ? Color.fromRGBO(201, 160, 77, 1)
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: 50,
                            child: Center(
                              child: Text(
                                '${widget.obj.dict[index.toString()]['score']}',
                                style: TextStyle(
                                    fontSize:
                                        (index == 0 || index == 1 || index == 2)
                                            ? 25
                                            : 20,
                                    color:
                                        (index == 0 || index == 1 || index == 2)
                                            ? Color.fromRGBO(201, 160, 77, 1)
                                            : Colors.black),
                              ),
                            ),
                          ),
                          // FlatButton(
                          //   padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          //   child: Text(
                          //     'view profile',
                          //     style: TextStyle(
                          //       color: Color(0xFF8D8E98),
                          //     ),
                          //   ),
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => User(
                          //           name: obj.ls1[index],
                          //           score: obj.ls2[index],
                          //           year: obj.ls3[index],
                          //           branch: obj.ls4[index],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      );
                    },
                  )
                : Center(
                    child: Text("No Data Yet :("),
                  ),
          ),
        ],
      ),
    );
  }
}
