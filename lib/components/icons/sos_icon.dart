import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SosIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const SosIcon({super.key, this.size = 20, this.color = Colors.black});

  @override
  State<SosIcon> createState() => _SosIconState();
}

class _SosIconState extends State<SosIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/sos.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
