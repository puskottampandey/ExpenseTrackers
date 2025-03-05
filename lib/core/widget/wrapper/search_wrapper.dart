import 'dart:async';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:expensetracker/core/widget/button/custom_icon_button.dart';
import 'package:expensetracker/core/widget/text_field/custom_search_field.dart';
import 'package:expensetracker/core/wrapper/horizontal_padding_wrapper.dart';
import 'package:expensetracker/generated/l10n.dart';

class SearchWrapper extends StatefulWidget {
  final Widget child;
  final Widget? header;
  final bool hasAddButton;
  final Function(String searchSlug) searchCallBack;
  final VoidCallback? addCallBack;
  const SearchWrapper({
    super.key,
    required this.child,
    this.hasAddButton = true,
    required this.searchCallBack,
    this.addCallBack,
    this.header,
  });

  @override
  State<SearchWrapper> createState() => _SearchWrapperState();
}

class _SearchWrapperState extends State<SearchWrapper> {
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
    return Column(
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
        widget.child,
      ],
    );
  }
}
