import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';

class listme {
  var dict = {};

  var ls1 = [];
  var ls2 = [];
  var ls3 = [];
  var ls4 = [];
  var ls5 = [];

  dynamic myrequest() async {
    makelist();
    var responseData;
    try {
      var response = await http
          .get('https://serene-refuge-98596.herokuapp.com/leaderboard');
      responseData = json.decode(response.body);
    } catch (e) {
      print(e);
    }
    print(responseData);
    dict = responseData;
    return (dict);
  }

  void sort() {
    for (int i = 0; i < dict.length; i++) {
      for (int j = 1; j < dict.length; j++) {
        int a = dict[j - 1]['score'];
        int b = dict[j]['score'];
        if (a < b) {
          var temp = dict[j - 1];
          dict[j - 1] = dict[j];
          dict[j] = temp;
        }
      }
    }
  }

  void makelist() {
    for (int i = 0; i < dict.length; i++) {
      ls1.add(dict[i]['name']);
      ls2.add(dict[i]['score']);
    }
  }
}
