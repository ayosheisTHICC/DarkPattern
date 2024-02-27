import 'package:flutter/material.dart';

import 'const.dart';
import 'responsive.dart';
import 'scheduled.dart';
import 'weightHeightBloodCard.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
        topLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: cardBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/avatar.jpg",
                    width: 120, // Adjust image size as needed
                    height: 120, // Adjust image size as needed
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Karan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Edit Your details",
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Responsive.isMobile(context) ? 15 : 20.0),
                  child: const WeightHeightBloodCard(),
                ),
                SizedBox(
                  height: Responsive.isMobile(context) ? 20 : 40,
                ),
                Scheduled()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
