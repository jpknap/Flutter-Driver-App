import 'package:drivering/src/pages/client/register/client_register_controller.dart';
import 'package:drivering/src/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:drivering/src/utils/colors.dart' as Util;

class ClientRegisterPage extends StatefulWidget {
  ClientRegisterPage({Key? key}) : super(key: key);

  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  ClientRegisterController _con = new ClientRegisterController();

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
      margin: EdgeInsets.symmetric(horizontal: 30),
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
          text: 'Registrar'),
    );
  }
}
