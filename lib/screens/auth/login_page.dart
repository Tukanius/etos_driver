import 'package:etos_driver/components/ui/button.dart';
import 'package:etos_driver/components/ui/form_text_field.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/user.dart';
import 'package:etos_driver/provider/user_provider.dart';
import 'package:etos_driver/screens/auth/register_page.dart';
import 'package:etos_driver/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "LoginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User();
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();
  bool isVisible = true;
  bool isLoading = false;
  bool saveIsUsername = true;
  String imageIcon = "assets/images/set.png";

  onSubmit() async {
    if (fbkey.currentState!.saveAndValidate()) {
      try {
        setState(() {
          isLoading = true;
        });
        User save = User.fromJson(fbkey.currentState!.value);
        if (saveIsUsername == true) {
          UserProvider().setUsername(save.email.toString());
        } else {
          UserProvider().setUsername("");
        }
        await Provider.of<UserProvider>(context, listen: false).login(save);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(SplashPage.routeName);
      } catch (e) {
        debugPrint(e.toString());
        // ignore: use_build_context_synchronously
        // showError(context);

        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // showError(ctx) async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         alignment: Alignment.center,
  //         margin: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Stack(
  //           alignment: Alignment.topCenter,
  //           children: <Widget>[
  //             Container(
  //               margin: const EdgeInsets.only(top: 75),
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(12),
  //               ),
  //               padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Text(
  //                     'Амжилтгүй',
  //                     style: TextStyle(
  //                       color: black,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 24,
  //                       decoration: TextDecoration.none,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 16,
  //                   ),
  //                   Text(
  //                     'И-мэйл эсвэл нууц үг буруу байна?',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                       color: black,
  //                       fontSize: 16,
  //                       decoration: TextDecoration.none,
  //                     ),
  //                   ),
  //                   ButtonBar(
  //                     buttonMinWidth: 100,
  //                     alignment: MainAxisAlignment.spaceEvenly,
  //                     children: <Widget>[
  //                       TextButton(
  //                         style: ButtonStyle(
  //                           overlayColor:
  //                               MaterialStateProperty.all(Colors.transparent),
  //                         ),
  //                         child: Text(
  //                           "Буцах",
  //                           style: TextStyle(color: black),
  //                         ),
  //                         onPressed: () {
  //                           Navigator.of(context).pop();
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Lottie.asset('assets/lottie/error.json',
  //                 height: 150, repeat: false),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: white,
                    border: Border.all(color: hintColor),
                  ),
                  child: Image.asset(
                    imageIcon,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FormBuilder(
                        key: fbkey,
                        child: Column(
                          children: [
                            FormTextField(
                              name: "email",
                              labelText: "И-мэйл",
                              hintText: "И-мэйл",
                              filled: true,
                              fillColor: white,
                              textColor: black,
                              labelColor: black,
                              bgColor: Colors.transparent,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Утасны дугаар оруулна уу.')
                              ]),
                            ),
                            const SizedBox(height: 20),
                            FormTextField(
                              name: "password",
                              labelText: "Нууц үг",
                              hintText: "Нууц үг",
                              filled: true,
                              fillColor: white,
                              textColor: black,
                              labelColor: black,
                              obscureText: isVisible,
                              bgColor: Colors.transparent,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Нууц үгээ оруулна уу.')
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Button(
                    isLoading: isLoading,
                    labelText: "Нэвтрэх",
                    color: colorBlue,
                    onPress: onSubmit,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Бүртгэл үүсгэх бол энд дарна уу",
                      style: TextStyle(
                        color: black,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterPage.routeName);
                      },
                      child: Text(
                        "Бүртгүүлэх",
                        style: TextStyle(color: colorBlue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
