import 'dart:convert';

import 'package:flickstream/model/trending.dart';
import 'package:http/http.dart' as http;

const apikey = "b2ca9df73cc8e62d6f708c9fceb836a8";

class Api {
  static const imagePath = "https://image.tmdb.org/t/p/w500";
  final trendinUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=855fc7bfdd6ecaed1362423aa8541807";

  final topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=855fc7bfdd6ecaed1362423aa8541807";
  final upComingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=855fc7bfdd6ecaed1362423aa8541807";

  Future<List<Trending>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendinUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("something wrong");
    }
  }
}
