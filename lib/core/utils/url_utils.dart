import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// all luncher methods
// note: do not recreate any luncher method in other file
class UrlLauncherUtils {
  static launchFile(File file) async {
    String filePath = file.absolute.path;
    final Uri uri = Uri.file(filePath);

    if (!File(uri.path).existsSync()) {
      throw Exception('$uri does not exist!');
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $uri';
    }
  }

  static launchEmail(String email) async {
    String tempEmail = Uri.encodeComponent(email);
    Uri mail = Uri.parse("mailto:$tempEmail");
    if (await launchUrl(mail)) {
      debugPrint("email app opened");
    } else {
      debugPrint("email app is not opened");
    }
  }

  static launchPhone(String phoneNumber) async {
    Uri phone = Uri.parse("tel:$phoneNumber");

    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    } else {
      debugPrint("contact app is not opened");
    }
  }

  static launchCustomUrl(String url) async {
    String tempUrl = url;
    if (!url.contains("https://")) {
      tempUrl = "https://$url";
    }
    Uri urlValue = Uri.parse(tempUrl);
    await launchUrl(
      urlValue,
    );
    if (await canLaunchUrl(
      urlValue,
    )) {
    } else {
      debugPrint("contact app is not opened");
    }
  }

  static launchMaps(double lat, double lon) async {
    debugPrint(lat.toString());
    debugPrint(lon.toString());

    // if (Platform.isAndroid) {
    //   _launchMapsAndroid(lat, lon);
    // } else if (Platform.isIOS) {
    //   _launchMapsIos(lat, lon);
    // }

    Uri googleUrl =

        // `https://www.google.com/maps?q=${lat},${lng}`
        Uri.parse("https://www.google.com/maps?q=$lat,$lon");
    await launchUrl(googleUrl);
    // Uri googleUrl =

    //     // `https://www.google.com/maps?q=${lat},${lng}`
    //     Uri.parse("www.google.navigation/maps?q=$lat,$lon");

    // if (await canLaunchUrl(Uri.parse("comgooglemaps://"))) {
    //   print('launching com googleUrl');
    //   await launchUrl(googleUrl);
    // } else {
    //   throw 'Could not launch url';
    // }
  }

  static lunchViber(String phoneNumber) async {
    String viberUrl = "viber://add?number=$phoneNumber";
    Uri urlValue = Uri.parse(viberUrl);
    await launchUrl(
      urlValue,
    );
    if (await canLaunchUrl(
      urlValue,
    )) {
    } else {
      debugPrint("contact app is not opened");
    }
  }

  static lunchWhatApp(String phoneNumber) async {
    String viberChatUrl = "https://wa.me/$phoneNumber";
    Uri urlValue = Uri.parse(viberChatUrl);
    await launchUrl(
      urlValue,
    );
    if (await canLaunchUrl(
      urlValue,
    )) {
    } else {
      debugPrint("contact app is not opened");
    }
  }
}