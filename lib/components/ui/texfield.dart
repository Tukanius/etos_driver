import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FTextForm extends StatefulWidget {
  final String name;
  final String labelText;
  final double? width;
  final Color? textColor;
  final Color? labelColor;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;

  const FTextForm(
      {super.key,
      required this.name,
      required this.labelText,
      this.width,
      this.textColor,
      this.labelColor,
      this.bgColor,
      this.padding});

  @override
  State<FTextForm> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FTextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.bgColor ?? black,
            borderRadius: BorderRadius.circular(8.0)),
        child: FormBuilderTextField(
          name: widget.name,
          style: TextStyle(color: widget.textColor ?? colorTextDark),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0, color: widget.labelColor ?? colorBlue)),
            fillColor: Colors.transparent,
            labelText: widget.labelText,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500, color: widget.labelColor),
            isDense: true,
            filled: true,
            contentPadding: widget.padding ??
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          ),
        ));
  }
}
