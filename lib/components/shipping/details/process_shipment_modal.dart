import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProcessShipment extends StatefulWidget {
  final SetProcess data;
  const ProcessShipment({super.key, required this.data});

  @override
  State<ProcessShipment> createState() => _ProcessShipmentState();
}

class _ProcessShipmentState extends State<ProcessShipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Ачилт',
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
                      'Харилцагч:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.supplierName != null
                          ? "${widget.data.receipt?.supplierName}"
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
                      'Баримтын дугаар:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.receiptNo != null
                          ? "${widget.data.receipt?.receiptNo}"
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
                      'Тээвэрлэгч:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.transportName != null
                          ? "${widget.data.receipt?.transportName}"
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
                      'Гэрээний дугаар:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.contractNo != null
                          ? "${widget.data.receipt?.contractNo}"
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
                      'Худалдан авагч:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.buyerName != null
                          ? "${widget.data.receipt?.buyerName}"
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
                      'Бүтээгдэхүүний нэр:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.productName != null
                          ? "${widget.data.receipt?.productName}"
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
                      'Бүртгэсэн огноо:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.receiptStatusDate != null
                          ? DateFormat("yyyy-MM-dd").format(
                              DateTime.parse(
                                  widget.data.receipt!.receiptStatusDate!),
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
                      widget.data.receipt?.vehiclePlateNo != null
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
                      'Тээврийн хэрэгслийн RFID:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.vehicleRfidNumber != null
                          ? "${widget.data.receipt?.vehicleRfidNumber}"
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
                      'Цэвэр жин:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.totalWeight != null
                          ? "${widget.data.receipt?.totalWeight}"
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
                      'Ачаагүй жин:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt?.unladedWeight != null
                          ? "${widget.data.receipt?.unladedWeight}"
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
                      widget.data.receipt?.ladedWeight != null
                          ? "${widget.data.receipt?.ladedWeight}"
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
                      widget.data.receipt!.containerNumbers!.isNotEmpty
                          ? "${widget.data.receipt?.containerNumbers?[0]}"
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
                      widget.data.receipt!.containerNumbers!.length >= 2
                          ? "${widget.data.receipt?.containerNumbers?[1]}"
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
                      widget.data.receipt!.containerNumbers!.length >= 3
                          ? "${widget.data.receipt?.containerNumbers?[2]}"
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
                      widget.data.receipt!.containerNumbers!.length >= 4
                          ? "${widget.data.receipt?.containerNumbers?[3]}"
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
                      'Лац 1:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt!.sealNumbers!.isNotEmpty
                          ? "${widget.data.receipt?.sealNumbers?[0]}"
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
                      'Лац 2:',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.data.receipt!.sealNumbers!.length >= 2
                          ? "${widget.data.receipt?.sealNumbers?[1]}"
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
                      widget.data.receipt!.trailerPlateNumbers!.isNotEmpty
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
                      widget.data.receipt!.trailerPlateNumbers!.length >= 2
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
            ],
          ),
        ),
      ),
    );
  }
}
