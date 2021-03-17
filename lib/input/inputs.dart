import 'package:flutter/material.dart';
import 'package:studentship/screens/question_screen.dart';
import 'package:studentship/screens/screen0.dart';
import 'package:studentship/sign_in.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  var tl = AssetImage('assets/add.png');
  var tr = AssetImage('assets/add.png');
  var c = AssetImage('assets/add.png');
  var bl = AssetImage('assets/add.png');
  var br = AssetImage('assets/add.png');
  var lso1 = [];
  var lso2 = [];
  var lso3 = [];
  var lso4 = [];
  var lso5 = [];
  var lsss = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(from: 1);
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF1D1E33),
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
            title: Center(
              child: Text(
                'User Input',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF1D1E33),
                    ),
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () async {
                            lso1 = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                        qnum: 1,
                                      )),
                            );
                            setState(
                              () {
                                // if (lso1.length != 0) {
                                //   tl = AssetImage('assets/check.png');
                                // }
                              },
                            );
                          },
                          child: Center(
                            child: ScaleTransition(
                              scale: _animation,
                              alignment: Alignment.center,
                              child: Image(
                                image: tl,
                                height: 150,
                                width: 150,
                              ),

                              // child: Image.network(
                              //   '$tl',
                              //   height: 150,
                              //   width: 150,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF1D1E33),
                    ),
                    height: 150,
                    width: 150,
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () async {
                            lso2 = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                        qnum: 2,
                                      )),
                            );
                            setState(() {
                              // if (lso2.length != 0) {
                              //   tr = AssetImage('assets/check.png');
                              // }
                            });
                          },
                          child: Center(
                            child: ScaleTransition(
                              scale: _animation,
                              alignment: Alignment.center,
                              child: Image(
                                image: tr,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Color(0xFF1D1E33),
                ),
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: () async {
                        lso3 = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question(
                                    qnum: 3,
                                  )),
                        );
                        setState(() {
                          // if (lso3.length != 0) {
                          //   c = AssetImage('assets/check.png');
                          // }
                        });
                      },
                      child: Center(
                        child: ScaleTransition(
                          scale: _animation,
                          alignment: Alignment.center,
                          child: Image(
                            image: c,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF1D1E33),
                    ),
                    height: 150,
                    width: 150,
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () async {
                            lso4 = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Question(
                                        qnum: 4,
                                      )),
                            );
                            setState(() {
                              // if (lso4.length != 0) {
                              //   bl = AssetImage('assets/check.png');
                              // }
                            });
                          },
                          child: Center(
                            child: ScaleTransition(
                              scale: _animation,
                              alignment: Alignment.center,
                              child: Image(
                                image: bl,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFF1D1E33),
                    ),
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: () async {
                            lso5 = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(
                                  qnum: 5,
                                ),
                              ),
                            );
                            setState(() {
                              // if (lso5.length != 0) {
                              //   br = AssetImage('assets/check.png');
                              // }
                            });
                          },
                          child: Center(
                            child: ScaleTransition(
                              scale: _animation,
                              alignment: Alignment.center,
                              child: Image(
                                image: br,
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFEB1555),
                    ),
                    height: 80,
                    width: 150,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          tl = AssetImage('assets/add.png');
                          tr = AssetImage('assets/add.png');
                          c = AssetImage('assets/add.png');
                          bl = AssetImage('assets/add.png');
                          br = AssetImage('assets/add.png');
                        });
                      },
                      child: Center(
                        child: Text(
                          'Clear',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal.shade200,
                    ),
                    height: 80,
                    width: 150,
                    child: FlatButton(
                      onPressed: () {
                        if (lsss.isEmpty) {
                          lsss.add(lso1);
                          lsss.add(lso2);
                          lsss.add(lso3);
                          lsss.add(lso4);
                          lsss.add(lso5);
                          print(lsss);
                        } else {
                          print(lsss);
                        }
                        Navigator.pop(context, lsss);
                      },
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Center(
              //   child: ScaleTransition(
              //     scale: _animation,
              //     child: Image.network(
              //         'https://img.icons8.com/cotton/2x/checkmark.png'),
              //   ),
              // ),
              // Center(
              //   child: ScaleTransition(
              //     scale: _animation,
              //     alignment: Alignment.center,
              //     child: Image.network(
              //         'https://icons-for-free.com/iconfiles/png/512/add+board+new+plus+icon-1320186882821780394.png'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}