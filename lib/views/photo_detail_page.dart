import 'package:flutter/material.dart';
import 'package:flutter_riverpod_test/models/photo_model.dart';

class PhotoDetailPage extends StatelessWidget {
  final PhotoModel photo;
  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title ?? ''),
      ),
      body: Column(
        children: [
          Image.network(photo.url ?? ''),
          const SizedBox(
            height: 10,
          ),
          Text(photo.title ?? ''),
        ],
      ),
    );
  }
}
