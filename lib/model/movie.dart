class Movie {
  final String title;
  final String backdropPath;
  final String overview;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.overview,
  });

  // Factory constructor for creating a Movie from JSON data
  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      backdropPath: map['backdrop_path'],
      overview: map['overview'],
    );
  }

  // Method to convert a Movie instance into a Map (JSON structure)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backdrop_path': backdropPath,
      'overview': overview,
    };
  }
}
