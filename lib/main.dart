import 'package:drivering/src/pages/client/map/client_map_page.dart';
import 'package:drivering/src/pages/client/register/client_register_page.dart';
import 'package:drivering/src/pages/driver/map/driver_map_page.dart';
import 'package:drivering/src/pages/driver/register/driver_register_page.dart';
import 'package:drivering/src/pages/home/home_page.dart';
import 'package:drivering/src/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:drivering/src/utils/colors.dart' as Util;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Driving',
        theme: ThemeData(
            primaryColor: Util.Colors.driveringAppColor,
            fontFamily: 'NimbusSans',
            appBarTheme: AppBarTheme(elevation: 0)),
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'login': (BuildContext context) => LoginPage(),
          'client/register': (BuildContext context) => ClientRegisterPage(),
          'client/map': (BuildContext context) => ClientMapPage(),
          'driver/register': (BuildContext context) => DriverRegisterPage(),
          'driver/map': (BuildContext context) => DriverMapPage(),
        });
  }
}
