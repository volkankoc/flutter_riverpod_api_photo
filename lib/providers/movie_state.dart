import 'package:flutter_riverpod_test/models/movie.dart';

class MovieState {
  final bool isLoading;
  final List<Movie>? movieList;
  final String? errorMessage;

  MovieState({this.isLoading = true, this.movieList, this.errorMessage});
}
