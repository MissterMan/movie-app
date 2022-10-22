import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

import '../../../common/failure.dart';
import '../../repositories/tv_repository.dart';

class SaveTvWatchlist {
  final TvSeriesRepository repository;

  SaveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeriesDetail) {
    return repository.saveTvWatchlist(tvSeriesDetail);
  }
}
