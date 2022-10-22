import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/usecases/tv_use_cases/search_tv_series.dart';

class TvSearchNotifier extends ChangeNotifier {
  final SearchTvSeries searchTvSeries;

  TvSearchNotifier({required this.searchTvSeries});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSeries> _searchTvResult = [];
  List<TvSeries> get searchTvResult => _searchTvResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchTvSeries.execute(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchTvResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
