import 'package:after_layout/after_layout.dart';
import 'package:etos_driver/api/auth_api.dart';
import 'package:etos_driver/components/ui/button.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/user.dart';
import 'package:etos_driver/provider/user_provider.dart';
import 'package:etos_driver/screens/notification/notification_page.dart';
import 'package:etos_driver/screens/profile/profile_detail_page.dart';
import 'package:etos_driver/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = 'ProfilePage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AfterLayoutMixin {
  bool isLoading = true;
  User user = User();
  @override
  afterFirstLayout(BuildContext context) async {
    // user = await AuthApi().me(true);
    setState(() {
      isLoading = false;
    });
  }

  logout() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<UserProvider>(context, listen: false).logout();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(SplashPage.routeName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Хэрэглэгчийн хэсэг',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(NotificationPage.routeName);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.notifications,
                  color: black,
                ),
              ),
            ),
          ],
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: black,
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: white,
                          child: Icon(
                            Icons.person,
                            color: black,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Нэр',
                          style: TextStyle(color: black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Утас:',
                          style: TextStyle(color: black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProfileDetailpage.routeName,
                              arguments: ProfileDetailpageArguments(user: user),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: black,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Миний мэдээлэл",
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: black,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () {
                        //     // Navigator.of(context).pushNamed(ProfileDetailpage.routeName);
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(top: 15),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: white,
                        //     ),
                        //     padding: const EdgeInsets.all(12),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Icon(
                        //               Icons.settings,
                        //               color: black,
                        //             ),
                        //             const SizedBox(
                        //               width: 15,
                        //             ),
                        //             Text(
                        //               "Тохиргоо",
                        //               style: TextStyle(
                        //                 color: black,
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w500,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Icon(
                        //           Icons.arrow_forward_ios_rounded,
                        //           color: black,
                        //           size: 18,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     // Navigator.of(context).pushNamed(ProfileDetailpage.routeName);
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(top: 15),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: white,
                        //     ),
                        //     padding: const EdgeInsets.all(12),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //               'assets/svg/faq.svg',
                        //               height: 24,
                        //               width: 24,
                        //               // ignore: deprecated_member_use
                        //               color: black,
                        //             ),
                        //             const SizedBox(
                        //               width: 15,
                        //             ),
                        //             Text(
                        //               "Тусламж",
                        //               style: TextStyle(
                        //                 color: black,
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w500,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         Icon(
                        //           Icons.arrow_forward_ios_rounded,
                        //           color: black,
                        //           size: 18,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Button(
                        isLoading: isLoading,
                        color: colorRed,
                        labelColor: colorRed,
                        onPress: () {
                          logout();
                        },
                        labelText: 'Гарах',
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
