import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/app_assets.dart';

enum AzkarType { morning, evening, mosque, pray, afterPray, sleeping, wakup }

extension MyAzkarType on AzkarType {
  Color? get color => switch (this) {
        AzkarType.morning => const Color(0xff006e87),
        AzkarType.evening => const Color(0xffb34301),
        AzkarType.mosque => const Color(0xff839B00),
        AzkarType.pray => const Color(0xff00796a),
        AzkarType.afterPray => const Color(0xff00828f),
        AzkarType.sleeping => const Color(0xff546f7a),
        AzkarType.wakup => const Color(0xff2970a4),
      };

  String? get image => switch (this) {
        AzkarType.morning => Assets.assetsAzkariconsMorning,
        AzkarType.evening => Assets.assetsAzkariconsEvening,
        AzkarType.mosque => Assets.assetsAzkariconsMosque,
        AzkarType.pray => Assets.assetsAzkariconsAzkarpray,
        AzkarType.afterPray => Assets.assetsAzkariconsAfterPray,
        AzkarType.sleeping => Assets.assetsAzkariconsSleeping,
        AzkarType.wakup => Assets.assetsAzkariconsWakeup,
      };

  String? get title => switch (this) {
        AzkarType.morning => Assets.assetsAzkariconsMorning,
        AzkarType.evening => Assets.assetsAzkariconsEvening,
        AzkarType.mosque => Assets.assetsAzkariconsMosque,
        AzkarType.pray => Assets.assetsAzkariconsPray,
        AzkarType.afterPray => Assets.assetsAzkariconsAfterPray,
        AzkarType.sleeping => Assets.assetsAzkariconsSleeping,
        AzkarType.wakup => Assets.assetsAzkariconsWakeup,
      };
}
