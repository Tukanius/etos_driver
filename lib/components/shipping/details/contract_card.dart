import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';

class ContractCard extends StatefulWidget {
  final SetProcess data;
  const ContractCard({super.key, required this.data});

  @override
  State<ContractCard> createState() => _ContractCardState();
}

class _ContractCardState extends State<ContractCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            'Гэрээний мэдээлэл',
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
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: white,
            border: Border.all(color: hintColor),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Гэрээний дугаар:",
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.data.receipt?.contractNo}",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Баримтын дугаар:",
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.data.receipt?.receiptNo}",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Худалдан авагч:",
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.data.receipt?.buyerName}",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Тээвэрлэгч:",
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.data.receipt?.transportName}",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Харилцагч:",
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.data.receipt?.supplierName}",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Бүтээгдэхүүн:",
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.data.receipt?.productName}",
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
