import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String labelText;
  final Color? labelColor;
  final Color color;
  final Function() onPress;
  final bool? isLoading;

  const Button({
    super.key,
    required this.labelText,
    required this.color,
    this.labelColor = Colors.white,
    required this.onPress,
    this.isLoading,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: ElevatedButton(
          onPressed: widget.isLoading == false ? widget.onPress : () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: widget.color,
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
                widget.labelText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
