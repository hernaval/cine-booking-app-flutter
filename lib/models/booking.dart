import 'package:i_cine_app/models/diffusion.dart';

enum BookingStatus {
  started, // create locally
  waiting, // push to remote server --> only available for 15mn
  paid
}

class Booking {
  final String? id;
  final String diffusionId;
  final String? userId;
  final int reservedSeats;
  final String time;
  BookingStatus? status;

  Booking(this.id, this.diffusionId, this.userId, this.reservedSeats, this.time, this.status);

  Booking.fromMap(Map<String, dynamic> data ) :
        id = data['id'],
        time = data['time'],
        diffusionId = data['diffusionId'],
        userId = data['userId'],
        reservedSeats = data['reservedSeats'],
        status = data['status']
  ;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'diffusionId': diffusionId,
      'userId': userId,
      'reservedSeats': reservedSeats,
      'status': status
    };
  }

}