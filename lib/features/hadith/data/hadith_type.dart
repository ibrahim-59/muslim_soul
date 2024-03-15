import 'package:quran_app/core/utils/app_strings.dart';

enum HaditType { arboon, muslim, bukhari }

extension MyHadithType on HaditType {
  String? get title => switch (this) {
        HaditType.arboon => AppStrings.arb3on,
        HaditType.muslim => AppStrings.muslim,
        HaditType.bukhari => AppStrings.bukhari,
      };
}
