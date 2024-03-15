import 'package:quran_app/core/utils/app_strings.dart';

enum RmadanType { advices, health, ahkam, waysToFinishQuran, ad3ya }

extension MyRamadanType on RmadanType {
  String? get title => switch (this) {
        RmadanType.advices => AppStrings.ramadanAdvices,
        RmadanType.health => AppStrings.ramadanHealth,
        RmadanType.ahkam => AppStrings.ramadanAhkam,
        RmadanType.waysToFinishQuran => AppStrings.ramadanWays,
        RmadanType.ad3ya => AppStrings.ramadanAd3ya,
      };
}
