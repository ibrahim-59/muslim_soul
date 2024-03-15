import 'package:quran_app/core/utils/app_strings.dart';

enum SizeType { max, min, med }

extension MySize on SizeType {
  String? get title => switch (this) {
        SizeType.min => AppStrings.min,
        SizeType.max => AppStrings.max,
        SizeType.med => AppStrings.med,
      };
}
