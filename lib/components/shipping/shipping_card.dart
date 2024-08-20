import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShippingCard extends StatefulWidget {
  final Function()? onClick;
  final SetProcess data;
  const ShippingCard({
    super.key,
    this.onClick,
    required this.data,
  });

  @override
  State<ShippingCard> createState() => _ShippingCardState();
}

class _ShippingCardState extends State<ShippingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: hintColor),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.data.receipt?.vehiclePlateNo}",
                  style: TextStyle(
                    color: black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  DateFormat("yyyy-MM-dd HH:mm").format(
                    DateTime.parse(widget.data.createdAt!),
                  ),
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: Divider(
              color: hintColor,
              indent: 5,
              endIndent: 5,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Жолооч: ${widget.data.receipt?.driverName}',
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Гэрээний дугаар',
                        style: TextStyle(
                          color: hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.data.receipt?.contractNo}",
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Гаалийн бүрдүүлэлт',
                        style: TextStyle(
                          color: hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.data.receipt?.isClearance == true
                            ? "Бүрдүүлэлттэй"
                            : 'Бүрдүүлэлтгүй',
                        style: TextStyle(
                          color: widget.data.receipt?.isClearance == true
                              ? green
                              : red,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Баримтны дугаар',
                        style: TextStyle(
                          color: hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.data.receipt?.receiptNo}",
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Чингэлэгний тоо',
                        style: TextStyle(
                          color: hintColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.data.receipt?.containerNumbers?.length}",
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: Divider(
              color: hintColor,
              indent: 5,
              endIndent: 5,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Төлөв:',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                Text(
                  widget.data.exportItemStatus == "DONE"
                      ? 'Амжилтай'
                      : 'Хүлээгдэж буй',
                  style: TextStyle(
                    color: widget.data.exportItemStatus == "DONE"
                        ? green
                        : colorBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Худалдан авагч:',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${widget.data.receipt?.buyerName}",
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Тээвэрлэгч:',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${widget.data.receipt?.transportName}",
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          widget.data.invalidWeight!.toInt() >= 0
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: colorBlue.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Жингийн зөрүү:',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${widget.data.invalidWeight}КГ',
                        style: TextStyle(
                          color: red,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: widget.onClick,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: black),
              ),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Дэлгэрэнгүй',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: black,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
