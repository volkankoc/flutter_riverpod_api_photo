import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) => MovieService());

class MovieService {
  Future<List<Movie>> fetchMovieList() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    return Movie.getList;
  }
}
