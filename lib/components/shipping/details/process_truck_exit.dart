import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProcessTruckExit extends StatefulWidget {
  final SetProcess data;
  const ProcessTruckExit({super.key, required this.data});

  @override
  State<ProcessTruckExit> createState() => _ProcessTruckExitState();
}

class _ProcessTruckExitState extends State<ProcessTruckExit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Баталгаат агуулхаас гарах',
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
                      widget.data.processTruckExit?.status == "DONE"
                          ? "${widget.data.truckScales?.last.vehiclePlateNumber}"
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
                      'Хэмжилтийн жин:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processTruckExit?.status == "DONE"
                          ? "${widget.data.truckScales?.last.scaledWeight}"
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
                      ' Огноо:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.processTruckExit?.status == "DONE"
                          ? DateFormat("yyyy-MM-dd HH:mm:ss").format(
                              DateTime.parse(
                                  widget.data.truckScales!.last.weighingTime!),
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
                      widget.data.processTruckExit?.status == "DONE" &&
                              widget.data.truckScales!.last.containerNumbers!
                                  .isNotEmpty
                          ? "${widget.data.truckScales?.last.containerNumbers?[0]}"
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
                      widget.data.processTruckExit?.status == "DONE" &&
                              widget.data.truckScales!.last.containerNumbers!
                                      .length >=
                                  2
                          ? "${widget.data.truckScales?.last.containerNumbers?[1]}"
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
