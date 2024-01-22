import 'package:flutter_dotenv/flutter_dotenv.dart';


class ApiEndPoints{
  static final baseUrl = dotenv.env['API_BASE_URL'];

  static final verify = '$baseUrl/public/api/first-time-login';
  static final savePassword = '$baseUrl/private/api/save-user-passwd';
  static final login = '$baseUrl/public/api/login-student';
  static final resetPasswordVerify = '$baseUrl/public/api/forget-password-verify';
  static final changePassword = '$baseUrl/private/api/change-password';
  static final technologyList = '$baseUrl/public/api/view-technology-list';
  static final sessionList = '$baseUrl/public/api/view-sessions';
  static final courseList = '$baseUrl/public/api/view-course-names';
  static final personalInfoGet = '$baseUrl/private/api/view-personal-info?private_id=';
  static final personalInfoPost = '$baseUrl/private/api/save-student-personal-info/';
  static final educationInfoGet = '$baseUrl/private/api/view-educational-info?private_id=';
  static final educationInfoPost = '$baseUrl/private/api/save-student-educational-info/';
  static final occupationInfoGet = '$baseUrl/private/api/view-occupational-info?private_id=';
  static final occupationInfoPost = '$baseUrl/private/api/save-student-occupation-info/';
  static final deleteApi = '$baseUrl/private/api/remove-educational-info?id=';
  static final adminLogin = '$baseUrl/admin/api/admin-login';
  static final filteredData = '$baseUrl/private/api/filter-student-list';
  static final appStatus = '$baseUrl/public/api/view-app-status';
}