import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  final String distfrom;
  final String distto;
  const MapScreen({super.key, required this.distfrom, required this.distto});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();

  final TextEditingController _disfromController = TextEditingController();
  final TextEditingController _distoController = TextEditingController();
  LatLng locfrom = const LatLng(0.0, 0.0);
  LatLng locto = const LatLng(0.0, 0.0);
  Set<Polyline> polylines = {};
  List<Marker> markers = [];
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(34.1981687, 73.2325311),
    zoom: 14,
  );

  @override
  void initState() {
    _disfromController.text = widget.distfrom.toString();
    _distoController.text = widget.distto.toString();
    super.initState();
    markers = [
      const Marker(
        markerId: MarkerId('1'),
        position: LatLng(34.1981687, 73.2325311),
        infoWindow: InfoWindow(title: 'Initial Location'),
      )
    ];
  }

  // Getting Latitude and Longitude
  Future<void> getLatLong() async {
    try {
      List<Location> locationFrom =
          await locationFromAddress(_disfromController.text);

      List<Location> locationTo =
          await locationFromAddress(_distoController.text);

      setState(() {
        locfrom = LatLng(locationFrom[0].latitude, locationFrom[0].longitude);
        locto = LatLng(locationTo[0].latitude, locationTo[0].longitude);

        // Update markers based on the entered locations
        markers = [
          Marker(
            markerId: const MarkerId('location From'),
            position: locfrom,
            infoWindow: const InfoWindow(title: 'From Location'),
          ),
          Marker(
            markerId: const MarkerId('Location To:'),
            position: locto,
            infoWindow: const InfoWindow(title: 'To Location'),
          ),
        ];

        polylines = {
          Polyline(
            polylineId: const PolylineId('route'),
            color: Colors.blue,
            width: 5,
            points: [
              locfrom,
              locto
            ], // The start and end points of the polyline
          ),
        };
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  // get Current Location
  Future<Position> _getCurrentLoc() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, StackTrace) async {
      await Geolocator.requestPermission();
      print("Error : ${error}");
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Src Loc And Dist Loc",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) =>
                  _mapController.complete(controller),
              initialCameraPosition: initialPosition,
              buildingsEnabled: true,
              mapType: MapType.hybrid,
              trafficEnabled: true,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              fortyFiveDegreeImageryEnabled: true,
              polylines: polylines,
              markers:
                  Set<Marker>.from(markers), // Use the updated markers list
            ),
            Positioned(
              top: 5,
              left: 10,
              right: 10,
              child: TextField(
                controller: _disfromController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "From",
                  prefixIcon: IconButton(
                    onPressed: () async {
                      _getCurrentLoc().then((currentloc) async {
                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                                currentloc.latitude, currentloc.longitude);

                        if (placemarks.isNotEmpty) {
                          Placemark place = placemarks[0];
                          setState(() {
                            _disfromController.text =
                                "${place.street},${place.locality},${place.country},";
                          });
                        }

                        markers.add(Marker(
                          markerId: MarkerId('current loc'),
                          position:
                              LatLng(currentloc.latitude, currentloc.longitude),
                          infoWindow:
                              const InfoWindow(title: "My current Location"),
                        ));

                        CameraPosition newcameraPosition = CameraPosition(
                          target:
                              LatLng(currentloc.latitude, currentloc.longitude),
                          zoom: 13,
                        );

                        final GoogleMapController controller =
                            await _mapController.future;

                        controller.animateCamera(
                            CameraUpdate.newCameraPosition(newcameraPosition));
                      });
                      setState(() {});
                    },
                    icon: const Icon(Icons.location_on),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 10,
              right: 10,
              child: TextFormField(
                controller: _distoController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "To",
                  prefixIcon: IconButton(
                    onPressed: () {
                      getLatLong();
                    },
                    icon: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final GoogleMapController controller = await _mapController.future;
          controller.animateCamera(CameraUpdate.newLatLngBounds(
            LatLngBounds(
              southwest: LatLng(
                locfrom.latitude < locto.latitude
                    ? locfrom.latitude
                    : locto.latitude,
                locfrom.longitude < locto.longitude
                    ? locfrom.longitude
                    : locto.longitude,
              ),
              northeast: LatLng(
                locfrom.latitude > locto.latitude
                    ? locfrom.latitude
                    : locto.latitude,
                locfrom.longitude > locto.longitude
                    ? locfrom.longitude
                    : locto.longitude,
              ),
            ),
            50,
          ));
        },
        tooltip: "Move to the new location",
        child: const Icon(Icons.location_searching_sharp),
      ),
    );
  }
}
