part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();
}

class FetchPopularMovies extends PopularMoviesEvent {
  @override
  List<Object> get props => [];
}
