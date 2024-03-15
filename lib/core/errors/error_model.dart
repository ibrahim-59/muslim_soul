import '../api/end_ponits.dart';

class ErrorModel {
  final String status;
  final String errorMessage;
  final int code;

  ErrorModel(
      {required this.code, required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
      code: jsonData[ApiKey.code],
    );
  }
}
