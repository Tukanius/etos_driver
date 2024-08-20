import 'package:etos_driver/components/shipping/details/contract_card.dart';
import 'package:etos_driver/components/shipping/details/process_card.dart';
import 'package:etos_driver/components/shipping/details/weight_card.dart';
import 'package:etos_driver/models/process.dart';
import 'package:flutter/material.dart';

class DetailCard extends StatefulWidget {
  final SetProcess data;
  const DetailCard({
    super.key,
    required this.data,
  });

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContractCard(data: widget.data),
        const SizedBox(
          height: 10,
        ),
        WeightCard(data: widget.data),
        const SizedBox(
          height: 10,
        ),
        ProcessCard(data: widget.data),
      ],
    );
  }
}
