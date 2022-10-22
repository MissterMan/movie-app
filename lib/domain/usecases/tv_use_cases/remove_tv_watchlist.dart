import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';

class RemoveTvWatchlist {
  final TvSeriesRepository repository;

  RemoveTvWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tvSeriesDetail) {
    return repository.removeTvWatchlist(tvSeriesDetail);
  }
}
