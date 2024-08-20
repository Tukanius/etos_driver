import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:etos_driver/api/receipt_api.dart';
import 'package:etos_driver/components/icons/location_icon.dart';
import 'package:etos_driver/components/icons/sos_icon.dart';
import 'package:etos_driver/components/ui/button_circle.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:etos_driver/models/result.dart';
import 'package:etos_driver/screens/notification/notification_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:etos_driver/components/ui/setmap.dart';
import 'package:label_marker/label_marker.dart';

class MapPage extends StatefulWidget {
  static const routeName = 'MapPage';
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with AfterLayoutMixin {
  final Completer<GoogleMapController> _controller = Completer();
  // LocationData? currentLocation;
  Set<Marker> markers = {};
  int page = 1;
  int limit = 1000;
  late LatLng? myLocation;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  Set<Polyline> polylines = {};
  double totalPolylineLength = 0.0;
  double length = 0.0;
  bool isLoading = true;
  Result? mapList = Result(count: 0, rows: []);
  late SetProcess? process;
  // static const LatLng firstDestination = LatLng(42.428799, 107.561320);
  static const LatLng firstScale = LatLng(42.4258, 107.5737);
  // static const LatLng unloadgingArea = LatLng(42.41711, 107.57515);
  // static const LatLng loadgingArea = LatLng(42.41626, 107.57748);
  static const LatLng lastScale = LatLng(42.42622, 107.57707);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(42.410964, 827.571610),
    zoom: 13,
  );

  List<LatLng> polyCoordinate = [];

  List<LatLng> roadMapGoal = MapCoordinates.roadMapGoal;
  List<LatLng> roadMapGoal1 = MapCoordinates.roadMapGoal1;
  List<LatLng> roadMapGoal2 = MapCoordinates.roadMapGoal2;
  List<LatLng> setArea = MapCoordinates.setAreaCoordinates;
  List<LatLng> scale1 = MapCoordinates.scale1Coordinates;
  List<LatLng> scale11 = MapCoordinates.scale12Coordinates;
  List<LatLng> scale2 = MapCoordinates.scale2;
  List<LatLng> scale21 = MapCoordinates.scale21;
  List<LatLng> scale3 = MapCoordinates.scale3;
  List<LatLng> scale31 = MapCoordinates.scale31;
  List<LatLng> setOffice = MapCoordinates.setOffice;
  List<LatLng> unloadingArea = MapCoordinates.unloadingArea;
  List<LatLng> loadingArea = MapCoordinates.loadingArea;
  List<LatLng> office1Scale1 = MapCoordinates.office1Scale1;
  List<LatLng> office1Scale2 = MapCoordinates.office1Scale2;
  List<LatLng> office1Scale3 = MapCoordinates.office1Scale3;
  List<LatLng> setRoad1 = MapCoordinates.setRoad1;
  List<LatLng> setRoad2 = MapCoordinates.setRoad2;
  List<LatLng> setRoad3 = MapCoordinates.setRoad3;
  List<LatLng> setRoad4 = MapCoordinates.setRoad4;
  List<LatLng> setRoad5 = MapCoordinates.setRoad5;
  List<LatLng> setRoad6 = MapCoordinates.setRoad6;
  List<LatLng> setRoad7 = MapCoordinates.setRoad7;
  List<LatLng> setRoad8 = MapCoordinates.setRoad8;
  List<LatLng> setRoadR1 = MapCoordinates.setRoadR1;
  List<LatLng> setRoadR2 = MapCoordinates.setRoadR2;
  List<LatLng> setRoadR3 = MapCoordinates.setRoadR3;
  List<LatLng> setRoadR4 = MapCoordinates.setRoadR4;
  List<LatLng> setRoadR5 = MapCoordinates.setRoadR5;
  List<LatLng> setRoadR6 = MapCoordinates.setRoadR6;
  List<LatLng> setRoadR7 = MapCoordinates.setRoadR7;
  List<LatLng> setRoadR8 = MapCoordinates.setRoadR8;
  List<LatLng> setRoadR9 = MapCoordinates.setRoadR9;
  List<LatLng> setRoadR10 = MapCoordinates.setRoadR10;
  List<LatLng> setRoadR11 = MapCoordinates.setRoadR11;
  List<LatLng> avgRoad1 = MapCoordinates.avgRoad1;
  List<LatLng> avgRoad2 = MapCoordinates.avgRoad2;
  List<LatLng> avgRoad3 = MapCoordinates.avgRoad3;
  List<LatLng> avgRoad4 = MapCoordinates.avgRoad4;
  List<LatLng> avgRoad5 = MapCoordinates.avgRoad5;
  List<LatLng> avgRoad6 = MapCoordinates.avgRoad6;
  List<LatLng> avgRoad7 = MapCoordinates.avgRoad7;
  List<LatLng> centerRoad1 = MapCoordinates.centerRoad1;
  List<LatLng> centerRoad2 = MapCoordinates.centerRoad2;
  List<LatLng> centerRoad3 = MapCoordinates.centerRoad3;
  List<LatLng> centerRoadLeft1 = MapCoordinates.centerRoadLeft1;
  List<LatLng> centerRoadLeft2 = MapCoordinates.centerRoadLeft2;
  List<LatLng> centerRoadLeft3 = MapCoordinates.centerRoadLeft3;
  List<LatLng> centerRoadLeft4 = MapCoordinates.centerRoadLeft4;

  List<LatLng> firstPoints = [
    // const LatLng(42.429632, 107.561000),
    const LatLng(42.428830, 107.561407),
    const LatLng(42.428764, 107.572930),
    firstScale,
  ];

  @override
  afterFirstLayout(BuildContext context) async {
    // await getLocation();
    Future.delayed(const Duration(milliseconds: 300), () async {
      await permissionAsk();
      // getPolyLine();
      // await getPolyPoints();
      // process = await ReceiptApi().getActiveReceipt(true);

      markers
          .addLabelMarker(
        LabelMarker(
          consumeTapEvents: true,
          label: 'Буулгах тайлбай',
          markerId: const MarkerId('1'),
          position: const LatLng(42.41712, 107.57429),
          backgroundColor: black.withOpacity(0.5),
        ),
      )
          .then(
        (value) {
          setState(() {});
        },
      );
      markers
          .addLabelMarker(
        LabelMarker(
          onTap: () {},
          label: 'Ачих талбай',
          consumeTapEvents: true,
          markerId: const MarkerId('2'),
          position: const LatLng(42.41655, 107.5767),
          backgroundColor: black.withOpacity(0.5),
        ),
      )
          .then(
        (value) {
          setState(() {});
        },
      );
      // process?.processWarehouse?.status == "DONE"
      //     ? markers.add(
      //         Marker(
      //           markerId: const MarkerId('123'),
      //           position: firstScale,
      //           icon: sourceIcon,
      //           consumeTapEvents: true,
      //         ),
      //       )
      //     : const SizedBox();
      // markers.add(
      //   Marker(
      //     markerId: const MarkerId('1234'),
      //     position: unloadgingArea,
      //     icon: sourceIcon,
      //     consumeTapEvents: true,
      //   ),
      // );
      // markers.add(
      //   Marker(
      //     markerId: const MarkerId('12345'),
      //     position: loadgingArea,
      //     icon: sourceIcon,
      //   ),
      // );
      // process?.processTruckExit?.status == "DONE"
      //     ? markers.add(
      //         Marker(
      //           markerId: const MarkerId('12346'),
      //           position: lastScale,
      //           icon: sourceIcon,
      //           consumeTapEvents: true,
      //         ),
      //       )
      //     : const SizedBox();
      setState(() {
        isLoading = false;
      });
    });
    // testPoint();

    // customPolyPoints();
  }

  // customPolyPoints() {
  //   // List<LatLng> points = [
  //   //   const LatLng(42.429632, 107.561000),
  //   //   const LatLng(42.428830, 107.561407),
  //   //   const LatLng(42.428764, 107.572930),
  //   //   firstScale,
  //   // ];

  //   // polylines.add(
  //   //   Polyline(
  //   //     width: 5,
  //   //     polylineId: const PolylineId('route'),
  //   //     color: colorBlue,
  //   //     points: points,
  //   //   ),
  //   // );

  // }

  // getLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best,
  //     );
  //     double mylat = position.latitude;
  //     double mylong = position.longitude;
  //     LatLng location = LatLng(mylat, mylong);
  //     _marker.clear();
  //     _marker.add(
  //       Marker(
  //         markerId: const MarkerId('myLocation'),
  //         position: location,
  //         icon: sourceIcon,
  //         infoWindow: const InfoWindow(title: 'Миний байршил'),
  //         onTap: () {},
  //       ),
  //     );

  //     _marker.add(
  //       Marker(
  //         markerId: const MarkerId('Scale1'),
  //         position: const LatLng(42.425835, 107.573629),
  //         icon: sourceIcon,
  //         infoWindow: const InfoWindow(title: 'Scale1'),
  //         onTap: () {},
  //       ),
  //     );
  //     setState(() {
  //       myLocation = location;
  //     });

  //     getPolyPoints();
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Error getting location: $e");
  //     }
  //   }
  // }

  permissionAsk() async {
    try {
      var status = await Permission.location.status;
      if (status.isDenied) {
        await Permission.location.request();
      }
      status = await Permission.location.status;
      if (status.isGranted) {
        // await getLocation();
      } else {
        if (kDebugMode) {
          print("=====Granted=====");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // getPolyLine() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyBOjXv-WWTgAGmV_zIIGpKlBg2G8oLv4ko",
  //     const PointLatLng(47.91383316674232, 106.9137153253027),
  //     const PointLatLng(42.429061, 107.561222),
  //     travelMode: TravelMode.driving,
  //   );
  //   if (result.points.isNotEmpty) {
  //     setState(() {
  //       List<LatLng> direction = result.points
  //           .map((point) => LatLng(point.latitude, point.longitude))
  //           .toList();
  //       polylines.add(Polyline(
  //         width: 10,
  //         polylineId: const PolylineId('route1'),
  //         color: red,
  //         points: direction,
  //       ));
  //     });
  //   }
  // }

  // getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result1 = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyBOjXv-WWTgAGmV_zIIGpKlBg2G8oLv4ko",
  //     PointLatLng(myLocation.latitude, myLocation.longitude),
  //     const PointLatLng(42.43784, 107.5570),
  //   );
  //   PolylineResult result2 = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyBOjXv-WWTgAGmV_zIIGpKlBg2G8oLv4ko",
  //     const PointLatLng(42.43784, 107.5570),
  //     PointLatLng(firstDestination.latitude, firstDestination.longitude),
  //   );
  //   if (result1.points.isNotEmpty && result2.points.isNotEmpty) {
  //     setState(() {
  //       List<LatLng> polyCoordinate1 = result1.points
  //           .map((point) => LatLng(point.latitude, point.longitude))
  //           .toList();
  //       polylines.add(Polyline(
  //         width: 5,
  //         polylineId: const PolylineId('route1'),
  //         color: colorBlue,
  //         points: polyCoordinate1,
  //       ));

  //       double length1 = _calculatePolylineLength(polyCoordinate1);

  //       List<LatLng> polyCoordinate2 = result2.points
  //           .map((point) => LatLng(point.latitude, point.longitude))
  //           .toList();
  //       polylines.add(Polyline(
  //         width: 5,
  //         polylineId: const PolylineId('route2'),
  //         color: colorBlue,
  //         points: polyCoordinate2,
  //       ));
  //       double length2 = _calculatePolylineLength(polyCoordinate2);

  //       totalPolylineLength = length1 + length2;
  //     });
  //   }
  // }

  // void getCurrentLocation() async {
  //   Location location = Location();
  //   location.getLocation().then(
  //         (location) => {
  //           mylocation = location,
  //         },
  //       );
  //   GoogleMapController googleMapController = await _controller.future;
  //   location.onLocationChanged.listen((newLocation) {
  //     mylocation = newLocation;
  //     googleMapController.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //           target: LatLng(
  //             newLocation.latitude!,
  //             newLocation.longitude!,
  //           ),
  //         ),
  //       ),
  //     );
  //     setState(() {});
  //   });
  // }

  // void testPoint() async {
  //   PolylinePoints testing = PolylinePoints();
  //   PolylineResult result = await testing.getRouteBetweenCoordinates(
  //     "AIzaSyBOjXv-WWTgAGmV_zIIGpKlBg2G8oLv4ko",
  //     PointLatLng(test.latitude, test.longitude),
  //     PointLatLng(test1.latitude, test1.longitude),
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (PointLatLng point) => polyCoordinate.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Газрын зураг',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NotificationPage.routeName);
              },
              icon: Icon(
                Icons.notifications,
                color: black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: black,
                ),
              )
            : Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.hybrid,
                    padding: const EdgeInsets.only(
                      top: 40.0,
                    ),
                    compassEnabled: false,
                    myLocationButtonEnabled: true,
                    // markers: Set<Marker>.of(_marker),
                    markers: markers,
                    //             {
                    //               // Marker(
                    //               //   markerId: MarkerId('mylocation'),
                    //               //   icon: sourceIcon,
                    //               //   position: LatLng(mylocation!.latitude!, mylocation!.longitude!),
                    //               // ),
                    // //               LabelMarker()
                    // //               mark.addLabelMarker(
                    // //                 LabelMarker(
                    // //     label: "TextToShow",
                    // //     markerId: MarkerId("idString"),
                    // //     position: LatLng(10.0, 11.0),
                    // //     backgroundColor: Colors.green,
                    // //     )).then((value) {
                    // //     setState(() {});
                    // //     },
                    // // );
                    //               // LabelMarker(
                    //               //   label: title,
                    //               //   markerId: MarkerId(title),
                    //               //   position: LatLng(lat, lng),
                    //               //   backgroundColor: Colors.green,
                    //               // ),

                    //               // markers as Marker,
                    //               const Marker(
                    //                 // marker label
                    //                 markerId: MarkerId('mylocation'),
                    //                 position: test,
                    //               ),
                    //               const Marker(
                    //                 markerId: MarkerId('mylocation'),
                    //                 position: test1,
                    //               ),
                    //             },
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (mapcontroller) {
                      _controller.complete(mapcontroller);
                    },
                    polylines: {
                      // Polyline(
                      //   width: 8,
                      //   polylineId: const PolylineId('road5'),
                      //   color: process?.processWarehouse?.status == "DONE"
                      //       ? green
                      //       : colorYellow,
                      //   points: firstPoints,
                      // ),
                      // Polyline(
                      //   width: 8,
                      //   polylineId: const PolylineId('road1'),
                      //   color: process?.processWarehouse?.status == "DONE"
                      //       ? green
                      //       : colorYellow,
                      //   points: roadMapGoal,
                      // ),
                      // Polyline(
                      //   width: 8,
                      //   polylineId: const PolylineId('road2'),
                      //   color: process?.processWarehouse?.status == "DONE"
                      //       ? green
                      //       : colorYellow,
                      //   points: roadMapGoal1,
                      // ),
                      // Polyline(
                      //   width: 8,
                      //   polylineId: const PolylineId('road3'),
                      //   color: process?.processTruckExit?.status == "DONE"
                      //       ? green
                      //       : colorYellow,
                      //   points: roadMapGoal2,
                      // ),
                      Polyline(
                        width: 5,
                        polylineId: const PolylineId('road4'),
                        color: red,
                        points: polyCoordinate,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road6'),
                        color: black.withOpacity(0.3),
                        points: setRoad1,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road7'),
                        color: black.withOpacity(0.3),
                        points: setRoad2,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road8'),
                        color: black.withOpacity(0.3),
                        points: setRoad3,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road9'),
                        color: black.withOpacity(0.3),
                        points: setRoad4,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road10'),
                        color: black.withOpacity(0.3),
                        points: setRoad5,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road11'),
                        color: black.withOpacity(0.3),
                        points: setRoad6,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road12'),
                        color: black.withOpacity(0.3),
                        points: setRoad7,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road13'),
                        color: black.withOpacity(0.3),
                        points: setRoad8,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road14'),
                        color: black.withOpacity(0.3),
                        points: setRoadR1,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road15'),
                        color: black.withOpacity(0.3),
                        points: setRoadR2,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road16'),
                        color: black.withOpacity(0.3),
                        points: setRoadR3,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road17'),
                        color: black.withOpacity(0.3),
                        points: setRoadR4,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road18'),
                        color: black.withOpacity(0.3),
                        points: setRoadR5,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road19'),
                        color: black.withOpacity(0.3),
                        points: setRoadR6,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road20'),
                        color: black.withOpacity(0.3),
                        points: setRoadR7,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road21'),
                        color: black.withOpacity(0.3),
                        points: setRoadR8,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road22'),
                        color: black.withOpacity(0.3),
                        points: setRoadR9,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road23'),
                        color: black.withOpacity(0.3),
                        points: setRoadR10,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road24'),
                        color: black.withOpacity(0.3),
                        points: setRoadR11,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road25'),
                        color: black.withOpacity(0.3),
                        points: avgRoad1,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road26'),
                        color: black.withOpacity(0.3),
                        points: avgRoad2,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road27'),
                        color: black.withOpacity(0.3),
                        points: avgRoad3,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road28'),
                        color: black.withOpacity(0.3),
                        points: avgRoad4,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road29'),
                        color: black.withOpacity(0.3),
                        points: avgRoad5,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road30'),
                        color: black.withOpacity(0.3),
                        points: avgRoad6,
                      ),
                      Polyline(
                        width: 1,
                        polylineId: const PolylineId('road31'),
                        color: black.withOpacity(0.3),
                        points: avgRoad7,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road32'),
                        color: black.withOpacity(0.3),
                        points: centerRoad1,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road33'),
                        color: black.withOpacity(0.3),
                        points: centerRoad2,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road34'),
                        color: black.withOpacity(0.3),
                        points: centerRoad3,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road35'),
                        color: black.withOpacity(0.3),
                        points: centerRoadLeft1,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road36'),
                        color: black.withOpacity(0.3),
                        points: centerRoadLeft2,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road37'),
                        color: black.withOpacity(0.3),
                        points: centerRoadLeft3,
                      ),
                      Polyline(
                        width: 2,
                        polylineId: const PolylineId('road38'),
                        color: black.withOpacity(0.3),
                        points: centerRoadLeft4,
                      ),
                    },
                    polygons: {
                      Polygon(
                        polygonId: const PolygonId("1"),
                        points: setArea,
                        fillColor: Colors.transparent,
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("2"),
                        points: unloadingArea,
                        fillColor: white.withOpacity(0.3),
                        strokeColor: black,
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("3"),
                        points: loadingArea,
                        fillColor: white.withOpacity(0.3),
                        strokeColor: black,
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("4"),
                        points: scale1,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("5"),
                        points: scale11,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("6"),
                        fillColor: white.withOpacity(0.3),
                        points: scale2,
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("7"),
                        fillColor: white.withOpacity(0.3),
                        points: scale21,
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("8"),
                        points: scale3,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("9"),
                        points: scale31,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("10"),
                        points: office1Scale1,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("11"),
                        points: office1Scale2,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("12"),
                        points: office1Scale3,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                      Polygon(
                        polygonId: const PolygonId("13"),
                        points: setOffice,
                        fillColor: white.withOpacity(0.3),
                        strokeWidth: 1,
                      ),
                    },
                  ),
                  // isLoading == true
                  //     ? Container(
                  //         width: MediaQuery.of(context).size.width,
                  //         height: MediaQuery.of(context).size.height,
                  //         color: white.withOpacity(0.7),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             CircularProgressIndicator(
                  //               color: black,
                  //             ),
                  //             const SizedBox(
                  //               height: 15,
                  //             ),
                  //             const Text(
                  //               "Түр хүлээнэ үү",
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     : const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: gray101,
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.gas_meter_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Шатахуун түгээх станц'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: gray101,
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.tire_repair),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Дугуй засвар'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: gray101,
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/toilet.svg',
                                            width: 22,
                                            height: 22,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('Бие засах газар'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonCircle(
                                onPress: () {
                                  // Navigator.of(context).pushNamed(RoutePage.routeName);
                                },
                                icon: const SosIcon(),
                              ),
                              ButtonCircle(
                                onPress: () {
                                  // goToMyLocation();
                                },
                                icon: const LocationIcon(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

/*

  double calculateDistance() {
    double totalDistance = 0.0;
    for (int i = 0; i < polylines.first.points.length - 1; i++) {
      final LatLng start = polylines.first.points[i];
      final LatLng end = polylines.first.points[i + 1];
      final double distance = _calculateDistance(
          start.latitude, start.longitude, end.latitude, end.longitude);
      totalDistance += distance;
    }
    return totalDistance;
  }

  double _calculateDistance(
      double startLat, double startLng, double endLat, double endLng) {
    const double pi = 3.1415926535897932;
    const double radius = 6371000.0;

    double dLat = (endLat - startLat) * pi / 180.0;
    double dLng = (endLng - startLng) * pi / 180.0;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(startLat * pi / 180.0) *
            cos(endLat * pi / 180.0) *
            sin(dLng / 2) *
            sin(dLng / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radius * c;
  }

  double _calculatePolylineLength(List<LatLng> polylinePoints) {
    double length = 0.0;
    for (int i = 0; i < polylinePoints.length - 1; i++) {
      length += _calculateDistance(
        polylinePoints[i].latitude,
        polylinePoints[i].longitude,
        polylinePoints[i + 1].latitude,
        polylinePoints[i + 1].longitude,
      );
    }
    return length;
  }

  double calculateTotalDistance(Set<Polyline> polylines) {
    double totalDistance = 0.0;
    for (final Polyline polyline in polylines) {
      for (int i = 0; i < polyline.points.length - 1; i++) {
        final LatLng start = polyline.points[i];
        final LatLng end = polyline.points[i + 1];
        final double distance = _calculateDistance(
          start.latitude,
          start.longitude,
          end.latitude,
          end.longitude,
        );
        totalDistance += distance;
      }
    }
    return totalDistance;
  }

  double _calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    const double pi = 3.1415926535897932;
    const double radius = 6371000.0;

    double dLat = (endLat - startLat) * pi / 180.0;
    double dLng = (endLng - startLng) * pi / 180.0;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(startLat * pi / 180.0) *
            cos(endLat * pi / 180.0) *
            sin(dLng / 2) *
            sin(dLng / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radius * c;
  }

 */
