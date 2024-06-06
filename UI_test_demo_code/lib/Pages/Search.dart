import 'dart:async';

import 'package:blur/blur.dart';
import 'package:demo/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  TextEditingController searchController = TextEditingController();
  bool openpopup = false;
  Set<Marker> _markers = {};
  final Placename = [
    "San Francisco",
    "Los Angeles",
    "New Yor",
    "London",
    "Paris",
    "Tokyo",
    "Moscow",
    "Sydney",
    "Beijing",
    "New Delhi",
  ];
  final List<LatLng> places = [
    LatLng(37.7749, -122.4194),
    LatLng(34.0522, -118.2437),
    LatLng(40.7128, -74.0060),
    LatLng(51.5074, -0.1278),
    LatLng(48.8566, 2.3522),
    LatLng(35.6895, 139.6917),
    LatLng(55.7558, 37.6173),
    LatLng(-33.8688, 151.2093),
    LatLng(39.9042, 116.4074),
    LatLng(28.6139, 77.2090),
  ];

  void _setMarkers() {
    for (int i = 0; i < places.length; i++) {
      _markers.addLabelMarker(
          LabelMarker(
            label: Placename[i].toString(),
            markerId: MarkerId(i.toString()),
            position: places[i],
            backgroundColor: Colors.orange,
            flat: true
          )
      ).then((value) => setState(() {}));
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkers();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: places.first,
                  zoom: 0,
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                }),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 15, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: TextFormField(
                              controller: searchController,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelStyle: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                                hintText: 'Saint Petersbug',
                                hintStyle: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                filled: true,
                                fillColor: AppColor.white,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  size: 24,
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            color: AppColor.primaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/filter.png",width: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, bottom: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Blur(
                          blur: 5,
                          borderRadius: BorderRadius.circular(50),
                          blurColor: Colors.grey,
                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            padding: EdgeInsets.all(15),
                            clipBehavior: Clip.antiAlias,
                            child:Image.asset("assets/database.png",color: AppColor.white,width: 15,),
                          ),
                          overlay: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            padding: EdgeInsets.all(15),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset("assets/database.png",color: AppColor.white,width: 15),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Blur(
                              blur: 5,
                              borderRadius: BorderRadius.circular(50),
                              blurColor: Colors.grey,
                              child: Container(
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                padding: EdgeInsets.all(15),
                                clipBehavior: Clip.antiAlias,
                                child:  Image.asset("assets/send.png",color: AppColor.white,width: 15),
                              ),
                              overlay: Container(
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                padding: EdgeInsets.all(15),
                                clipBehavior: Clip.antiAlias,
                                child:  Image.asset("assets/send.png",color: AppColor.white,width: 20),
                              ),
                            ),
                            Blur(
                              blur: 5,
                              borderRadius: BorderRadius.circular(50),
                              blurColor: Colors.grey,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    openpopup = !openpopup;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: EdgeInsets.all(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Row(
                                    children: [
                                      Icon(Icons.list, color: AppColor.white),
                                      SizedBox(width: 10),
                                      Text("List of variants",
                                          style:
                                              TextStyle(color: AppColor.white))
                                    ],
                                  ),
                                ),
                              ),
                              overlay: InkWell(
                                onTap: () {
                                  setState(() {
                                    openpopup = !openpopup;
                                  });
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: EdgeInsets.all(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Row(
                                    children: [
                                      Icon(Icons.list, color: AppColor.white),
                                      SizedBox(width: 10),
                                      Text("List of variants",
                                          style:
                                              TextStyle(color: AppColor.white))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
