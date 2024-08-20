import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final Function()? onClick;
  final Widget? icon;
  const ActionButton({
    this.onClick,
    super.key,
    this.icon,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: widget.icon,
    );
  }
}
