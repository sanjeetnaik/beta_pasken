import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  var qnum;
  String prevdata;

  Question({this.qnum, this.prevdata});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                'QUESTION $qnum',
                style: TextStyle(
                  color: Color.fromRGBO(255, 145, 77, 1),
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ),
        body: QuestionScreen(
          qnum: qnum,
          prevdata: prevdata,
        ),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  QuestionScreen({this.qnum, this.prevdata});

  var qnum;
  var prevdata;

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var question;
  String prevquestion;
  final _formKey = GlobalKey<FormState>();
  var ls = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prevquestion = widget.prevdata;
    if (prevquestion != null) {
      prevquestion = prevquestion.substring(1, prevquestion.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(255, 145, 77, 0.85),
            ),
            height: 320,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ENTER QUESTION',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 0, 35, 20),
                        child: TextFormField(
                          style: TextStyle(fontSize: 16),
                          initialValue:
                              prevquestion != null ? prevquestion : "",
                          validator: (value) {
                            print(value);
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              question = value;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        height: 80,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                              String tempstr1 =
                                  "\"" + widget.qnum.toString() + "\"";
                              String tempstr2 =
                                  "\"" + question.toString() + "\"";
                              ls[tempstr1] = tempstr2;
                              Navigator.pop(context, ls);
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 23,
                              color: Color.fromRGBO(255, 145, 77, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
