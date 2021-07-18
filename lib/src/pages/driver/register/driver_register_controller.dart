import 'package:drivering/src/models/driver.dart';
import 'package:drivering/src/providers/auth_provider.dart';
import 'package:drivering/src/providers/driver_provider.dart';
import 'package:drivering/src/utils/my_progress_dialog.dart';
import 'package:drivering/src/utils/snackbar.dart' as Util;
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class DriverRegisterController {
  late BuildContext context;
  late ProgressDialog _progressDialog;

  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  List<TextEditingController> pins = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
  ];
  AuthProvider _authProvider = new AuthProvider();
  DriverProvider _driverProvider = new DriverProvider();

  void init(BuildContext context) {
    this.context = context;
    this._progressDialog = MyProgressDialog.createProgressDialog(context);
  }

  void printError(String text) {
    Util.Snackbar.showSnackbar(context, text);
  }

  String _getPlate() {
    String plate = "";
    for (TextEditingController pin in pins) {
      plate += pin.text.trim();
    }
    return plate;
  }

  void register() async {
    _progressDialog.show(max: 10, msg: "Procesando...");
    String username = usernameController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (username.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        confirmPassword.isEmpty) {
      printError("El usuario debe completar el formulario");
      _progressDialog.close();
      return;
    }
    if (confirmPassword != password) {
      printError("Las contraseñas no cohinciden");
      _progressDialog.close();
      return;
    }
    if (password.length < 6) {
      printError('La contraseña debe tener almenos 6 caracteres');
      _progressDialog.close();
      return;
    }
    try {
      bool isRegister = await _authProvider.register(email, password);
      if (isRegister) {
        Driver driver = new Driver(
            id: _authProvider.getUser()!.uid,
            email: _authProvider.getUser()!.email.toString(),
            username: username,
            password: password,
            plate: this._getPlate());
        await _driverProvider.create(driver);
        printError('usuario registrado');

        Navigator.pushNamedAndRemoveUntil(
            context, 'client/map', (route) => false);
      } else {
        printError('error user');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
