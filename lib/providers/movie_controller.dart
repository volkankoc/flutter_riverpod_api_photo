import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/movie.dart';
import 'package:flutter_riverpod_test/providers/movie_state.dart';
import 'package:flutter_riverpod_test/repository/movie_repository.dart';

/* import '../models/movie.dart';

part 'movie_state.dart'; */

final countProvider = StateProvider<int>((ref) => 0);

final movieListProvider = FutureProvider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return repository.fetchMovieList();
});

// Provider
final movieControllerProvider =
    StateNotifierProvider.autoDispose<MovieController, MovieState>(
        (ref) => MovieController(ref)..fetchMovieList());

//Controller
class MovieController extends StateNotifier<MovieState> {
  MovieController(this.ref) : super(MovieState());

  List<Movie> movieList = [];
  final Ref ref;

  void fetchMovieList() async {
    final movieRepository = ref.read(movieRepositoryProvider);

    try {
      movieList = await movieRepository.fetchMovieList();
      state = MovieState(isLoading: false, movieList: movieList);
    } catch (e) {
      state =        MovieState(isLoading: false, errorMessage: '...');
          }
  }

  void addItem(Movie movie) {
    movieList.add(movie);
    state = MovieState(isLoading: false, movieList: movieList);
  }
}
