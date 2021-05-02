import 'package:flutter/material.dart';
import 'package:studentship/screens/displayquestion.dart';

class QBeach extends StatelessWidget {
  var dict;
  QBeach({this.dict});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg2.png"), fit: BoxFit.cover),
        ),
        child: dict != null
            ? Center(
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
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        onPressed: () {
                          if (dict["0"] != null && dict["0"] != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DQ(
                                  question: dict["0"],
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
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        onPressed: () {
                          if (dict["1"] != null && dict["1"] != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DQ(
                                  question: dict["1"],
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
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        onPressed: () {
                          if (dict["2"] != null && dict["2"] != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DQ(
                                  question: dict["2"],
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
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        onPressed: () {
                          if (dict["3"] != null && dict["3"] != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DQ(
                                  question: dict["3"],
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
                            style:
                                TextStyle(fontSize: 25, color: Colors.white)),
                        onPressed: () {
                          if (dict["4"] != null && dict["4"] != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DQ(
                                  question: dict["4"],
                                  number: 5,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Text("No Data :(",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
      ),
    );
  }
}
