import 'package:quran_app/core/utils/app_strings.dart';

enum AdayaType {
  ad3yaQranya,
  ad3yaAlrezq,
  ad3yaAl3elm,
  ad3yaAlMtwafy,
  ad3yaNabwaya,
  ad3yaAltwba,
  ad3yaZehabAlham,
  ad3eyaKhatmAlQuran,
}

extension MyDoaaType on AdayaType {
  String? get title => switch (this) {
        AdayaType.ad3yaQranya => AppStrings.ad3yaQranya,
        AdayaType.ad3yaAlrezq => AppStrings.ad3yaAlrezq,
        AdayaType.ad3yaAl3elm => AppStrings.ad3yaAl3elm,
        AdayaType.ad3yaAlMtwafy => AppStrings.ad3yaAlMtwafy,
        AdayaType.ad3yaNabwaya => AppStrings.ad3yaNabwaya,
        AdayaType.ad3yaAltwba => AppStrings.ad3yaAltwba,
        AdayaType.ad3yaZehabAlham => AppStrings.ad3yaZehabAlham,
        AdayaType.ad3eyaKhatmAlQuran => AppStrings.ad3eyaKhatmAlQuran,
      };
}
