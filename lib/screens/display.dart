import 'dart:convert';
import 'package:studentship/screens/displayquestion.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  var questions = [];

  Display({this.questions});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  bool isEmpty = false;

  _checkdict() {
    if (dict["1"] != "" &&
        dict["2"] != "" &&
        dict["3"] != "" &&
        dict["4"] != "" &&
        dict["5"] != "") {
      setState(() {
        isEmpty = true;
      });
    }
  }

  var dict;
  @override
  void initState() {
    super.initState();
    print("hello");
    if (widget.questions.isNotEmpty) {
      dict = json.decode(widget.questions[0]);
      print(dict);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: FlatButton(
                  child: Text('Question 1',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    if (dict["1"] != null && dict["1"] != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DQ(
                            question: dict["1"],
                            number: 1,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: FlatButton(
                  child: Text('Question 2',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    if (dict["2"] != null && dict["2"] != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DQ(
                            question: dict["2"],
                            number: 2,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: FlatButton(
                  child: Text('Question 3',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    if (dict["3"] != null && dict["3"] != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DQ(
                            question: dict["3"],
                            number: 3,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: FlatButton(
                  child: Text('Question 4',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    if (dict["4"] != null && dict["4"] != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DQ(
                            question: dict["4"],
                            number: 4,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: FlatButton(
                  child: Text('Question 5',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  onPressed: () {
                    if (dict["5"] != null && dict["5"] != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DQ(
                            question: dict["5"],
                            number: 5,
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Question Lists'),
    //   ),
    //   body: Center(
    //     child: dict != null && isEmpty != true
    //         ? Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(
    //                 dict["1"] != null && dict["1"] != ""
    //                     ? 'Question 1 :      ${dict["1"]}'
    //                     : "",
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               SizedBox(
    //                 height: 55,
    //               ),
    //               Text(
    //                 dict["2"] != null && dict["2"] != ""
    //                     ? 'Question 2 :      ${dict["2"]}'
    //                     : "",
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               SizedBox(
    //                 height: 55,
    //               ),
    //               Text(
    //                 dict["3"] != null && dict["3"] != ""
    //                     ? 'Question 3 :      ${dict["3"]}'
    //                     : "",
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               SizedBox(
    //                 height: 55,
    //               ),
    //               Text(
    //                 dict["4"] != null && dict["4"] != ""
    //                     ? 'Question 4 :      ${dict["4"]}'
    //                     : "",
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               SizedBox(
    //                 height: 55,
    //               ),
    //               Text(
    //                 dict["5"] != null && dict["5"] != ""
    //                     ? 'Question 5 :      ${dict["5"]}'
    //                     : "",
    //                 style: TextStyle(fontSize: 25),
    //               ),
    //               SizedBox(
    //                 height: 55,
    //               ),
    //             ],
    //           )
    //         : Text('No Data', style: TextStyle(fontSize: 25)),
    //   ),
    // );
  }
}
