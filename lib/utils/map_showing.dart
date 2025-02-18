import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapShowing extends StatefulWidget {
  const MapShowing({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MapShowingState();
  }
}

class _MapShowingState extends State<MapShowing> {
  static const LatLng _pGooglePlex = LatLng(22.750418, 75.83542);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.center,
      height: size.height * 0.25,
      width: size.width,
      color: Colors.blue,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: _pGooglePlex,zoom: 15),
      ),
    );
  }
}
