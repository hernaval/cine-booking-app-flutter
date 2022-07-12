class Diffusion {
  final String id;
  final String date;
  final String quality;
  final int price;
  final String? movieId;

  Diffusion(this.id, this.date, this.quality, this.price, this.movieId);


  Diffusion.fromMap(Map<String, dynamic> data ) :
        id = data['id'],
        date = data['date'],
        quality = data['quality'],
        price = data['price'],
        movieId = data['movieId']
  ;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'price': price,
      'quality': quality,
      'movieId': movieId
    };
  }
}