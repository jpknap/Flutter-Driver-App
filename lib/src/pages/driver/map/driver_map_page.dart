import 'package:drivering/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class DriverMapPage extends StatefulWidget {
  DriverMapPage({Key? key}) : super(key: key);

  @override
  _DriverMapPageState createState() => _DriverMapPageState();
}

class _DriverMapPageState extends State<DriverMapPage> {
  AuthProvider _authProvider = new AuthProvider();

  @override
  void initState() {
    super.initState();
    print(_authProvider.getUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("mapa,driver"),
    );
  }
}
