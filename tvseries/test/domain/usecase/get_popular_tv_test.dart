import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/entities/tv.dart';
import 'package:tvseries/domain/usecase/get_popular_tv.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetPopularTvSeries(mockTvSeriesRepository);
  });

  final tTvSeries = <TvSeries>[];

  group('GetPopularTvSeries Tests', () {
    group('execute', () {
      test(
          'should get list of tv series from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvSeriesRepository.getPopularTvSeries())
            .thenAnswer((_) async => Right(tTvSeries));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvSeries));
      });
    });
  });
}
