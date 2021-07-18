import 'package:drivering/src/models/client.dart';
import 'package:drivering/src/models/driver.dart';
import 'package:drivering/src/providers/auth_provider.dart';
import 'package:drivering/src/providers/client_provider.dart';
import 'package:drivering/src/providers/driver_provider.dart';
import 'package:drivering/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController {
  late BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider _authProvider = new AuthProvider();
  SharedfPref _sharedfPref = new SharedfPref();
  ClientProvider _clientProvider = new ClientProvider();
  DriverProvider _driverProvider = new DriverProvider();
  late String userType;

  void init(BuildContext context) async {
    this.context = context;
    this.userType = await _sharedfPref.read('typeUser');
    // this._authProvider.isUserLogged(context, userType);
  }

  void login() async {
    //this._progressDialog.show(max: 30, msg: 'Procesando...');
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    print([email, password]);
    try {
      bool isLogin = await _authProvider.login(email, password);
      if (isLogin) {
        print('usuario logeado');
        if (this.userType == 'client') {
          Client? client =
              await _clientProvider.getById(_authProvider.getUser()!.uid);
          print('____________________________________________-');
          print(client);
          if (client is Client) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/map', (route) => false);
            print('Cliente no es nulo');
          } else {
            _authProvider.signOut();
            print('Cliente  es cliente es nulo');
          }
        } else if (this.userType == 'driver') {
          print('verificando driver');
          Driver? driver =
              await _driverProvider.getById(_authProvider.getUser()!.uid);
          print('____________________________________________-');
          print(driver);
          if (driver is Driver) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'driver/map', (route) => false);
            print('Driver no es nulo');
          } else {
            _authProvider.signOut();
            print('driver  es nulo');
          }
        }
      } else {
        print('error user');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void goToRegisterPage() {
    if (this.userType == 'driver') {
      Navigator.pushNamed(context, 'driver/register');
    } else {
      Navigator.pushNamed(context, 'client/register');
    }
  }
}
