import 'package:carousel_slider/carousel_slider.dart';
import 'package:flickstream/model/trending.dart';
import 'package:flickstream/services/services.dart';
import 'package:flickstream/utils/colors.dart';
import 'package:flickstream/view/home/widget/trending.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Trending>> trendingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.KBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.KBackground,
        title: const Text(
          'FlickStream',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColors.kWhite),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
                bottom: 15,
              ),
              child: Text(
                "Trending Movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kPrimary,
                ),
              ),
            ),
            FutureBuilder(
              future: trendingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.hasError.toString()),
                  );
                } else if (snapshot.hasData) {
                  return TrendingMovies(snapshot: snapshot);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 19, bottom: 20),
              child: Text(
                "Top Rated Movies",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
