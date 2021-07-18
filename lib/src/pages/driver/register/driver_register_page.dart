import 'package:drivering/src/widgets/button_app.dart';
import 'package:drivering/src/widgets/otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:drivering/src/utils/colors.dart' as Util;
import 'driver_register_controller.dart';

class DriverRegisterPage extends StatefulWidget {
  DriverRegisterPage({Key? key}) : super(key: key);

  @override
  _DriverRegisterPageState createState() => _DriverRegisterPageState();
}

class _DriverRegisterPageState extends State<DriverRegisterPage> {
  DriverRegisterController _con = new DriverRegisterController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _bannerUp(),
              _textLogin(),
              _textLicencePlate(),
              _otpPlace(),
              _textFieldUsername(),
              _textFieldEmail(),
              _textFieldPassword(),
              _textFieldConfirmPassword(),
              _buttonRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Registro',
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'NimbusSans',
            fontWeight: FontWeight.bold,
            fontSize: 30),
      ),
    );
  }

  Widget _bannerUp() {
    return ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          color: Util.Colors.driveringAppColor,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/img/logo_app.png',
                  width: 150,
                  height: 100,
                ),
                Text(
                  'Facil y Rapido',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ]),
        ));
  }

  Widget _textFieldUsername() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.usernameController,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.person_outline,
              color: Util.Colors.driveringAppColor,
            ),
            hintText: 'Ingrese su nombre',
            labelText: 'Nombre de usuario'),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.email_outlined,
              color: Util.Colors.driveringAppColor,
            ),
            hintText: 'Ingrese un correo',
            labelText: 'Correo electronico'),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: Util.Colors.driveringAppColor,
            ),
            hintText: '****************',
            labelText: 'Constraseña'),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController,
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: Util.Colors.driveringAppColor,
            ),
            hintText: '****************',
            labelText: 'confirmar contraseña'),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
          onPressed: _con.register,
          color: Util.Colors.driveringAppColor,
          text: 'Registrar Driver'),
    );
  }

  Widget _textLicencePlate() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        'Placa del vehiculo',
        style: TextStyle(color: Colors.grey[600], fontSize: 17),
      ),
    );
  }

  Widget _otpPlace() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: OTPFields(
          pin1: this._con.pins[0],
          pin2: this._con.pins[1],
          pin3: this._con.pins[2],
          pin4: this._con.pins[3],
          pin5: this._con.pins[4],
          pin6: this._con.pins[5]),
    );
  }
}
