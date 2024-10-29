import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Future<Map<String, dynamic>?> getJsonData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      debugPrint('${response.statusCode}');
      return null;
    }
  }
}
