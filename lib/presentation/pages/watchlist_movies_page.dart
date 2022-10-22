import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/pages/tv_pages/watchlist_tv_page.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  bool _selected = false;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistMovieNotifier>(context, listen: false)
            .fetchWatchlistMovies());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistMovieNotifier>(context, listen: false)
        .fetchWatchlistMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ChoiceChip(
                label: Text('Movie'),
                selected: _selected,
                onSelected: (_selected) {
                  setState(() {
                    _pageIndex = 0;
                  });
                },
              ),
              ChoiceChip(
                label: Text('Tv Series'),
                selected: _selected,
                onSelected: (_selected) {
                  setState(() {
                    _pageIndex = 1;
                  });
                },
              ),
            ],
          ),
          _pageIndex == 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<WatchlistMovieNotifier>(
                    builder: (context, data, child) {
                      if (data.watchlistState == RequestState.Loading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.watchlistState == RequestState.Loaded) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final movie = data.watchlistMovies[index];
                            return MovieCard(movie);
                          },
                          itemCount: data.watchlistMovies.length,
                        );
                      } else {
                        return Center(
                          key: Key('error_message'),
                          child: Text(data.message),
                        );
                      }
                    },
                  ),
                )
              : WatchlistTvPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
