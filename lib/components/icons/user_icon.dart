import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserIcon extends StatefulWidget {
  final double? size;
  final Color? color;
  const UserIcon({super.key, this.size = 20, this.color = Colors.black});

  @override
  State<UserIcon> createState() => _UserIconState();
}

class _UserIconState extends State<UserIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/user.svg',
      height: widget.size,
      width: widget.size,
      // ignore: deprecated_member_use
      color: widget.color,
    );
  }
}
