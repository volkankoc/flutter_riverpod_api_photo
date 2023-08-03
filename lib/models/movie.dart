// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  int? id;
  String? title;
  String? director;

  Movie({this.id, this.title, this.director});

  static List<Movie> get getList => [
        Movie(id: 1, title: 'Film 1', director: 'Yönetmen 1'),
        Movie(id: 2, title: 'Film 2', director: 'Yönetmen 2'),
        Movie(id: 3, title: 'Film 3', director: 'Yönetmen 3'),
        Movie(id: 4, title: 'Film 4', director: 'Yönetmen 4'),
        Movie(id: 5, title: 'Film 5', director: 'Yönetmen 5'),
        Movie(id: 6, title: 'Film 6', director: 'Yönetmen 6'),
        Movie(id: 7, title: 'Film 7', director: 'Yönetmen 7'),
        Movie(id: 8, title: 'Film 8', director: 'Yönetmen 8'),
        Movie(id: 9, title: 'Film 9', director: 'Yönetmen 9'),
        Movie(id: 10, title: 'Film 10', director: 'Yönetmen 10'),
      ];
}
