import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProcessWarehouse extends StatefulWidget {
  final SetProcess data;
  const ProcessWarehouse({super.key, required this.data});

  @override
  State<ProcessWarehouse> createState() => _ProcessWarehouseState();
}

class _ProcessWarehouseState extends State<ProcessWarehouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Баталгаат агуулах',
          style: TextStyle(
            color: black,
            fontSize: 16,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ActionButton(
              onClick: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Улсын дугаар:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE"
                          ? "${widget.data.receipt?.vehiclePlateNo}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Ачаатай жин:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE"
                          ? "${widget.data.processWarehouse?.weight}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Чингэлэг 1:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE" &&
                              widget.data.truckScales?.first.containerNumbers
                                      ?.isNotEmpty ==
                                  true
                          ? "${widget.data.truckScales?.first.containerNumbers?[0]}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Чингэлэг 2:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE" &&
                              widget.data.truckScales!.first.containerNumbers!
                                      .length >=
                                  2
                          ? "${widget.data.truckScales?.first.containerNumbers?[1]}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Чингэлэг 3:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE" &&
                              widget.data.truckScales!.first.containerNumbers!
                                      .length >=
                                  3
                          ? "${widget.data.truckScales?.first.containerNumbers?[2]}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Чингэлэг 4:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE" &&
                              widget.data.truckScales!.first.containerNumbers!
                                      .length >=
                                  4
                          ? "${widget.data.truckScales?.first.containerNumbers?[3]}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                indent: 2,
                endIndent: 2,
                color: hintColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Чиргүүл 1:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE" &&
                              widget.data.receipt?.trailerPlateNumbers
                                      ?.isNotEmpty ==
                                  true
                          ? "${widget.data.receipt?.trailerPlateNumbers?[0]}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Чиргүүл 2:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE" &&
                              widget.data.receipt!.trailerPlateNumbers!
                                      .length >=
                                  2
                          ? "${widget.data.receipt?.trailerPlateNumbers?[1]}"
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: hintColor,
                indent: 2,
                endIndent: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Огноо:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processWarehouse?.status == "DONE"
                          ? DateFormat("yyyy-MM-dd HH:mm").format(
                              DateTime.parse(
                                  widget.data.truckScales!.first.weighingTime!),
                            )
                          : '-',
                      style: TextStyle(
                        color: colorBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
