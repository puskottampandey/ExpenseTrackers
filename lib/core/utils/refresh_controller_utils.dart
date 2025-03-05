import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshControllerUtils {
  static void loadingCompleted(RefreshController refreshController) {
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }
}
