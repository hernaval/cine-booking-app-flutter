import 'package:i_cine_app/data/repositories/movie_repository.dart';
import 'package:i_cine_app/data/services/local_service.dart';
import 'package:i_cine_app/models/movie.dart';

class MovieRepositoryImpl implements IMovieRepository {
  final LocalService _localService;

  MovieRepositoryImpl(this._localService);

  @override
  Future<List<Movie>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getLasts() {
    // TODO: implement getLasts
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTrends() async {
    var items = await _localService.list();
    return items.map((e) => Movie.fromMap(e)).toList();
  }

}