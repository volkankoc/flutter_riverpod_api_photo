import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/movie.dart';
import 'package:flutter_riverpod_test/providers/movie_controller.dart';

class MovieView extends ConsumerWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieControllerProvider);

    if (state.isLoading) {
      return _loadingState();
    } else {
      if (state.errorMessage != null) {
        return _errorState(state.errorMessage);
      } else {
        return _listLoadedState(state.movieList, ref);
      }
    }
  }

  Widget _loadingState() {
    return const CircularProgressIndicator();
  }

  Widget _errorState(String? error) {
    return const Text('Hata error');
  }

  Widget _listLoadedState(List<Movie>? movieList, WidgetRef ref) {
    if (movieList != null && movieList.isNotEmpty) {
      return Column(
        children: [
          ElevatedButton(
              onPressed: () {
                ref
                    .read(movieControllerProvider.notifier)
                    .addItem(Movie(title: 'denememem'));
              },
              child: const Text('ekle')),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final movie = movieList[index];

                return Card(
                  child: Text(movie.title ?? ''),
                );
              },
              itemCount: movieList.length,
            ),
          ),
        ],
      );
    } else {
      return _errorState('Liste boş');
    }
  }
}
