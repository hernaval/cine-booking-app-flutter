import 'package:flutter/material.dart';
import 'package:i_cine_app/helpers/screen_args.dart';

final String apiUrl = "http://127.0.0.1:8000";
class HomeRoute {
  static final String home = "/home";
}

class BookingRoute {
  static final String booking_time = "/booking";
  static final String booking_seat = '/booking/seat';
  static final String booking_payment = '/booking/payment';
}

class AuthRoute {
  static final String login = "/login";
}

goTo(final context, String path, ScreenArgs? args) => Navigator.pushNamed(context, path, arguments: args);