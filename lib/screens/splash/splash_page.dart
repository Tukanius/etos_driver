// ignore_for_file: use_build_context_synchronously
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/provider/user_provider.dart';
import 'package:etos_driver/screens/auth/login_page.dart';
import 'package:etos_driver/screens/main_page.dart';
import 'package:flutter/material.dart';
import "package:after_layout/after_layout.dart";
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'SplashPage';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  afterFirstLayout(BuildContext context) async {
    try {
      // await Provider.of<UserProvider>(context, listen: false).me(false);
      await Navigator.of(context).pushNamed(MainPage.routeName);
    } catch (ex) {
      debugPrint(ex.toString());
      await Navigator.of(context).pushNamed(MainPage.routeName);

      await Navigator.of(context).pushNamed(LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          color: black,
        ),
      ),
    );
  }
}
