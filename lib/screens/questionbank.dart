import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:studentship/widgets/displayqbeach.dart';

class QB extends StatelessWidget {
  var dict;

  QB({this.dict});

  Future getQB() async {
    var responseData;
    var response;

    try {
      response = await http
          .get('https://serene-refuge-98596.herokuapp.com/question-bank');
      responseData = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    print(responseData);

    print(responseData);
    if (responseData == null) {
      return (null);
    }
    dict = responseData;
    return (dict);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
      },
      child: QBeach(
        dict: dict,
      ),
    );
  }
}
