import 'package:flutter_app_badge_control/flutter_app_badge_control.dart';

class BadgeUtils {
  static clearBadge() async {
    final isAppBadgeSupport =
        await FlutterAppBadgeControl.isAppBadgeSupported();

    await FlutterAppBadgeControl.removeBadge();
  }
}
