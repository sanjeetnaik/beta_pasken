import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    var text =
        "We, at Pasken believe in bringing fascinating and extraordinary ideas to reality. Behind the scenes of this project include a team of dreamers who have been striving hard to bring to life a creation that is a perfect mixture of the very trending fantasy leagues with educational benefits. ";
    var text1 =
        " Come join us in making this vision reach greater heights with your participation and insights!";
    var text2 =
        "For any queries: Contact us on our whatsapp number 8369423234 or email: meetgandhi412@gmail.com";
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg2.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  text2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
