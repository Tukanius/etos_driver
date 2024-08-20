import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';

class RegisterLetter extends StatefulWidget {
  final String? text;
  final Function()? onPressed;
  final double width;
  final double height;
  final Color? color;
  final Color textColor;
  final double fontSize;
  final Radius radius;

  const RegisterLetter({
    super.key,
    this.text,
    this.onPressed,
    this.color,
    this.width = 50,
    this.height = 50,
    this.textColor = Colors.black,
    this.radius = const Radius.circular(10.0),
    this.fontSize = 16,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RegisterItemState createState() => _RegisterItemState();
}

class _RegisterItemState extends State<RegisterLetter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: gray102,
          border: Border.all(
            color: white,
          ),
          borderRadius: BorderRadius.all(widget.radius)),
      child: GestureDetector(
        onTap: widget.onPressed ?? () {},
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Text(
              widget.text ?? "A",
              style: TextStyle(color: black, fontSize: widget.fontSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
