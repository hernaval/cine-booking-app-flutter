import 'package:i_cine_app/models/movie.dart';

import '../../models/diffusion.dart';

abstract class IDiffusionRepository {
  Future<List<Diffusion>> getDiffusionsByMovie(Movie movie);
}