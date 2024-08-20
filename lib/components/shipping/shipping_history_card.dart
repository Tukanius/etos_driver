import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:etos_driver/models/result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShippingHistoryCard extends StatefulWidget {
  final Function()? onClick;
  final SetProcess data;
  const ShippingHistoryCard({
    super.key,
    this.onClick,
    required this.data,
  });

  @override
  State<ShippingHistoryCard> createState() => _ShippingHistoryCardState();
}

class _ShippingHistoryCardState extends State<ShippingHistoryCard> {
  int page = 1;
  int limit = 30;
  Result result = Result(count: 0, rows: []);

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
            margin: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Text(
                  'Гэрээний дугаар: ',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${widget.data.receipt?.contractNo}",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
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
                  'Баримтны дугаар: ',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${widget.data.receipt?.receiptNo}',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Эхэлсэн огноо: ',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat("yyyy-MM-dd HH:mm").format(
                    DateTime.parse(widget.data.createdAt!),
                  ),
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Дууссан огноо:',
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat("yyyy-MM-dd HH:mm").format(
                    DateTime.parse(widget.data.updatedAt!),
                  ),
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          widget.data.invalidWeight!.toInt() >= 500
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
                    fontSize: 16,
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
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
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
