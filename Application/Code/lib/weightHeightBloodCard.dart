import 'package:flutter/material.dart';

import 'custom_card.dart';

class WeightHeightBloodCard extends StatelessWidget {
  const WeightHeightBloodCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: const Color(0xFF2F353E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          details("Profession", "App developer"),
          details("Age", "19"),
          details("Email", "22bcs50200@cuchd.in"),
        ],
      ),
    );
  }

  Widget details(String key, String value) {
    return Flexible(
      flex: 1, // Adjust the flex factor as needed
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure the column takes minimal space
        children: [
          Text(
            key,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
