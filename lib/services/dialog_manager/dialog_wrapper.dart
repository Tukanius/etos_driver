import 'package:flutter/material.dart';

class DialogWrapper extends StatefulWidget {
  final Widget? child;
  // ignore: use_key_in_widget_constructors
  const DialogWrapper({this.child});
  @override
  // ignore: library_private_types_in_public_api
  _DialogWrapperState createState() => _DialogWrapperState();
}

class _DialogWrapperState extends State<DialogWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
