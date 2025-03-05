import 'package:flutter/cupertino.dart';

class NavigationService {
  //singleton method;

  static final NavigationService _navigationService =
      NavigationService._internal();

  factory NavigationService() => _navigationService;

  NavigationService._internal();

  //navigation key
  static GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  // static init(GlobalKey<NavigatorState> navKey) {
  //   _navigatorKey = navKey;
  // }

  static get navigationKey => _navigatorKey;

  // navigation push named
  // static Future<dynamic> pushNamed({required String routeName, Object? args}) {
  //   return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  // }

  // navigation push named
  static Future<dynamic> pushNamed({required String routeName, Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  //navigation push name replacement
  // static Future<dynamic> pushNamedReplacement(
  //     {required String routeName, Object? args}) {
  //   return _navigatorKey.currentState!
  //       .pushReplacementNamed(routeName, arguments: args);
  // }

  // // navigation push name replacement

  // static Future<dynamic> pushReplacement(
  //     {String routeName = "", required Widget target, Object? args}) {
  //   return _navigatorKey.currentState!.pushReplacement(PageTransition(
  //       child: target,
  //       type: PageTransitionType.rightToLeft,
  //       duration: const Duration(milliseconds: 300),
  //       settings: RouteSettings(name: routeName, arguments: args)));
  // }

  // //navigate push

  // static Future<dynamic> push(
  //     {String routeName = "",
  //     required Widget target,
  //     Object? args,
  //     PageTransitionType? pageTransitionType}) {
  //   return _navigatorKey.currentState!.push(PageTransition(
  //       duration: const Duration(milliseconds: 300),
  //       child: target,
  //       type: pageTransitionType ?? PageTransitionType.rightToLeft,
  //       settings: RouteSettings(name: routeName, arguments: args)));
  // }

  // //Navigate Push Until

  // static Future<dynamic> pushUntil(
  //     {String routeName = '', required Widget target, Object? args}) {
  //   return _navigatorKey.currentState!.pushAndRemoveUntil(
  //     PageTransition(
  //       child: target,
  //       duration: const Duration(milliseconds: 300),
  //       type: PageTransitionType.leftToRight,
  //       settings: RouteSettings(name: routeName, arguments: args),
  //     ),
  //     (Route<dynamic> route) => false,
  //   );
  // }

  // //Pop Function
  // static void pop() {
  //   if (_navigatorKey.currentState!.canPop()) {
  //     _navigatorKey.currentState!.pop();
  //   }
  // }

  // //Pop Until Function
  // static void popUntil({required String routeName}) {
  //   return _navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  // }

  // //Pop Until Function
  // static void popUntilCheckRoute(
  //     {required String routeName, String? optionNameRouteName}) {
  //   //  return _navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  //   return _navigatorKey.currentState!.popUntil((route) {
  //     if (route.settings.name == routeName) {
  //       return true;
  //     } else if (route.settings.name == optionNameRouteName) {
  //       return true;
  //     }
  //     return false;
  //   });
  // }

  // //Pop Until FirstPage Function
  // static void popUntilFirstPage() {
  //   return _navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }

  // static void pushNamedAndRemoveUntil(
  //     {required String routeName, Object? args}) {
  //   _navigatorKey.currentState!.pushNamedAndRemoveUntil(
  //     routeName,
  //     (Route<dynamic> route) => false,
  //     arguments: args,
  //   );
  // }

  static navigate(context, route) {
    context.go(route);
  }

  static BuildContext get context => _navigatorKey.currentState!.context;
}
