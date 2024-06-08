import 'package:demo/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/Pages/Favorite.dart';
import 'package:demo/Pages/Search.dart';
import 'package:demo/Pages/profile.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'Pages/Home.dart';
import 'Pages/animation.dart';
import 'Pages/chat.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  List<AnimationInfo> _animationInfo = [];
  int _SelectedTab = 2;
  List navibarpages = [
    MapWidget(),
    chat(),
    HomePageWidget(),
    Favorite(),
    profile()
  ];
  List Icons = [
    "assets/find.png",
    "assets/chat.png",
    "assets/home.png",
    "assets/heart.png",
    "assets/user.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this); // Initialize animation information with effects
    _animationInfo.addAll([
      AnimationInfo(
        effectsBuilder: () =>
        [
          VisibilityEffect(duration: 1000.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1500.0.ms,
            begin: Offset(30.0, 1200),
            end: Offset(0.0, 0.0),
          ),
        ],
        controller: _controller!,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
          navibarpages[_SelectedTab],
          KeyboardVisibilityBuilder(
              builder: (p0, isKeyboardVisible) => !isKeyboardVisible ?
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.7,
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      decoration: BoxDecoration(
                          color: Color(0xFF2b2b2b),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      clipBehavior: Clip.antiAlias,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(Icons.length, (index) =>
                            InkWell(
                              onTap: () =>
                                  setState(() {
                                    _SelectedTab = index;
                                  }),
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _SelectedTab == index ? AppColor
                                      .primary : AppColor.black,
                                ),
                                padding: EdgeInsets.all(13),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  Icons[index],
                                  color: AppColor.white,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                        ),
                      ),
                    ),

                  ).animateOnPageLoad(_animationInfo!.first) : SizedBox.shrink(),
        ),

        ],
      ),
    ),);
  }
}
