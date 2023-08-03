// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../models/photo_model.dart';

class PhotoState {
  final bool isLoading;
  final List<PhotoModel>? photoList;
  final String? errorMessage;
  PhotoState({
    this.isLoading=true,
    this.photoList,
    this.errorMessage,
  });
}
