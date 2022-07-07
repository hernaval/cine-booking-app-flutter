import 'package:i_cine_app/models/diffusion.dart';
import 'package:i_cine_app/models/user.dart';

class Booking {
  final String id;
  final String diffusionId;
  final String? userId;
  final int reservedSeats;
  final String time;

  Booking(this.id, this.diffusionId, this.userId, this.reservedSeats, this.time);

  Booking.fromMap(Map<String, dynamic> data ) :
        id = data['id'],
        time = data['time'],
        diffusionId = data['diffusionId'],
        userId = data['userId'],
        reservedSeats = data['reservedSeats']
  ;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'diffusionId': diffusionId,
      'userId': userId,
      'reservedSeats': reservedSeats
    };
  }

}