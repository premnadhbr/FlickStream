import 'dart:convert';

import 'package:flickstream/model/trending.dart';
import 'package:http/http.dart' as http;

const apikey = "b2ca9df73cc8e62d6f708c9fceb836a8";

class Api {
  static const imagePath = "https://image.tmdb.org/t/p/w500";
  final trendinUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=b2ca9df73cc8e62d6f708c9fceb836a8";

  final popularTv =
      'https://api.themoviedb.org/3/tv/popular?api_key=b2ca9df73cc8e62d6f708c9fceb836a8';

  final topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=b2ca9df73cc8e62d6f708c9fceb836a8";
  final upComingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=b2ca9df73cc8e62d6f708c9fceb836a8";
  final malayalamUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=b2ca9df73cc8e62d6f708c9fceb836a8&with_original_language=ml';

  Future<List<Trending>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendinUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

  Future<List<Trending>> topRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

  Future<List<Trending>> malayalamMovies() async {
    final response = await http.get(Uri.parse(malayalamUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

  Future<List<Trending>> upComingMovies() async {
    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }

    Future<List<Trending>> popularTvShows() async {
    final response = await http.get(Uri.parse(popularTv));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }
}
