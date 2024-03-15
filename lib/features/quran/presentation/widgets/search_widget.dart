import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.ondelete,
  });

  final TextEditingController searchController;
  final void Function(String) onChanged;
  final void Function() ondelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
            child: Icon(IconlyLight.arrow_right_2,
                size: 26, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: searchController,
              style: Theme.of(context).textTheme.titleMedium,
              autofocus: false,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              onEditingComplete: () async {},
              onChanged: onChanged,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: "اسم السورة",
                hintStyle: Theme.of(context).textTheme.titleMedium,
                filled: true,
                fillColor: Theme.of(context).cardColor,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.transparent)),
                suffixIcon: searchController.text == ""
                    ? Icon(IconlyLight.search,
                        color: Theme.of(context).primaryColor, size: 24)
                    : GestureDetector(
                        onTap: ondelete,
                        child: Icon(Icons.highlight_remove_rounded,
                            color: Theme.of(context).primaryColor, size: 24),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
