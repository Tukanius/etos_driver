// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/screens/map/map_page.dart';
import 'package:etos_driver/screens/profile/profile_page.dart';
import 'package:etos_driver/screens/shipment/shipment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    setState(() {
      currentIndex = tabController.index;
    });
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: const Text('Баталгаажуулалт'),
      content: const Text('Та гарахдаа итгэлтэй байна уу?'),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Болих'),
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
            exit(0);
          },
          child: const Text('Гарах'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Container(
          color: backgroundColor,
          child: Scaffold(
            backgroundColor: backgroundColor,
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                ShipmentPage(),
                MapPage(),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: white,
              ),
              child: TabBar(
                splashBorderRadius: BorderRadius.circular(20),
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.only(
                  top: 10,
                ),
                indicatorColor: white,
                labelColor: black,
                unselectedLabelColor: gray103,
                indicator: TopIndicator(),
                tabs: <Widget>[
                  Tab(
                    icon: SvgPicture.asset(
                      "assets/svg/home.svg",
                      height: 24,
                      width: 24,
                      color: currentIndex == 0 ? black : gray103,
                    ),
                    text: 'Нүүр',
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      "assets/svg/maps.svg",
                      height: 24,
                      width: 24,
                      color: currentIndex == 1 ? black : gray103,
                    ),
                    text: 'Газрын зураг',
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      "assets/svg/user.svg",
                      height: 24,
                      width: 24,
                      color: currentIndex == 2 ? black : gray103,
                    ),
                    text: 'Профайл',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = colorBlue
      ..strokeWidth = 3
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), paint);
  }
}
