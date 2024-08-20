import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/screens/notification/notification_page.dart';
import 'package:etos_driver/screens/shipment/active_shipment_page.dart';
import 'package:etos_driver/screens/shipment/shipment_history_page.dart';
import 'package:flutter/material.dart';

class ShipmentPage extends StatefulWidget {
  static const routeName = 'ShipmentPage';
  const ShipmentPage({super.key});

  @override
  State<ShipmentPage> createState() => _ShipmentPageState();
}

class _ShipmentPageState extends State<ShipmentPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.index = currentIndex;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  changePage(index) {
    setState(() {
      tabController.index = index;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 56,
            automaticallyImplyLeading: false,
            pinned: false,
            snap: true,
            floating: true,
            elevation: 0,
            backgroundColor: white,
            centerTitle: true,
            title: Text(
              "Тээвэрлэлт",
              style: TextStyle(
                color: black,
                fontSize: 18,
              ),
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
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 35),
              child: Column(
                children: [
                  Container(
                    color: white,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 45,
                          decoration: tabController.index == 0
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: black),
                                  ),
                                )
                              : const BoxDecoration(),
                          child: GestureDetector(
                            onTap: () {
                              changePage(0);
                            },
                            child: Center(
                              child: Text(
                                'Хүргэлт',
                                style: TextStyle(
                                  fontSize: tabController.index == 0 ? 14 : 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          decoration: tabController.index == 1
                              ? BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: black),
                                  ),
                                )
                              : const BoxDecoration(),
                          child: GestureDetector(
                            onTap: () {
                              changePage(1);
                            },
                            child: Center(
                              child: Text(
                                'Хүргэлтийн түүх',
                                style: TextStyle(
                                  fontSize: tabController.index == 1 ? 14 : 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ActiveShipment(),
          InActiveShipment(),
        ],
      ),
    );
  }
}
