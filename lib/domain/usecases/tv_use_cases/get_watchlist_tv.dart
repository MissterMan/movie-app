import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';
import '../../entities/tv.dart';

class GetWatchlistTvSeries {
  final TvSeriesRepository repository;

  GetWatchlistTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getWatchlistTvSeries();
  }
}
