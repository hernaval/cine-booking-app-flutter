import 'package:i_cine_app/models/booking.dart';
import 'package:i_cine_app/models/diffusion.dart';

import '../../models/user.dart';

abstract class IBoookingRepository {
  Future<List<Booking>> getBookingByDiffusion(Diffusion diffusion);
  Future<Booking> bookSeats(List<Booking> booking);
  Future<List<Booking>> getMyBooking(User user);
}