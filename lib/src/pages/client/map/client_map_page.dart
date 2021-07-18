import 'package:drivering/src/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'client_map_controller.dart';

class ClientMapPage extends StatefulWidget {
  ClientMapPage({Key? key}) : super(key: key);

  @override
  _ClientMapPageState createState() => _ClientMapPageState();
}

class _ClientMapPageState extends State<ClientMapPage> {
  ClientMapController _con = new ClientMapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          this._googleMapsWidget(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [this._buttonDrawer(), this._myPositionIcon()],
                ),
                this._buttonConnect(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonDrawer() {
    return Container(
        child: IconButton(
      onPressed: () {},
      icon: Icon(Icons.menu, color: Colors.white),
    ));
  }

  Widget _myPositionIcon() {
    return Container(
        child: IconButton(
      onPressed: () {},
      icon: Icon(Icons.location_searching, color: Colors.white),
    ));
  }

  Widget _googleMapsWidget() {
    return GoogleMap(
      initialCameraPosition: _con.initialPosition,
      mapType: MapType.normal,
      onMapCreated: _con.onMapCreated,
    );
  }

  Widget _buttonConnect() {
    return Container(
      height: 50,
      width: 250,
      margin: EdgeInsets.symmetric(vertical: 25),
      child: ButtonApp(
          color: Colors.deepOrange, text: "Conectarse", onPressed: () => {}),
    );
  }
}
