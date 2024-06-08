import 'dart:async';
import 'package:blur/blur.dart';
import 'package:demo/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'animation.dart';

// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  List<AnimationInfo> _animationInfo = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this); // Initialize animation information with effects
    _animationInfo.addAll([
      AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 100.ms,
            duration: 800.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
        controller: _controller!,
      ),
      AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 450.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 450.0.ms,
            duration: 2000.0.ms,
            begin: Offset(-500.0, 0),
            end: Offset(0.0, 1.0),
          ),
        ],
        controller: _controller!,
      ),AnimationInfo(
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 2000.0.ms,
            begin: Offset(30.0, 1200),
            end: Offset(0.0,0.0),
          ),
        ],
        controller: _controller!,
      )
    ]);

  }


  @override
  void dispose() {
    // Dispose the animation controller to free up resources
    _controller!.dispose();
    super.dispose();
  }

  Widget items({required double height}) {

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1524758631624-e2822e304c36?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxmdXJuaXR1cmV8ZW58MHx8fHwxNzE3NjExNDc5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                  width: double.infinity,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Blur(
                    blur: 5,
                    borderRadius: BorderRadius.circular(50),
                    blurColor: Colors.white,
                    overlay: Container(
                      width: double.infinity,
                      height: 45,
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            "GladKova st.,25",
                            style: TextStyle(fontSize: 18),
                            maxLines: 1,
                          ))),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.keyboard_arrow_right_outlined),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                          )
                        ],
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                ),
              ).animateOnPageLoad(_animationInfo![1])
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xDFFDFAFA), Color(0xFFFAD7AE)],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 390,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColor.secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Color(0xFF9B8970),
                                              size: 18,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                'Saint Petersburg',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF9B8970),
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnPageLoad(_animationInfo!.first),
                                    //     .animateOnPageLoad(animationsMap[
                                    // 'containerOnPageLoadAnimation1']!),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFC9E12),
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1631947430066-48c30d57b943?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxnaXJsfGVufDB8fHx8MTcxNzUzNjk0OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ).animateOnPageLoad(_animationInfo!.first)
                                    //     .animateOnPageLoad(animationsMap[
                                    // 'containerOnPageLoadAnimation2']!),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Hi, Marina',
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF9B8970),
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 20),
                                    child: Text(
                                      'let\'s select your \nperfect place',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontFamily: 'Poppins',
                                        color: AppColor.primaryTextColor,
                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(_animationInfo!.first),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipOval(
                                      child: Container(
                                        width: 160,
                                        height: 160,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFC9E12),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 0, 0),
                                                child: Text(
                                                  'BUY',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 25, 0, 0),
                                              child: calculateNumbers(
                                                  maxvalue: 212,
                                                  textcolor: Colors.white),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Text(
                                                'offers',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(_animationInfo!.first),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 25),
                                      child: Container(
                                        width: 100,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: AppColor.secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 0, 0),
                                                child: Text(
                                                  'RENT',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF9B8970),
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 25, 0, 0),
                                              child: calculateNumbers(
                                                  maxvalue: 212,
                                                  textcolor: Color(0xFF9B8970)),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Text(
                                                'offers',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF9B8970),
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(_animationInfo!.first),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 390, 0, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.secondaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 8, 15, 10),
                                    child: items(height: 200),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 350,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 15, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child:
                                                items(height: double.infinity),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: items(
                                                          height:
                                                              double.infinity),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Expanded(
                                                      child: items(
                                                          height:
                                                              double.infinity),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 100)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(_animationInfo![2]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class calculateNumbers extends StatefulWidget {
  final double maxvalue;
  final Color textcolor;

  const calculateNumbers(
      {super.key, required this.maxvalue, required this.textcolor});

  @override
  State<calculateNumbers> createState() => _calculateNumbersState();
}

class _calculateNumbersState extends State<calculateNumbers> {
  int values = 0;
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate();
  }

  calculate() {
    timer = Timer.periodic(Duration(microseconds: 100), (timer) {
      setState(() {
        values != widget.maxvalue ? values++ : null;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    return Text("2 $values",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: widget.textcolor,
          fontSize: 30,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ));
  }
}
