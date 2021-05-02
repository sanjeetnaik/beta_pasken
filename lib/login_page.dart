import 'package:flutter/material.dart';
import 'package:studentship/failure.dart';
import 'package:studentship/input/inputs.dart';
import 'first_screen.dart';
import 'sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool flag;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  semanticsLabel: "Processing",
                  backgroundColor: Colors.blue,
                  valueColor: new AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(255, 145, 77, 1)),
                  strokeWidth: 15,
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                    ),
                    Column(
                      children: [
                        Image(
                          width: 320,
                          image: AssetImage("assets/name.png"),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    _signInButton(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _signInButton() {
    return FlatButton(
      color: Color.fromRGBO(255, 145, 77, 1),
      splashColor: Colors.grey,
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        var result = await signInWithGoogle();
        setState(() {
          isLoading = false;
        });

        print("result : ");
        print(result);

        if (result != null) {
          flag = true;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return FirstScreen();
              },
            ),
          );
        } else {
          print('not registered');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Failure()),
          );
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      height: 65,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Somaiya ID',
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
