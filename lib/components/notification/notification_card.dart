import 'package:etos_driver/contants/colors.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Row(
        children: [
          Icon(
            Icons.notifications,
            color: black,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Орох 1-р пүүн дээр очих",
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Таны 8888УНА дугаартай тээврийн хэрэгсэл хүлээгдэж байна.',
                  style: TextStyle(
                    color: black,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
