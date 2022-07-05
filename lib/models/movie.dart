class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final int rating;
  final String resume;

  Movie(
      {this.id = "123",
      this.title = "",
      this.posterUrl = "",
      this.rating = 5,
      this.resume = ""});
}