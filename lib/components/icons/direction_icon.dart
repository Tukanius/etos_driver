import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DirectionIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const DirectionIcon({super.key, this.size = 20, this.color = Colors.black});

  @override
  State<DirectionIcon> createState() => _DirectionIconState();
}

class _DirectionIconState extends State<DirectionIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/direction.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
