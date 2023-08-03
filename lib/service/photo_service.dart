import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/photo_model.dart';
import 'package:http/http.dart' as http;

final photoServiceProvider = Provider<PhotoService>((ref) => PhotoService());

class PhotoService {
  Future<List<PhotoModel>?> fetchPhotoList() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> photoList = jsonDecode(response.body);
      return photoList.map((e) => PhotoModel.fromMap(e)).toList();
    }
    else {
      return null;
    }
  }
}
