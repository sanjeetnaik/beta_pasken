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
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF1D1E33),
            title: Center(
              child: Text(
                'Question $qnum',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF1D1E33),
            ),
            height: 320,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ENTER QUESTION',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
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
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFEB1555),
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
                            style: TextStyle(fontSize: 23),
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
