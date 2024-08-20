import 'package:after_layout/after_layout.dart';
import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/models/user.dart';
import 'package:flutter/material.dart';

class ProfileDetailpageArguments {
  User user;
  ProfileDetailpageArguments({
    required this.user,
  });
}

class ProfileDetailpage extends StatefulWidget {
  static const routeName = "ProfileDetailpage";
  final User user;
  const ProfileDetailpage({
    required this.user,
    super.key,
  });

  @override
  State<ProfileDetailpage> createState() => _ProfileDetailpageState();
}

class _ProfileDetailpageState extends State<ProfileDetailpage>
    with AfterLayoutMixin {
  bool isLoading = true;
  User user = User();
  @override
  afterFirstLayout(BuildContext context) async {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Миний мэдээлэл',
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ActionButton(
            onClick: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: black,
              size: 20,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: black,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Овог',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Овог',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Нэр',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Нэр',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Регистр',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Регистр',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Утасны дугаар',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Утасны дугаар',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Жолоочын үнэмлэх (PDL)',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                '12345',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'Машины улсын дугаар',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                '9988ӨӨӨ',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'И-мэйл',
                            style: TextStyle(color: black),
                          ),
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                '${widget.user.email}',
                                style: TextStyle(color: black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
