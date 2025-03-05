import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingOverlay extends StatefulWidget {
  final bool isLoading;
  final double opacity;
  final Color? color;
  final Widget progressIndicator;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.opacity = 0.5,
    this.progressIndicator = const AppLoader(),
    this.color,
  });

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool? _overlayVisible;

  _LoadingOverlayState();

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      status == AnimationStatus.forward
          ? setState(() => _overlayVisible = true)
          : null;
      status == AnimationStatus.dismissed
          ? setState(() => _overlayVisible = false)
          : () {};
    });
    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(LoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    final customColors = theme.extension<CustomThemeExtension>()!;
    var widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = AbsorbPointer(
        absorbing: true,
        child: FadeTransition(
          opacity: _animation,
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: widget.opacity,
                child: ModalBarrier(
                  dismissible: true,
                  color: widget.color ?? _isLightMode
                      ? CustomColors.lightGray
                      : CustomColors.darkGrey,
                ),
              ),
              Center(child: widget.progressIndicator),
            ],
          ),
        ),
      );
      widgets.add(modal);
    }

    return Scaffold(body: Stack(children: widgets));
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return Stack(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              boxShadow: [],
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                    color: theme.colorScheme.primary,
                    strokeWidth: 2,
                    backgroundColor: CustomColors.lightGray,
                    strokeAlign: 10,
                    strokeCap: StrokeCap.round),
              ],
            ),
          ),
        ),
        Center(
          child: Image.asset(
            "",
            width: 24.h,
            height: 24.h,
          ),
        )
      ],
    );
  }
}
