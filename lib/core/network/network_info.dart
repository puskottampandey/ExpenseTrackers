import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetWorkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetWorkInfo {
  final InternetConnection internetConnection;

  NetWorkInfoImpl(this.internetConnection);

  @override
  Future<bool> get isConnected => internetConnection.hasInternetAccess;
}
