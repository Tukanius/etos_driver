import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LayerIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const LayerIcon({super.key, this.size = 20, this.color = Colors.black});

  @override
  State<LayerIcon> createState() => _LayerIconState();
}

class _LayerIconState extends State<LayerIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/layer.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
