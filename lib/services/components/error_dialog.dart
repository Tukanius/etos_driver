import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/services/dialog.dart';
import 'package:etos_driver/services/dialog_manager/dialog_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorDialog {
  final BuildContext? context;
  final DialogService? dialogService;
  final Duration duration = const Duration(seconds: 10);

  ErrorDialog({this.context, this.dialogService});

  void show(String message) {
    final currentContext = context;
    showDialog(
      context: currentContext!,
      barrierDismissible: true,
      builder: (context) {
        Future.delayed(duration, () {
          dialogService!.dialogComplete();
          // ignore: unnecessary_null_comparison
          if (currentContext != null &&
              Navigator.of(currentContext, rootNavigator: true).canPop()) {
            Navigator.of(currentContext).pop(true);
          }
        });
        return DialogWrapper(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 75),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding:
                        const EdgeInsets.only(top: 90, left: 20, right: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Амжилтгүй',
                          style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: black),
                        ),
                        ButtonBar(
                          buttonMinWidth: 100,
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              child: Text(
                                "Ок",
                                style: TextStyle(color: black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
              Lottie.asset('assets/lottie/error.json',
                  height: 150, repeat: false)
            ],
          ),
        );
      },
    );
  }
}
