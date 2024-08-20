import 'dart:async';
import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:after_layout/after_layout.dart';
import '../../models/result.dart';

class SosPage extends StatefulWidget {
  static const routeName = "SosPage";

  const SosPage({super.key});

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> with AfterLayoutMixin {
  final Completer<GoogleMapController> _controller = Completer();
  bool? isLoading = true;
  Result? mapList = Result(count: 0, rows: []);
  int page = 1;
  int limit = 1000;

  final List<Marker> _marker = [];

  @override
  void afterFirstLayout(BuildContext context) async {
    await permissionAsk();
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = false;
    });
  }

  permissionAsk() async {
    try {
      var status = await Permission.location.status;
      if (status.isDenied) {
        debugPrint("=====================DENIED============");
      }
      if (await Permission.location.isRestricted) {
        debugPrint("=====================isRestricted============");
      }
      if (await Permission.location.request().isGranted) {}
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      debugPrint(statuses[Permission.location].toString());
    } catch (e) {
      print(e.toString());
    }
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(49.468256759865504, 105.96434477716684),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: black),
        title: Text(
          "Эрсдэл",
          style: TextStyle(color: black, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            markers: Set<Marker>.of(_marker),
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ],
      ),
    );
  }
}
