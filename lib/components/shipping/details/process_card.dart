import 'package:etos_driver/components/shipping/details/process_shipment_modal.dart';
import 'package:etos_driver/components/shipping/details/process_truck_exit.dart';
import 'package:etos_driver/components/shipping/details/process_warehouse_modal.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';

class ProcessCard extends StatefulWidget {
  final SetProcess data;

  const ProcessCard({
    super.key,
    required this.data,
  });

  @override
  State<ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {
  showDetailShipment(ctx) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return ProcessShipment(data: widget.data);
      },
    );
  }

  showDetailWarehouse(ctx) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return ProcessWarehouse(data: widget.data);
      },
    );
  }

  showDetailTruckExit(ctx) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return ProcessTruckExit(data: widget.data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'Тээвэрлэлтийн үйл явц',
            style: TextStyle(
              color: black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: hintColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showDetailShipment(context);
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: green,
                      ),
                      height: 35,
                      width: 35,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ачилт',
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: green.withOpacity(0.3),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              'Амжилттай',
                              style: TextStyle(
                                color: green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 2,
                height: 25,
                color: green,
              ),
              InkWell(
                onTap: () {
                  showDetailWarehouse(context);
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: widget.data.processWarehouse?.status == "DONE"
                            ? green
                            : orange,
                      ),
                      height: 35,
                      width: 35,
                      child: widget.data.processWarehouse?.status == "DONE"
                          ? Center(
                              child: Icon(
                                Icons.check,
                                color: white,
                              ),
                            )
                          : Center(
                              child: Text(
                                "2",
                                style: TextStyle(color: white),
                              ),
                            ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Баталгаат агуулах',
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                widget.data.processWarehouse?.status == "DONE"
                                    ? green.withOpacity(0.3)
                                    : orange.withOpacity(0.3),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child:
                                widget.data.processWarehouse?.status == "DONE"
                                    ? Text(
                                        'Амжилттай',
                                        style: TextStyle(
                                          color: green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : const Text(
                                        'Хүлээгдэж буй',
                                        style: TextStyle(
                                          color: orange,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 2,
                height: 25,
                color: widget.data.processWarehouse?.status == "DONE"
                    ? green
                    : orange,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.data.processClearance?.status == "DONE"
                          ? green
                          : orange,
                    ),
                    height: 35,
                    width: 35,
                    child: widget.data.processClearance?.status == "DONE"
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: white,
                            ),
                          )
                        : Center(
                            child: Text(
                              "3",
                              style: TextStyle(color: white),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мэдүүлэг бичих',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.data.processClearance?.status == "DONE"
                              ? green.withOpacity(0.3)
                              : orange.withOpacity(0.3),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: widget.data.processClearance?.status == "DONE"
                              ? Text(
                                  'Амжилттай',
                                  style: TextStyle(
                                    color: green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'Хүлээгдэж буй',
                                  style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 2,
                height: 25,
                color: widget.data.processClearance?.status == "DONE"
                    ? green
                    : orange,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.data.processWarehouse?.status == "DONE"
                          ? green
                          : orange,
                    ),
                    height: 35,
                    width: 35,
                    child: widget.data.processWarehouse?.status == "DONE"
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: white,
                            ),
                          )
                        : Center(
                            child: Text(
                              "4",
                              style: TextStyle(color: white),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Шилжүүлэн ачих талбай',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.data.processWarehouse?.status == "DONE"
                              ? green.withOpacity(0.3)
                              : orange.withOpacity(0.3),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: widget.data.processWarehouse?.status == "DONE"
                              ? Text(
                                  'Амжилттай',
                                  style: TextStyle(
                                    color: green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'Хүлээгдэж буй',
                                  style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 2,
                height: 25,
                color: widget.data.processWarehouse?.status == "DONE"
                    ? green
                    : orange,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.data.processChangeAgv?.status == "DONE"
                          ? green
                          : orange,
                    ),
                    height: 35,
                    width: 35,
                    child: widget.data.processChangeAgv?.status == "DONE"
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: white,
                            ),
                          )
                        : Center(
                            child: Text(
                              "5",
                              style: TextStyle(color: white),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Тээврийн хэрэгсэл солих',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.data.processChangeAgv?.status == "DONE"
                              ? green.withOpacity(0.3)
                              : orange.withOpacity(0.3),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: widget.data.processChangeAgv?.status == "DONE"
                              ? Text(
                                  'Амжилттай',
                                  style: TextStyle(
                                    color: green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'Хүлээгдэж буй',
                                  style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 2,
                height: 25,
                color: widget.data.processChangeAgv?.status == "DONE"
                    ? green
                    : orange,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.data.processExport?.status == "DONE"
                          ? green
                          : orange,
                    ),
                    height: 35,
                    width: 35,
                    child: widget.data.processExport?.status == "DONE"
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: white,
                            ),
                          )
                        : Center(
                            child: Text(
                              "6",
                              style: TextStyle(color: white),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Экспорт хийгдсэн',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.data.processExport?.status == "DONE"
                              ? green.withOpacity(0.3)
                              : orange.withOpacity(0.3),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: widget.data.processExport?.status == "DONE"
                              ? Text(
                                  'Амжилттай',
                                  style: TextStyle(
                                    color: green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'Хүлээгдэж буй',
                                  style: TextStyle(
                                    color: orange,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                width: 2,
                height: 25,
                color: widget.data.processExport?.status == "DONE"
                    ? green
                    : orange,
              ),
              InkWell(
                onTap: () {
                  showDetailTruckExit(context);
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: widget.data.processTruckExit?.status == "DONE"
                            ? green
                            : orange,
                      ),
                      height: 35,
                      width: 35,
                      child: widget.data.processTruckExit?.status == "DONE"
                          ? Center(
                              child: Icon(
                                Icons.check,
                                color: white,
                              ),
                            )
                          : Center(
                              child: Text(
                                "7",
                                style: TextStyle(color: white),
                              ),
                            ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Баталгаат агуулхаас гарах',
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                widget.data.processTruckExit?.status == "DONE"
                                    ? green.withOpacity(0.3)
                                    : orange.withOpacity(0.3),
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child:
                                widget.data.processTruckExit?.status == "DONE"
                                    ? Text(
                                        'Амжилттай',
                                        style: TextStyle(
                                          color: green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : const Text(
                                        'Хүлээгдэж буй',
                                        style: TextStyle(
                                          color: orange,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
