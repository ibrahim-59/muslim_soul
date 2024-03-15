class EndPoint {
  static String baseUrl = "http://api.aladhan.com/v1/timings";
  static String getPrayerTimeEndPoint(
      DateTime dateTime, double latitude, double longitude) {
    return "$baseUrl/${dateTime.day}-${dateTime.month}-${dateTime.year}?latitude=$latitude&longitude=$longitude";
  }
}

class ApiKey {
  static String status = "status";
  static String code = "code";
  static String errorMessage = "ErrorMessage";
  static String name = "name";
  static String phone = "phone";
  static String location = "location";
  static String profilePic = "profilePic";
  static String email = "email";
  static String password = "password";
  static String confirmPassword = "confirmPassword";
  static String message = "message";
  static String token = "token";
  static String id = "id";
}
