import 'package:i_cine_app/data/repositories/booking_repository.dart';
import 'package:i_cine_app/models/booking.dart';
import 'package:i_cine_app/models/diffusion.dart';

import '../../../models/user.dart';
import '../local_service.dart';

class BookingRepositoryImpl implements IBoookingRepository {
  final LocalService _localService;

  BookingRepositoryImpl(this._localService);

  @override
  Future<List<Booking>> getBookingByDiffusion(Diffusion diffusion) async {
    var items = await _localService.listNestedById(diffusion.id);
    return items.map((e) => Booking.fromMap(e)).toList();
  }

  @override
  Future<Booking> bookSeats(List<Booking> booking) {

    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> getMyBooking(User user) async {
    var items = await _localService.listNestedById(user.id);
    return items.map((e) => Booking.fromMap(e)).toList();
  }
  
}