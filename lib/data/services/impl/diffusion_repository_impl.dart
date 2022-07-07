import 'package:i_cine_app/data/repositories/diffusion_repository.dart';
import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/models/movie.dart';

import '../local_service.dart';

class DiffusionRepositoryImpl implements IDiffusionRepository {
  final LocalService _localService;

  DiffusionRepositoryImpl(this._localService);

  @override
  Future<List<Diffusion>> getDiffusionsByMovie(Movie movie) async {

    var items = await _localService.listRelatedById(movie.id);
    return items.map((e) => Diffusion.fromMap(e)).toList();
  }

}