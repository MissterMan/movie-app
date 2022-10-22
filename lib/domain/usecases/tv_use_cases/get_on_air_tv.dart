import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

import '../../../common/failure.dart';
import '../../entities/tv.dart';

class GetOnAirTvSeries {
  late final TvSeriesRepository repository;

  GetOnAirTvSeries(this.repository);

  Future<Either<Failure, List<TvSeries>>> execute() {
    return repository.getOnAirTvSeries();
  }
}