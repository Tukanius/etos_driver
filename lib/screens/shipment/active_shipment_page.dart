import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:etos_driver/api/receipt_api.dart';
import 'package:etos_driver/components/controller/listen.dart';
import 'package:etos_driver/components/shipping/shipping_card.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:etos_driver/models/result.dart';
import 'package:etos_driver/screens/shipment/shipment_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActiveShipment extends StatefulWidget {
  const ActiveShipment({super.key});

  @override
  State<ActiveShipment> createState() => _ActiveShipmentState();
}

class _ActiveShipmentState extends State<ActiveShipment> with AfterLayoutMixin {
  bool isLoading = true;
  int page = 1;
  int limit = 30;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  Filter filter = Filter();
  late SetProcess? process;
  ListenController listenController = ListenController();
  @override
  afterFirstLayout(BuildContext context) async {
    process = await ReceiptApi().getActiveReceipt(true);
    setState(() {
      isLoading = false;
    });
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      isLoading = true;
    });
    process = await ReceiptApi().getActiveReceipt(true);
    refreshController.refreshCompleted();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: black,
              ),
            )
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: refreshController,
              header: WaterDropHeader(
                waterDropColor: black,
                refresh: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: black,
                    strokeWidth: 2,
                  ),
                ),
              ),
              onRefresh: _onRefresh,
              footer: CustomFooter(
                builder: (context, mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = const Text("");
                  } else if (mode == LoadStatus.loading) {
                    body = const CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = const Text("Алдаа гарлаа. Дахин үзнэ үү!");
                  } else {
                    body = const Text("Мэдээлэл алга байна");
                  }
                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      process != null
                          ? ShippingCard(
                              data: process!,
                              onClick: () {
                                Navigator.of(context).pushNamed(
                                  DetailPage.routeName,
                                  arguments: DetailPageArguments(
                                    data: process!,
                                  ),
                                );
                              },
                            )
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 150,
                                ),
                                Lottie.asset(
                                  'assets/lottie/empty.json',
                                  height: 200,
                                  repeat: false,
                                ),
                                Text(
                                  "Идэвхтэй хүргэлт олдсонгүй",
                                  style: TextStyle(color: hintColor),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
