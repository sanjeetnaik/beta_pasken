// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future createAlbum(String title) async {
//   final response = await http.post(
//     Uri.https('jsonplaceholder.typicode.com', 'albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: json.encode(value){
//       'title': title,
//     }),
//   );
//   if (response.statusCode == 201) {
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
