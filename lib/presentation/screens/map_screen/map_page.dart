import 'dart:async';

import "package:latlong2/latlong.dart" as latLng;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/strings.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> markers = [];
  MapController mapController = MapController();
  double lat = 6.9271;
  double lng = 79.8612;
  Marker marker = Marker(
    width: 200,
    height: 200,
    point: latLng.LatLng(6.9271, 79.8612),
    builder: (context) => const MarkerView(name: "Cinnamon Air"),
  );

  move() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      lat = lat + 0.00001;
      lng = lng + 0.00001;
      setState(() {
        marker = Marker(
          width: 200,
          height: 200,
          point: latLng.LatLng(lat, lng),
          builder: (context) => const MarkerView(name: "Cinnamon Air"),
        );
        markers = [marker];
        mapController.move(latLng.LatLng(lat, lng), 7.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    move();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.lightColor,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "Your Flight",
                    style: TextStyle(
                        color: AppColors.lightColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(6.w)),
                  child: FlutterMap(
                    options: MapOptions(
                      center: latLng.LatLng(lat, lng),
                      zoom: 6.0,
                    ),
                    mapController: mapController,
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        attributionBuilder: (_) =>
                            const Text("© OpenStreetMap contributors"),
                      ),
                      MarkerLayerOptions(
                        markers: markers,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarkerView extends StatelessWidget {
  final String name;
  const MarkerView({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 1.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(2.w),
            ),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.lightColor,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Image.asset(
            Strings.flight,
            width: 10.w,
            height: 10.w,
          )
        ],
      ),
    );
  }
}
