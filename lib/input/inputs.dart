import 'package:flutter/material.dart';
import 'package:studentship/screens/question_screen.dart';
import 'package:studentship/screens/leaderboard.dart';

class Input extends StatefulWidget {
  var storage;

  Input({this.storage});

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> with SingleTickerProviderStateMixin {
  Widget addicon = Icon(
    Icons.add,
    size: 64,
    color: Color.fromRGBO(255, 145, 77, 1),
  );

  var tl = Icon(
    Icons.add,
    size: 64,
    color: Colors.white,
  );
  var tr = Icon(
    Icons.add,
    size: 64,
    color: Colors.white,
  );
  var c = Icon(
    Icons.add,
    size: 64,
    color: Colors.white,
  );
  var lso1 = {};
  var lso2 = {};
  var lso3 = {};

  var lsss = {};
  var god = {};
  var keyss = [];

  void _tickme() {
    if (widget.storage != null) {
      if (widget.storage["\"1\""] != null && widget.storage["\"1\""] != "") {
        setState(() {
          tl = Icon(
            Icons.check,
            size: 64,
            color: Colors.white,
          );
        });
      } else {
        setState(() {
          tl = Icon(
            Icons.add,
            size: 64,
            color: Colors.white,
          );
        });
      }
      if (widget.storage["\"2\""] != null && widget.storage["\"2\""] != "") {
        setState(() {
          tr = Icon(
            Icons.check,
            size: 64,
            color: Colors.white,
          );
        });
      } else {
        setState(() {
          tr = Icon(
            Icons.add,
            size: 64,
            color: Colors.white,
          );
        });
      }
      if (widget.storage["\"3\""] != null && widget.storage["\"3\""] != "") {
        setState(() {
          c = Icon(
            Icons.check,
            size: 64,
            color: Colors.white,
          );
        });
      } else {
        setState(() {
          c = Icon(
            Icons.add,
            size: 64,
            color: Colors.white,
          );
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.storage != null) {
      print(widget.storage);
      god = widget.storage;
      print(god);
      for (var v in widget.storage.keys) {
        keyss.add(v);
      }
      //ticking all the elements that are filled in
      _tickme();
      print(keyss);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.png"), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 8,
                    color: Color.fromRGBO(255, 145, 77, 1),
                  ),
                ),
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () async {
                        lso1 = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question(
                                    qnum: 1,
                                    prevdata: widget.storage["\"1\""],
                                  )),
                        );
                        setState(
                          () {
                            if (lso1 != null) {
                              var temp;
                              for (var v in lso1.values) {
                                temp = v;
                              }
                              widget.storage["\"1\""] = temp;
                              tl = Icon(
                                Icons.check,
                                size: 64,
                                color: Colors.white,
                              );
                            }
                          },
                        );
                      },
                      child: Center(child: tl),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    width: 8,
                    color: Color.fromRGBO(255, 145, 77, 1),
                  ),
                ),
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () async {
                        lso2 = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question(
                                    qnum: 2,
                                    prevdata: widget.storage["\"2\""],
                                  )),
                        );
                        setState(
                          () {
                            if (lso2 != null) {
                              var temp;
                              for (var v in lso2.values) {
                                temp = v;
                              }
                              widget.storage["\"2\""] = temp;
                              print(temp);
                              tr = Icon(
                                Icons.check,
                                size: 64,
                                color: Colors.white,
                              );
                            }
                            print(widget.storage);
                          },
                        );
                      },
                      child: Center(child: tr),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 8,
                    color: Color.fromRGBO(255, 145, 77, 1),
                  ),
                ),
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () async {
                        lso3 = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question(
                                    qnum: 3,
                                    prevdata: widget.storage["\"3\""],
                                  )),
                        );
                        setState(
                          () {
                            if (lso3 != null) {
                              var temp;
                              for (var v in lso3.values) {
                                temp = v;
                              }
                              widget.storage["\"3\""] = temp;
                              c = Icon(
                                Icons.check,
                                size: 64,
                                color: Colors.white,
                              );
                            }
                            print(widget.storage);
                          },
                        );
                      },
                      child: Center(child: c),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 145, 77, 1),
                    ),
                    height: 72,
                    width: 200,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context, widget.storage);
                      },
                      child: Center(
                        child: Text(
                          'Save Progress',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
