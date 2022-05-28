import "package:latlong2/latlong.dart" as latlng;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sizer/sizer.dart';

import 'package:book_your_flight/core/constants/strings.dart';

import '../../../core/constants/app_colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> markers = [];
  Marker marker = Marker(
    width: 200,
    height: 200,
    point: latlng.LatLng(6.9271, 79.8612),
    builder: (context) => const MarkerView(name: "Cinnamon Air"),
  );
  @override
  void initState() {
    markers.add(marker);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    "Checkout",
                    style: TextStyle(
                        color: AppColors.lightColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(6.w)),
                  child: FlutterMap(
                    // mapController: mapController,
                    options: MapOptions(
                      center: latlng.LatLng(6.9271, 79.8612),
                      zoom: 6.0,
                    ),
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
