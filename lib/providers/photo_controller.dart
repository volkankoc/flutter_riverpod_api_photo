import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/photo_model.dart';
import 'package:flutter_riverpod_test/providers/photo_state.dart';
import 'package:flutter_riverpod_test/repository/photo_repository.dart';




final photoControllerProvider=StateNotifierProvider.autoDispose<PhotoController, PhotoState>(
  (ref)=>PhotoController(ref)..fetchPhotoList());

class PhotoController extends StateNotifier<PhotoState>{
  PhotoController(this.ref):super(PhotoState());

  List<PhotoModel>? photoList = [];
  final Ref ref;

  void fetchPhotoList() async {
    final photoRepository = ref.read(photoRepositoryProvider);

    try {
      photoList=await photoRepository.fetchPhotoList();
      state=PhotoState(isLoading: false, photoList: photoList);
    }
    catch(e){
      state=PhotoState(isLoading: false, errorMessage: 'Resimler yüklenemedi.');
    }
  }
}