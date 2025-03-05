abstract class LocalStorage {
  // secure storage
  // keys
  // final String accessToken = "accessToken";
  final String cookie = "cookie";
  // final String refreshToken = "refreshToken";

  final String userData = "userData";
  final String userRole = "userRole";
  final String userId = "userId";
  final String rememberMe = "rememberMe";

  Future<void> setSecureData(String key, String value);
  Future<String?> getSecureData(String key);
  Future<void> removeSecureData(String key);

  // // hive storage

  // final userresource = "user_resource";

  // final phoneData = "remember_me";
  // final language = "language";
  // final deviceConfig = "deviceConfig";
  // final appVersion = "appVersion";

  // final dynamicBaseUrl = "";
  // final address = "address";
  // final billingAddress = "billingAddress";

  // String onboard = "onboard";
  // String badge = "badge";

  // Future<void> setData(String key, String value);
  // Future<String?> getData(String key);
  // Future<void> removeData(String key);

  // Future<void> setDataByIntegerType(String key, int value);
  // Future<int?> getDataInt(String key);
  // Future<void> removeDataInt(String key);

  // setAccessToken(String value);
  // getAccessToken();
  // removeAccessToken();
  // setRefreshToken(String value);
  // getRefreshToken();
  // removeRefreshToken();
  // setUser(UserModel user);
  // removeUser();
  // setUserRole(String role);
  // removeUserRole();
  // setUserId(String userId);
  // getUserId();
  // removeUserId();
}