import 'package:drivering/src/pages/login/login_controller.dart';
import 'package:drivering/src/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:drivering/src/utils/colors.dart' as Util;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

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
              _textDescription(),
              _textLogin(),
              _textFieldEmail(),
              _textFieldPassword(),
              _buttonLogin(),
              _textDontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Continua con tu',
        style: TextStyle(
            color: Colors.black54, fontFamily: 'NimbusSans', fontSize: 24),
      ),
    );
  }

  Widget _textLogin() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Driver',
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

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: ButtonApp(
          onPressed: _con.login,
          color: Util.Colors.driveringAppColor,
          text: 'Ingresar'),
    );
  }

  Widget _textDontHaveAccount() {
    return GestureDetector(
      onTap: _con.goToRegisterPage,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 30),
        child: Text(
          'No tienes cuenta?',
          style: TextStyle(
              color: Colors.black45, fontFamily: 'NimbusSans', fontSize: 18),
        ),
      ),
    );
  }
}
