import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_import.dart';


class CommonExpandableWidget extends StatefulWidget {
  final Widget header;
  final Widget body;
  final bool? isExpanded;

  final Color? bgColor;

  final int? index;

  final VoidCallback? onChange;

  const CommonExpandableWidget(
      {super.key,
      required this.body,
      this.bgColor,
      this.isExpanded,
      required this.header,
      this.onChange,
      this.index});

  @override
  State<CommonExpandableWidget> createState() =>
      _ExpandableServiceWidgetState();
}

class _ExpandableServiceWidgetState extends State<CommonExpandableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget.isExpanded != null) {
      _isExpanded = widget.isExpanded!;

      _controller.forward();
    }

    if (widget.index == 0) {
      setState(() {
        _isExpanded = !_isExpanded;
        if (_isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse();
        }

        widget.onChange;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: ,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration:
            BoxDecoration(border: Border.all(color: CustomColors.lightGray)),
        // color: widget.bgColor ?? CustomColors.lightGray,
        child: Column(
          children: <Widget>[
            InkWell(
              radius: 10,
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                  if (_isExpanded) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }

                  widget.onChange;
                });
              },
              child: Container(
                // color: Colors.red,
                color: widget.bgColor ?? CustomColors.lightGray,
                // margin: const EdgeInsets.all(3),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [widget.header],
                      ),
                    ),
                    RotationTransition(
                        turns:
                            Tween(begin: 0.0, end: -0.5).animate(_controller),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: CustomColors.grey,
                          size: 28,
                        )),
                  ],
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _controller,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: widget.body,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CommonExpandableWidgetWithIndex extends StatefulWidget {
  final Widget header;
  final Widget body;

  final bool isSelected;

  final Color? bgColor;

  final Function() onChange;

  const CommonExpandableWidgetWithIndex({
    super.key,
    required this.body,
    this.bgColor,
    required this.header,
    required this.onChange,
    required this.isSelected,
  });

  @override
  State<CommonExpandableWidgetWithIndex> createState() =>
      _CommonExpandableWidgetWithIndexState();
}

class _CommonExpandableWidgetWithIndexState
    extends State<CommonExpandableWidgetWithIndex>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    check();

    super.initState();
  }

  check() async {
    if (widget.isSelected) {
      _controller.forward();
    }

    if (!widget.isSelected) {
      if (_controller.status == AnimationStatus.forward) {
        _controller.reverse();
      }
    } else {
      await Future.delayed(const Duration(seconds: 3)).whenComplete(() {
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: widget.bgColor ?? CustomColors.white,
        child: Column(
          children: <Widget>[
            InkWell(
              radius: 10,
              onTap: widget.onChange,
              child: Container(
                margin: const EdgeInsets.all(3),
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [widget.header],
                      ),
                    ),
                    RotationTransition(
                      turns: Tween(begin: 0.0, end: -0.5).animate(_controller),
                      child: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: CustomColors.grey,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _controller,
              child: widget.body,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
