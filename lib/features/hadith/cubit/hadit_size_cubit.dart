import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/cache_helper.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/hadith/cubit/hadit_size_state.dart';
import 'package:quran_app/features/hadith/data/hadith_type.dart';
import 'package:quran_app/features/hadith/presentation/cubit/hadith_cubit.dart';

class HaditSizeCubit extends Cubit<HaditSizeState> {
  HaditSizeCubit() : super(HaditSizeInitial());
  String? sizeName;
  late int haditSize;

  init() async {
    await getSize();
    emit(UpdateSize());
  }

  updateSize(bool isPlus, HadithCubit hadithCubit, HaditType haditType) async {
    if ((haditSize == 24) && (isPlus == true)) {
      setSize(26, AppStrings.med);
    } else if ((haditSize == 26) && (isPlus == true)) {
      setSize(28, AppStrings.max);
    } else if ((haditSize == 26) && (isPlus == false)) {
      setSize(24, AppStrings.min);
    } else if ((haditSize == 28) && (isPlus == false)) {
      setSize(26, AppStrings.med);
    }
    await hadithCubit.loadAzkarData(haditType);
    emit(UpdateSize());
  }

  setSize(int hadithSize, String size) async {
    await CacheHelper().saveData(key: AppStrings.hadithSize, value: hadithSize);
    sizeName = size;
    await getSize();
    init();
  }

  getSize() async {
    haditSize = await CacheHelper().getData(key: AppStrings.hadithSize) ?? 26;
    if (haditSize == 28) {
      sizeName = AppStrings.max;
    } else if (haditSize == 26) {
      sizeName = AppStrings.med;
    } else {
      sizeName = AppStrings.min;
    }
    emit(UpdateSize());
  }
}
