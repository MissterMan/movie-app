import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../../entities/tv.dart';

class GetPopularTvSeries {
  late final TvSeriesRepository repository;

  GetPopularTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getPopularTvSeries();
  }
}
