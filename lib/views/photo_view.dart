import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/photo_model.dart';
import 'package:flutter_riverpod_test/providers/photo_controller.dart';
import 'package:http/retry.dart';

class PhotoView extends ConsumerWidget {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final state=ref.watch(photoControllerProvider);
   if (state.isLoading)
   {
    return _loadingState();
   }
   else if(state.errorMessage!=null)
   {
     return _errorState(state.errorMessage);
   }
   else
   {
     return _listLoadedState(state.photoList, ref);
   }
  }
}

Widget _loadingState() {
  return const CircularProgressIndicator();
}
Widget _errorState(String? error) {
  return const Text('Hata error');
}
Widget _listLoadedState(List<PhotoModel>? photoList, WidgetRef ref) {
  if (photoList != null && photoList.isNotEmpty) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final photo = photoList[index];

              return Card(
                child: Column(
                  children: [
                    Text(photo.title ?? ''),
                    const SizedBox(height: 10,),
                    Image.network(photo.url ?? ''),
                  ],
                ),
              );
            },
            itemCount: photoList.length,
          ),
        ),
      ],
    );
  } else {
    return _errorState('Fotoğraf yok');
  }
}