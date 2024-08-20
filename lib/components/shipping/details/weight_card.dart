import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatefulWidget {
  final SetProcess data;
  const WeightCard({super.key, required this.data});

  @override
  State<WeightCard> createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'Жингийн мэдээлэл',
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: white,
            border: Border.all(color: hintColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Ачаагүй жин",
                        style: TextStyle(
                          color: hintColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.data.receipt?.unladedWeight != null
                            ? '${widget.data.receipt?.unladedWeight}'
                            : '-',
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Ачаатай жин",
                        style: TextStyle(
                          color: hintColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.data.receipt?.ladedWeight != null
                            ? '${widget.data.receipt?.ladedWeight}'
                            : '-',
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Цэвэр жин",
                        style: TextStyle(
                          color: hintColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        widget.data.receipt?.totalWeight != null
                            ? '${widget.data.receipt?.totalWeight}'
                            : '-',
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              widget.data.invalidWeight!.toInt() >= 500
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
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
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'Чингэлгийн мэдээлэл',
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: white,
            border: Border.all(color: hintColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Чиргүүлийн дугаар",
                style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    '${widget.data.receipt?.trailerPlateNumbers?.join(", ")}',
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Чингэлэг",
                style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.data.receipt?.containerNumbers?.join(", ")}',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Гаалийн лац",
                style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.data.receipt?.sealNumbers?.join(", ")}',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
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
