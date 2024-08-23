import 'package:carousel_slider/carousel_slider.dart';
import 'package:flickstream/model/movie.dart';
import 'package:flickstream/services/services.dart';
import 'package:flickstream/view/overview.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Movie>> nowShowing;
  late Future<List<Movie>> upcoming;
  late Future<List<Movie>> popular;

  @override
  void initState() {
    super.initState();
    nowShowing = Apiservices().getNowShowing();
    upcoming = Apiservices().getUpComingMovies();
    popular = Apiservices().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Movie App"),
      //   leading: const Icon(Icons.menu),
      //   centerTitle: true,
      //   actions: const [
      //     Icon(Icons.search_off_rounded),
      //     SizedBox(
      //       width: 20,
      //     ),
      //     Icon(Icons.notifications),
      //     SizedBox(
      //       width: 10,
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Now showing",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: nowShowing,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            // print(movie.overview);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return OverViewPage(
                                  movieName: movie.title,
                                  image: movie.backdropPath,
                                  overview: movie.overview,
                                );
                              },
                            ));
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 0,
                                child: Text(
                                  movie.title,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.7,
                        autoPlayInterval: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Up Coming Movies",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 250,
                child: FutureBuilder(
                  future: upcoming,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final upComingMovies = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: upComingMovies.length,
                        itemBuilder: (context, index) {
                          final upcoimgMovies = upComingMovies[index];
                          return Stack(
                            children: [
                              Container(
                                width: 180,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500/${upcoimgMovies.backdropPath}",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Popular Movies",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 250,
                child: FutureBuilder(
                  future: popular,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final popularMovies = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularMovies.length,
                        itemBuilder: (context, index) {
                          final popularmovies = popularMovies[index];
                          return Stack(
                            children: [
                              Container(
                                width: 180,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500/${popularmovies.backdropPath}",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
