import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool? boxShadow;
  final String labelText;
  final Function()? onClick;
  final Color? labelColor;
  final bool? isLoading;
  final double? borderWidth;
  final Color? borderColor;
  final Color? textColor;
  const CustomButton({
    this.boxShadow,
    this.textColor,
    this.labelColor,
    this.isLoading,
    this.onClick,
    this.labelText = '',
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 42,
        decoration: BoxDecoration(
          border: Border.all(
              color: widget.borderColor!, width: widget.borderWidth!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: widget.isLoading == false ? widget.onClick : () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: colorBlue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isLoading == true)
                Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                  ),
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: white,
                    strokeWidth: 2.5,
                  ),
                ),
              Text(
                widget.labelText.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: widget.textColor ?? white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
