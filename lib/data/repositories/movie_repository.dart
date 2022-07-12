import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/models/movie.dart';

abstract class IMovieRepository {
  Future<List<Movie>> getTrends();
  Future<List<Movie>> getLasts();
  Future<List<Movie>> getAll();
  Future<Movie> getMovieByDiffusion(Diffusion diffusion);
}