import 'package:dsv_watersocial/models/user.dart';
import 'package:dsv_watersocial/screens/authenticate/authenticate_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsv_watersocial/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if (user == null) {
      return AuthenticateScreen();
    } else {
      return HomeScreen();
    }
  }
}
