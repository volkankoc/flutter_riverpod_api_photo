// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/photo_model.dart';
import 'package:flutter_riverpod_test/service/photo_service.dart';

final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  final photoService=ref.watch(photoServiceProvider);
  return PhotoRepository(photoService);
});

class PhotoRepository {
  final PhotoService _photoService;
  PhotoRepository(
    this._photoService,
  );

  Future<List<PhotoModel>?> fetchPhotoList() => _photoService.fetchPhotoList();
}
