import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_int.dart';
import 'package:quran_app/core/utils/app_strings.dart';

enum PrayerType { fajr, sunrise, asr, zhr, majrib, isha }

extension MyPrayerType on PrayerType {
  // Color? get color => switch (this) {
  //       AzkarType.morning => const Color(0xff006e87),
  //       AzkarType.evening => const Color(0xffb34301),
  //       AzkarType.mosque => const Color(0xff839B00),
  //       AzkarType.pray => const Color(0xff00796a),
  //       AzkarType.afterPray => const Color(0xff00828f),
  //       AzkarType.sleeping => const Color(0xff546f7a),
  //       AzkarType.wakup => const Color(0xff2970a4),
  //     };

  String? get image => switch (this) {
        PrayerType.fajr => Assets.assetsPrayertimesSubuh,
        PrayerType.sunrise => Assets.assetsPrayertimesSunset,
        PrayerType.asr => Assets.assetsPrayertimesAsr,
        PrayerType.zhr => Assets.assetsPrayertimesZhur,
        PrayerType.majrib => Assets.assetsPrayertimesMagrib,
        PrayerType.isha => Assets.assetsPrayertimesIsyah,
      };

  String? get title => switch (this) {
        PrayerType.fajr => AppStrings.fajr,
        PrayerType.sunrise => AppStrings.sunRise,
        PrayerType.asr => AppStrings.asr,
        PrayerType.zhr => AppStrings.zhr,
        PrayerType.majrib => AppStrings.majrib,
        PrayerType.isha => AppStrings.isha,
      };
  String? get cachedKey => switch (this) {
        PrayerType.fajr => AppStrings.fajrkey,
        PrayerType.sunrise => AppStrings.sunRisekey,
        PrayerType.asr => AppStrings.asrkey,
        PrayerType.zhr => AppStrings.zhrkey,
        PrayerType.majrib => AppStrings.majribkey,
        PrayerType.isha => AppStrings.ishakey,
      };
  int? get prayerId => switch (this) {
        PrayerType.fajr => AppIntegers.fajrId,
        PrayerType.sunrise => AppIntegers.sunRiseId,
        PrayerType.asr => AppIntegers.asrId,
        PrayerType.zhr => AppIntegers.zhrID,
        PrayerType.majrib => AppIntegers.magribId,
        PrayerType.isha => AppIntegers.ishaId,
      };
}
