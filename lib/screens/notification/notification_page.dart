import 'package:etos_driver/components/icons/back_icon.dart';
import 'package:etos_driver/components/notification/notification_card.dart';
import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = 'NotificationPage';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Мэдэгдэл',
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                children: ["", "", ""]
                    .map((e) => const Column(
                          children: [
                            NotificationCard(),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
