import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/service/movie_service.dart';

import '../models/movie.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final service = ref.watch(movieServiceProvider);
  return MovieRepository(service);
});

class MovieRepository {
  final MovieService _service;

  MovieRepository(this._service);

  Future<List<Movie>> fetchMovieList() => _service.fetchMovieList();
}
