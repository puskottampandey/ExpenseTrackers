import 'dart:async';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/utils/text_utils.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/button/custom_icon_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_search_field.dart';
import 'package:expensetracker/core/wrapper/horizontal_padding_wrapper.dart';
import 'package:expensetracker/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchContentWidget extends StatefulWidget {
  final Widget? header;
  final bool hasAddButton;
  final Function(String searchSlug) searchCallBack;
  final VoidCallback? addCallBack;
  const SearchContentWidget({
    super.key,
    this.hasAddButton = true,
    required this.searchCallBack,
    this.addCallBack,
    this.header,
  });

  @override
  State<SearchContentWidget> createState() => _SearchContentWidgetState();
}

class _SearchContentWidgetState extends State<SearchContentWidget> {
  ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();
  Timer? timer;
  _search(value) {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }

    timer = Timer(const Duration(milliseconds: 500), () {
      widget.searchCallBack(value);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          if (widget.header != null) widget.header!,
          PaddingWrapper(
            verticalPadding: 5.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomSearchField(
                    hintText: "Search",
                    controller: searchController,
                    onTapSuffixButton: () {
                      searchController.clear();
                      _search("");
                    },
                    onChanged: (value) {
                      _search(value);
                    },
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        FocusScope.of(context).unfocus();
                        _search(value);
                      }
                    },
                  ),
                ),
                widget.hasAddButton
                    ? CustomIconButton(
                        verticalPadding: 0,
                        containerInnerPadding: 12,
                        gradientPrimaryColor: _isLightMode
                            ? theme.primaryColor
                            : CustomColors.lightGray,
                        gradientSecondaryColor: theme.colorScheme.secondary,
                        icon: Icons.add,
                        iconColor: theme.colorScheme.surface,
                        onPressed: widget.addCallBack,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
