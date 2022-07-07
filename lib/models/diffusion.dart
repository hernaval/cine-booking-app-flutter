class Diffusion {
  final String id;
  final String date;
  final String quality;
  final int price;

  Diffusion(this.id, this.date, this.quality, this.price);


  Diffusion.fromMap(Map<String, dynamic> data ) :
        id = data['id'],
        date = data['date'],
        quality = data['quality'],
        price = data['price']
  ;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'price': price,
      'quality': quality,
    };
  }
}