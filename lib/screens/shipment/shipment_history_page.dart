import 'dart:async';

// import 'package:etos_driver/api/receipt_api.dart';
import 'package:etos_driver/api/receipt_api.dart';
import 'package:etos_driver/components/shipping/shipping_history_card.dart';
import 'package:etos_driver/components/ui/form_text_field.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/result.dart';
import 'package:etos_driver/screens/shipment/shipment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:after_layout/after_layout.dart';
import 'package:lottie/lottie.dart';

class InActiveShipment extends StatefulWidget {
  const InActiveShipment({super.key});

  @override
  State<InActiveShipment> createState() => _InActiveShipmentState();
}

class _InActiveShipmentState extends State<InActiveShipment>
    with AfterLayoutMixin, TickerProviderStateMixin {
  bool isLoading = true;
  int page = 1;
  int limit = 10;
  Result result = Result(count: 0, rows: []);
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  loadData(int page, int limit) async {
    Filter filter = Filter();
    Offset offset = Offset(limit: limit, page: page);

    result = await ReceiptApi()
        .getHistoryList(ResultArguments(filter: filter, offset: offset));
  }

  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    await loadData(page, limit);
    setState(() {
      isLoading = false;
    });
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      isLoading = true;
    });
    await loadData(page, limit);
    setState(() {
      refreshController.refreshCompleted();

      isLoading = false;
    });
  }

  void _onLoading() async {
    setState(() {
      limit += 10;
    });
    await loadData(page, limit);
    refreshController.refreshCompleted();
    setState(() {
      isLoading = false;
    });
  }

  // onChange(String value) {
  //   Future.delayed(Duration(milliseconds: 400), () {
  //   });
  // }
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
              onLoading: _onLoading,
              footer: CustomFooter(
                builder: (context, mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = const Text("");
                  } else if (mode == LoadStatus.loading) {
                    body = SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: black,
                        strokeWidth: 2,
                      ),
                    );
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
                      FormTextField(
                        // onChange: (value) {},
                        name: "search",
                        hintText: "Хайх",
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: black,
                        ),
                        fillColor: white,
                        textColor: black,
                        labelColor: black,
                        bgColor: Colors.transparent,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      result.rows!.isNotEmpty
                          ? Column(
                              children: result.rows!
                                  .map(
                                    (data) => Column(
                                      children: [
                                        ShippingHistoryCard(
                                          data: data,
                                          onClick: () {
                                            Navigator.of(context).pushNamed(
                                              DetailPage.routeName,
                                              arguments: DetailPageArguments(
                                                data: data,
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
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
                                  "Хүргэлтийн түүх олдсонгүй",
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
