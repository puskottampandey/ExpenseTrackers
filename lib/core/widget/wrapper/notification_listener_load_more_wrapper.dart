// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:starter/core/widget/loader/loading_overlay.dart';

// class NotificationListenerReadMoreWrapper extends StatefulWidget {
//   final bool isLoadMoreActive;
//   final Function() onLoadMore;
//   final ScrollController scrollController;
//   final Widget child;
//   final Future<void> Function()? onRefresh;
//   const NotificationListenerReadMoreWrapper(
//       {super.key,
//       required this.child,
//       required this.isLoadMoreActive,
//       required this.onLoadMore,
//       required this.scrollController,
//       this.onRefresh});

//   @override
//   State<NotificationListenerReadMoreWrapper> createState() =>
//       _NotificationListenerReadMoreWrapperState();
// }

// class _NotificationListenerReadMoreWrapperState
//     extends State<NotificationListenerReadMoreWrapper> {
//   bool _isRefreshing = false;
//   double _pullDownOffset = 0.0;
//   final double _refreshTriggerHeight = 200.0;

//   Future<void> _refresh() async {
//     await Future.delayed(Duration(milliseconds: 300));

//     setState(() {
//       _isRefreshing = false;
//       _pullDownOffset = 0.0;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.scrollController.addListener(_handleScroll);
//   }

//   @override
//   void dispose() {
//     widget.scrollController.removeListener(_handleScroll);
//     super.dispose();
//   }

//   void _handleScroll() async {
//     if (widget.onRefresh != null) {
//       if (widget.scrollController.position.pixels < 0 && !_isRefreshing) {
//         setState(() {
//           _pullDownOffset = -widget.scrollController.position.pixels;
//         });
//         if (_pullDownOffset > _refreshTriggerHeight) {
//           _isRefreshing = true;
//           setState(() {});
//           await Future.delayed(const Duration(milliseconds: 500));
//           _refresh();
//           await widget.onRefresh!();
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollNotification) {
//         if (scrollNotification.metrics.pixels >
//             scrollNotification.metrics.maxScrollExtent / 2) {
//           if (!widget.isLoadMoreActive &&
//               widget.scrollController.position.userScrollDirection ==
//                   ScrollDirection.reverse) {
//             widget.onLoadMore();
//           }
//         }

//         return true;
//       },
//       child: Stack(
//         children: [
//           widget.child,
//           if (_isRefreshing || _pullDownOffset > 0)
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: _isRefreshing
//                     ? _refreshTriggerHeight
//                     : _pullDownOffset.clamp(0, _refreshTriggerHeight),
//                 alignment: Alignment.center,
//                 child: _isRefreshing
//                     ? SizedBox()
//                     : Text(
//                         "Pull to refresh...",
//                         style: TextStyle(color: theme.primaryColor),
//                       ),
//               ),
//             ),
//           if (_isRefreshing)
//             Positioned(
//               // top: 0,
//               // left: 0,
//               // right: 0,
//               child: Center(
//                 child: LoadingOverlay(isLoading: true, child: SizedBox()),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationListenerReadMoreWrapper extends StatelessWidget {
  final bool isLoadMoreActive;
  final Function() onLoadMore;
  final ScrollController scrollController;
  final Widget child;
  const NotificationListenerReadMoreWrapper(
      {super.key,
      required this.child,
      required this.isLoadMoreActive,
      required this.onLoadMore,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels >
            scrollNotification.metrics.maxScrollExtent / 2) {
          if (!isLoadMoreActive &&
              scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse) {
            onLoadMore();
          }
        }
        return true;
      },
      child: child,
    );
  }
}
