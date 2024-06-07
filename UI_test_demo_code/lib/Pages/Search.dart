import 'dart:async';
import 'package:demo/Pages/animation.dart';
import 'package:blur/blur.dart';
import 'package:demo/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'animation.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget>  with TickerProviderStateMixin{
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  AnimationController? _controlleranimaiton;
  AnimationInfo? _animationInfo;
  TextEditingController searchController = TextEditingController();
  bool openpopup = false;
  String selected = "Casy";
  List<String> popitems = [
    "Cosy areas",
    "Price",
    "Infrastructure",
    "Without any layer"
  ];
  List<String> popitemsImages = [
    "assets/verified.png",
    "assets/wallet.png",
    "assets/shopping-basket.png",
    "assets/layers.png"
  ];
  Set<Marker> _markers = {};
  final Placename = [
    "11,3 mm p",
    "8,5 mm p",
    "11,8 mm p",
    "5,9 mm p",
    "8,7 mm p",
    "25,3 mm p",
    "18,1 mm p",
    "4,8 mm p",
    "18,7 mm p",
    "5,9 mm p",
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

  Future<void> _setMarkers(bool showmarkerDetail) async {
    for (int i = 0; i < places.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: places[i],
        icon: await TextOnImage(
          text: Placename[i],
          showmarkerDetail: showmarkerDetail,
          id: i.toString(),
        ).toBitmapDescriptor(
            logicalSize: !showmarkerDetail ? Size(80, 80) : Size(150, 80),
            imageSize: !showmarkerDetail ? Size(80, 80) : Size(150, 80)),
      ));
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarkers(true);
    _controlleranimaiton = AnimationController(vsync: this);
    _animationInfo = AnimationInfo(
      effectsBuilder: () => [
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInCirc,
          delay: 100.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
      controller: _controlleranimaiton!,
    );
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
                mapType: MapType.normal,
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
                          padding: EdgeInsets.all(13),
                          child: Image.asset("assets/filter.png", width: 18),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(_animationInfo!),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, bottom: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            _setMarkers(true);
                          },
                          child: Blur(
                            blur: 5,
                            borderRadius: BorderRadius.circular(50),
                            blurColor: Colors.grey,
                            child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              padding: EdgeInsets.all(15),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                "assets/database.png",
                                color: AppColor.white,
                                width: 20,
                              ),
                            ),
                            overlay: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              padding: EdgeInsets.all(15),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset("assets/database.png",
                                  color: AppColor.white, width: 25),
                            ),
                          ),
                        ).animateOnPageLoad(_animationInfo!),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PopupMenuButton<String>(
                              onSelected: (String result) {
                                setState(() {
                                  selected = result;
                                });
                              },
                              onOpened: () {
                                _setMarkers(false);
                                // _controller.;
                              },
                              elevation: 0,
                              color: Color(0xFFFBF5EB),
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              offset: Offset(0, -220),
                              itemBuilder: (BuildContext context) =>
                                  List.generate(
                                popitems.length,
                                (index) => PopupMenuItem<String>(
                                  value: popitems[index],
                                  child: Row(
                                    children: [
                                      Image.asset(popitemsImages[index],
                                          color: selected == popitems[index]
                                              ? AppColor.primary
                                              : AppColor.secondaryTextColor,
                                          width: 23),
                                      SizedBox(width: 15),
                                      Text(
                                        popitems[index],
                                        style: TextStyle(
                                            color: selected == popitems[index]
                                                ? AppColor.primary
                                                : AppColor.secondaryTextColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Blur(
                                blur: 5,
                                borderRadius: BorderRadius.circular(50),
                                blurColor: Colors.grey,
                                child: Container(
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  padding: EdgeInsets.all(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/send.png",
                                      color: AppColor.white, width: 25),
                                ),
                                overlay: Container(
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  padding: EdgeInsets.all(15),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/send.png",
                                      color: AppColor.white, width: 25),
                                ),
                              ),
                            ).animateOnPageLoad(_animationInfo!),
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
                            ).animateOnPageLoad(_animationInfo!),
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

class TextOnImage extends StatefulWidget {
  final String text;
  final String id;
  final bool showmarkerDetail;

  const TextOnImage(
      {super.key,
      required this.text,
      required this.showmarkerDetail,
      required this.id});

  @override
  State<TextOnImage> createState() => _TextOnImageState();
}

class _TextOnImageState extends State<TextOnImage> {
  String selected = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !widget.showmarkerDetail || selected == widget.id ? 80 : 150,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      clipBehavior: Clip.antiAlias,
      child: widget.showmarkerDetail
          ? Text(widget.text,
              style: TextStyle(color: AppColor.white, fontSize: 25))
          : Icon(CupertinoIcons.building_2_fill,
              color: AppColor.white, size: 30),
    );
  }
}
