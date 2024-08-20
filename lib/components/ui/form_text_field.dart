import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatefulWidget {
  final String name;
  final String? labelText;
  final double? width;
  final bool? filled;
  final Color? textColor;
  final Color? labelColor;
  final Widget? suffixIcon;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final String? Function(dynamic)? validator;
  final Color? fillColor;
  final bool obscureText;
  final bool hasObscureControl;
  final TextEditingController? controller;
  final bool readOnly;
  final Function(String?)? onChange;
  final String? initialValue;
  final Widget? prefixIcon;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;

  const FormTextField({
    this.suffixIcon,
    super.key,
    required this.name,
    this.labelText,
    this.width,
    this.textColor,
    this.filled = false,
    this.labelColor,
    this.bgColor,
    this.padding,
    this.validator,
    this.fillColor,
    this.obscureText = false,
    this.hasObscureControl = false,
    this.controller,
    this.readOnly = false,
    this.onChange,
    this.prefixIcon,
    this.hintText,
    this.initialValue,
    this.inputFormatters,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool isPasswordVisible = false;
  @override
  void initState() {
    isPasswordVisible = widget.hasObscureControl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          widget.labelText != null
              ? Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    widget.labelText ?? '',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: widget.labelColor,
                    ),
                  ),
                )
              : const SizedBox(),

          FormBuilderTextField(
            inputFormatters: widget.inputFormatters,
            initialValue: widget.initialValue,
            name: widget.name,
            validator: widget.validator,
            controller: widget.controller,
            readOnly: widget.readOnly,
            onChanged: widget.onChange,
            obscureText:
                !widget.obscureText ? isPasswordVisible : !isPasswordVisible,
            style: TextStyle(color: widget.textColor ?? white),
            decoration: InputDecoration(
              suffixIcon: widget.obscureText == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible == true
                          ? Icon(
                              Icons.visibility,
                              color: Colors.grey.shade700,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                    )
                  : widget.suffixIcon,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              fillColor: widget.fillColor ?? Colors.transparent,
              filled: widget.filled,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              hintStyle: TextStyle(color: hintColor, fontSize: 14),
              contentPadding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            ),
          ),
        ],
      ),
    );
  }
}
