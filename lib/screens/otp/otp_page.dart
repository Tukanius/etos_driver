// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:etos_driver/api/auth_api.dart';
import 'package:etos_driver/components/controller/listen.dart';
import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/user.dart';
import 'package:etos_driver/provider/user_provider.dart';
import 'package:etos_driver/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class OtpVerifyPageArguments {
  String email;
  OtpVerifyPageArguments({
    required this.email,
  });
}

class OtpVerifyPage extends StatefulWidget {
  static const routeName = 'OtpVerifyPage';
  final String? email;
  const OtpVerifyPage({
    super.key,
    required this.email,
  });

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> with AfterLayoutMixin {
  int _counter = 180;
  bool isGetCode = false;
  bool isSubmit = false;
  late Timer _timer;
  String email = "";
  User user = User();
  ListenController listenController = ListenController();

  @override
  void initState() {
    listenController.addListener(() async {
      await Provider.of<UserProvider>(context, listen: false)
          .getOtp(widget.email!);
    });
    super.initState();
  }

  @override
  afterFirstLayout(BuildContext context) async {
    _startTimer();
    setState(() {
      email = widget.email!;
    });
    user = await Provider.of<UserProvider>(context, listen: false).getOtp(
      widget.email!,
    );
  }

  String intToTimeLeft(int value) {
    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);
    String seconds = s.toString().padLeft(2, '0');
    return "$m:$seconds";
  }

  checkOpt(value) async {
    user.otpCode = value;
    await AuthApi().otpVerify(user);
    showSuccess(context);
    await Navigator.of(context).pushNamed(LoginPage.routeName);
  }

  void _startTimer() async {
    if (isSubmit == true) {
      setState(() {
        isGetCode = false;
      });
      _counter = 180;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          setState(() {
            isGetCode = true;
          });
          _timer.cancel();
        }
      });
    } else {
      setState(() {
        isGetCode = false;
      });
      _counter = 180;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          setState(() {
            isGetCode = true;
          });
          _timer.cancel();
        }
      });
    }
  }

  showSuccess(ctx) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 75),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Амжилттай',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Бүртгэлт амжилттай.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    ButtonBar(
                      buttonMinWidth: 100,
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Text(
                            "Буцах",
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
              Lottie.asset('assets/lottie/success.json',
                  height: 150, repeat: false),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
        fontSize: 20,
        color: black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
    var text = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Таны ', style: TextStyle(color: black)),
          TextSpan(
            text: email,
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
              text: ' И-мэйл рүү явуулсан 6 оронтой тоог оруулна уу.',
              style: TextStyle(color: black)),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
              UserProvider().logout();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: black,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Баталгаажуулалт",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Column(
                children: [
                  text,
                  const SizedBox(
                    height: 20,
                  ),
                  if (isGetCode == false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Дахин код авах ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: black,
                          ),
                        ),
                        Text(
                          '0${intToTimeLeft(_counter)} ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: black,
                          ),
                        ),
                        Text(
                          'секунд',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: black,
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              isSubmit = true;
                            });
                            _startTimer();
                            await Provider.of<UserProvider>(context,
                                    listen: false)
                                .getOtp(widget.email!);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.refresh,
                                color: black,
                              ),
                              Text(
                                "Код дахин авах",
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Pinput(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (value) => checkOpt(value),
                      validator: (value) {
                        return value == "${user.otpCode}"
                            ? null
                            : "Буруу байна";
                      },
                      length: 6,
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      defaultPinTheme: defaultPinTheme,
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: white,
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
