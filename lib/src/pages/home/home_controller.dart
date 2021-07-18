import 'package:drivering/src/providers/auth_provider.dart';
import 'package:drivering/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class HomeController {
  late BuildContext context;
  late String? userType;
  SharedfPref _sharedfPref = new SharedfPref();
  AuthProvider _authProvider = new AuthProvider();

  Future init(BuildContext context) async {
    this.context = context;
    this.userType = await _sharedfPref.read('typeUser');
    this.checkIfUserIsAuth();
  }

  void checkIfUserIsAuth() {
    bool isSigned = _authProvider.isSignedIn();
    if (isSigned) {
      if (this.userType == 'client') {
        Navigator.pushNamedAndRemoveUntil(
            context, 'client/map', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, 'driver/map', (route) => false);
      }
    }
  }

  void saveTypeUserClient() async {
    await _sharedfPref.save('typeUser', 'client');
    Navigator.pushNamed(context, 'login');
  }

  void saveTypeUserDriver() async {
    await _sharedfPref.save('typeUser', 'driver');
    Navigator.pushNamed(context, 'login');
  }
}
