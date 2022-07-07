import 'package:i_cine_app/models/booking.dart';
import 'package:i_cine_app/models/diffusion.dart';

abstract class IBoookingRepository {
  Future<List<Booking>> getBookingByDiffusion(Diffusion diffusion);
  Future<Booking> bookSeats(List<Booking> booking);
}