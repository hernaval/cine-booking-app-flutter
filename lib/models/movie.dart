

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final int rating;
  final String category;
  final bool isTrending;



  Movie(
      {this.id = "123",
      this.title = "",
      this.posterUrl = "",
      this.rating = 5,
        this.category = "Action",
        this.isTrending = false
      });

  Movie.fromMap(Map<String, dynamic> data ) :
        id = data['id'],
        title = data['title'],
        posterUrl = data['posterUrl'],
      rating = data['rating'],
      category = data['category'],
      isTrending = data['isTrending']

  ;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'posterUrl': posterUrl,
      'rating': rating,
      'cateogory': category,
      'isTrending': isTrending,
    };
  }

}