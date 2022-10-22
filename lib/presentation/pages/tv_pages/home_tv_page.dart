import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/pages/tv_pages/popular_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_pages/top_rated_tv_page.dart';
import 'package:ditonton/presentation/provider/tv_provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/provider/tv_provider/tv_popular_notifier.dart';
import 'package:ditonton/presentation/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';
import 'detail_tv_page.dart';

class HomeTvPage extends StatefulWidget {
  // static const ROUTE_NAME = '/home_tv_page';

  @override
  State<HomeTvPage> createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvListNotifier>(context, listen: false)
      ..fetchOnAirTvSeries()
      ..fetchPopularTvSeries()
      ..fetchTopRatedTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "On Air",
              style: kHeading6,
            ),
            Consumer<TvListNotifier>(builder: (context, data, child) {
              final state = data.onAirState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return TvList(data.onAirTvSeries);
              } else {
                return Text('Failed to load');
              }
            }),
            SubHeading(
              title: 'Popular Series',
              onTap: () =>
                  Navigator.pushNamed(context, PopularTvPage.ROUTE_NAME),
            ),
            Consumer<TvListNotifier>(
              builder: (context, data, child) {
                final state = data.popularTvSeriesState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvList(data.popularTvSeries);
                } else {
                  return Text('Failed to load');
                }
              },
            ),
            SubHeading(
              title: 'Top Rated Series',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedTvPage.ROUTE_NAME),
            ),
            Consumer<TvListNotifier>(
              builder: (context, data, child) {
                final state = data.topRatedTvSeriesState;
                if (state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return TvList(data.topRatedTvSeries);
                } else {
                  return Text('Failed to load');
                }
              },
            ),
          ],
        )),
      ),
    );
  }
}

class TvList extends StatelessWidget {
  final List<TvSeries> tvSeries;

  TvList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.ROUTE_NAME,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
