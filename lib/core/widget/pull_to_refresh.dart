import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefresh extends StatefulWidget {
  final Widget child;

  final Duration delayDuration;

  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoading;
  final RefreshController refreshController;

  const PullToRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
    this.delayDuration = const Duration(seconds: 1),
    this.onLoading,
    required this.refreshController,
  });

  @override
  State<PullToRefresh> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PullToRefresh> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
      controller: widget.refreshController,
      enablePullDown: true,
      enablePullUp: widget.onLoading == null ? false : true,
      onRefresh: widget.onRefresh,
      footer: CustomFooter(builder: (context, mode) {
        Widget body;

        if (mode == LoadStatus.idle) {
          body = SizedBox();
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("Load Failed!Click retry!");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("release to load.....");
        } else {
          body = SizedBox();
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      }),
      onLoading: widget.onLoading,
      child: widget.child,
    ));
  }
}
