import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(48.17260597638298, 17.169020699929284),
    zoom: 14.90,
  );

  // ignore: non_constant_identifier_names
  static final CameraPosition _Kostol = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(48.16667612316718, 17.164620614560555),
      zoom: 19);
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _mapcreated(GoogleMapController controller)
  {
    _mapController = controller;
    setState(() {

      _markers.add(Marker(
          markerId: MarkerId("0"),
          position: LatLng(48.16667612316718, 17.164620614560555),
          infoWindow: InfoWindow(
            title: "Kostol",
            snippet: ".. a tatiež oratko ",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(48.16915997622184, 17.166156248950266),
          infoWindow: InfoWindow(
            title: "Kraj",
            snippet: "JEDLOOO",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("2"),
          position: LatLng(48.17164359124531, 17.169684164639563),
          infoWindow: InfoWindow(
            title: "Základná Škola",
            snippet: "To čo sa aj tak teraz nepouživa",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("3"),
          position: LatLng(48.16882803889612, 17.166454459928566),
          infoWindow: InfoWindow(
            title: "Pošta",
            snippet: "Ak náhodou budeš potrebovať",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("4"),
          position: LatLng(48.16626432870528, 17.18266031515946),
          infoWindow: InfoWindow(
            title: "Avion",
            snippet: "Síce nie na Trnávke ale blízko",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("5"),
          position: LatLng(48.16695671490585, 17.153147442490894),
          infoWindow: InfoWindow(
            title: "Klientske centrum",
            snippet: "idk",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("6"),
          position: LatLng(48.16773361868091, 17.153400670309548),
          infoWindow: InfoWindow(
            title: "Fresh Market",
            snippet: "idk",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("7"),
          position: LatLng(48.17293927715524, 17.157119033704358),
          infoWindow: InfoWindow(
            title: "Bowlingové Národné Centrum",
            snippet: "idk",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("8"),
          position: LatLng(48.168684421461755, 17.158193146113355),
          infoWindow: InfoWindow(
            title: "Shell",
            snippet: "idk",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("10"),
          position: LatLng(48.16728072833306, 17.1648894516045),
          infoWindow: InfoWindow(
            title: "SDM Domino",
            snippet: " DOOOOMINO HEJ HEJ ",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("11"),
          position: LatLng(48.16819727962035, 17.167639998365015),
          infoWindow: InfoWindow(
            title: "Lekáreň",
            snippet: "IDK",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("11"),
          position: LatLng(48.165825171533946, 17.166121407419205),
          infoWindow: InfoWindow(
            title: "Rodinné centrum",
            snippet: "a tiež materská škôlka",
          )
      ));
      _markers.add(Marker(
          markerId: MarkerId("12"),
          position: LatLng(48.16773724623629, 17.164138040064266),
          infoWindow: InfoWindow(
            title: "Hotel 21",
            snippet: "idk",
          )
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
                target: LatLng(48.17260597638298, 17.169020699929284),
                zoom: 14),
            onMapCreated: _mapcreated,
            markers: _markers,
            )
          ,]

      ),

      floatingActionButton: new FloatingActionButton(

        onPressed: _Reset,
        child: new Icon(Icons.assistant_navigation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _Reset() async {
    final GoogleMapController controller = _mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
}