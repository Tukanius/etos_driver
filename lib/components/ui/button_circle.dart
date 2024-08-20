import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';

class ButtonCircle extends StatefulWidget {
  final StatefulWidget icon;
  final Function() onPress;

  const ButtonCircle({super.key, required this.onPress, required this.icon});

  @override
  State<ButtonCircle> createState() => _ButtonCircleState();
}

class _ButtonCircleState extends State<ButtonCircle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: white,
      ),
      child: widget.icon,
    );
  }
}
