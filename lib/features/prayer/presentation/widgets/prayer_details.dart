import 'package:flutter/material.dart';
import 'package:quran_app/features/prayer/data/models/prayer_model.dart';

class PrayerDetails extends StatelessWidget {
  const PrayerDetails({
    super.key,
    required this.prayerModel,
  });

  final PrayerModel prayerModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            prayerModel.image,
            height: 20,
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              prayerModel.name,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          Text(
            prayerModel.time,
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
