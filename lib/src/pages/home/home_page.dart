import 'package:drivering/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = new HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black, Colors.black26])),
            child: Column(
              children: [
                _bannerUp(context),
                SizedBox(height: 50),
                Text('Selecciona Tu Rol',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OneDay',
                      fontSize: 22,
                    )),
                SizedBox(height: 30),
                _accessTypeUser(_homeController, 'Cliente'),
                SizedBox(height: 30),
                _accessTypeUser(_homeController, 'Conductor')
              ],
            ),
          ),
        ));
  }
}

Widget _bannerUp(BuildContext context) {
  return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(
            'assets/img/logo_app.png',
            width: 150,
            height: 100,
          ),
          Text(
            'Facil y Rapido',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 20,
                fontWeight: FontWeight.w700),
          )
        ]),
      ));
}

Widget _accessTypeUser(HomeController _homeController, String typeUser) {
  return GestureDetector(
      onTap: () {
        if (typeUser == 'Cliente') {
          _homeController.saveTypeUserClient();
        } else {
          _homeController.saveTypeUserDriver();
        }
      },
      child: Column(
        children: [
          _imageTypeUser(typeUser),
          SizedBox(height: 10),
          _textTypeUser(typeUser)
        ],
      ));
}

Widget _imageTypeUser(String typeUser) {
  String imgSrc = 'assets/img/driver.png';
  if (typeUser == 'Cliente') {
    imgSrc = 'assets/img/pasajero.png';
  }
  return CircleAvatar(
    backgroundImage: AssetImage(imgSrc),
    radius: 50,
    backgroundColor: Colors.grey,
  );
}

Widget _textTypeUser(String typeUser) {
  return Text(
    typeUser,
    style: TextStyle(color: Colors.white, fontSize: 16),
  );
}

void goToLoginPafe(BuildContext context) {
  Navigator.pushNamed(context, 'login');
}
