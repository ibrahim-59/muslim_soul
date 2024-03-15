// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widgets/custom_error_widget.dart';
import 'package:quran_app/core/widgets/custom_loading.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_cubit.dart';
import 'package:quran_app/features/quran/presentation/quran_cubit/quran_state.dart';
import 'package:quran_app/features/quran/presentation/widgets/last_read_section.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_appbar.dart';
import 'package:quran_app/features/quran/presentation/widgets/quran_items.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();
    context.read<QuranCubit>().loadQuranData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: quranAppBar(context),
      body: BlocConsumer<QuranCubit, QuranState>(
        builder: (context, state) {
          return state is GetQueanSuccess
              //! success Widget
              ? Column(
                  children: [
                    //! last read section
                    state.lastRedAyah == 0
                        ? const SizedBox.shrink()
                        : LastRedSection(
                            quranModel: state.quranList,
                            lastRedAyah: state.lastRedAyah,
                            lastReadSurah: state.lastReadSurah,
                          ),
                    //! quran list items
                    QuranItems(quranList: state.quranList)
                  ],
                )
              : state is GetQueanFailure
                  //! Error Widget
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage,
                      onPressed: () async {
                        await context.read<QuranCubit>().loadQuranData();
                      })
                  //! loading Widget
                  : const CustomLoading();
        },
        listener: (BuildContext context, QuranState state) {},
      ),
    );
  }
}
