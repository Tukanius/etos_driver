import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const NotificationIcon(
      {super.key, this.size = 22, this.color = Colors.black});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/notification.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
