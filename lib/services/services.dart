import 'dart:convert';
import 'package:flickstream/model/casts.dart';
import 'package:flickstream/model/movie.dart';
import 'package:http/http.dart' as http;

const apikey = "b2ca9df73cc8e62d6f708c9fceb836a8";

class Apiservices {
  final nowShowingApi =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey";

  final upcomingApi =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey";
  final popularApi =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apikey";

  final castApi =
      "https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=$apikey";

  Future<List<Movie>> getNowShowing() async {
    Uri url = Uri.parse(nowShowingApi);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        List<Movie> movies =
            data.map((movie) => Movie.fromJson(movie)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      return [];
    }
  }

// to get upcoming movies
  Future<List<Movie>> getUpComingMovies() async {
    Uri url = Uri.parse(upcomingApi);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        List<Movie> movies =
            data.map((movie) => Movie.fromJson(movie)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      return [];
    }
  }

//to get popularMovies
  Future<List<Movie>> getPopularMovies() async {
    Uri url = Uri.parse(popularApi);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        List<Movie> movies =
            data.map((movie) => Movie.fromJson(movie)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      return [];
    }
  }

  // cast and crew

  Future<List<Cast>> getAllCasts() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/movie/1281826/credits?api_key=b2ca9df73cc8e62d6f708c9fceb836a8");
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)["cast"];
        List<Cast> casts = data.map((cast) => Cast.fromJson(cast)).toList();
        return casts;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      return [];
    }
  }
}
