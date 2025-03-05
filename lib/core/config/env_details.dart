enum AppEnvironment {
  dev,
  stage,
  prod,
}

class EnvDetails {
  final AppEnvironment appEnvironment;
  final String appTitle;
  final String versionName;
  final String appUpdateDate;
  final String appleStoreId;
  final String appBundleId;
  // final String googlePackageName;
  // final String googlePlayStore;
  // final String appleAppStore;
  // final String appLink;
  final String appHomeTitle;
  final String appHomeSubTitle;
  final String appIcon;

  EnvDetails({
    required this.appTitle,
    required this.versionName,
    required this.appUpdateDate,
    required this.appleStoreId,
    required this.appBundleId,
    // required this.googlePackageName,
    // required this.googlePlayStore,
    // required this.appLink,
    // required this.appleAppStore,
    required this.appEnvironment,
    required this.appHomeTitle,
    required this.appHomeSubTitle,
    required this.appIcon,
  });

  factory EnvDetails.dev() {
    return EnvDetails(
      appTitle: "Expense [DEV]",
      versionName: "v.1.0.0",
      appUpdateDate: "last updated at: 12th March, 2024",
      appleStoreId: "",
      appBundleId: "",
      appEnvironment: AppEnvironment.dev,
      appHomeTitle: "",
      appHomeSubTitle: "",
      appIcon: "",
    );
  }

  factory EnvDetails.stage() {
    return EnvDetails(
        appTitle: "Expense  [STAGE]",
        versionName: "v.1.0.0",
        appUpdateDate: "last updated at: 12th March, 2024",
        appleStoreId: "",
        appBundleId: "",
        appEnvironment: AppEnvironment.stage,
        appHomeTitle: "",
        appHomeSubTitle: "",
        appIcon: "");
  }

  factory EnvDetails.prod() {
    return EnvDetails(
        appTitle: "Expense",
        versionName: "v.1.0.0",
        appUpdateDate: "last updated at: 16th April, 2024",
        appleStoreId: "",
        appBundleId: "",
        appEnvironment: AppEnvironment.prod,
        appHomeTitle: "",
        appHomeSubTitle: "",
        appIcon: "");
  }
}
       // googlePackageName: "com.informationcare.hrms",
        // googlePlayStore:
        //     "https://play.google.com/store/apps/details?id=com.infocare.connectkishan",
        // appleAppStore: "https://apps.apple.com/app/___/id__",
        // appLink: Platform.isAndroid
        //     ? "https://play.google.com/store/apps/details?id=com.cliffbyte.krishi_hub"
        //     : "https://apps.apple.com/app/connect-kishan/id6479684975",