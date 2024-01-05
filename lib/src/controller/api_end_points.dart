class ApiEndPoints{
  static const baseUrl = 'https://v2-npi-placement-backend.onrender.com';

  static const verify = '$baseUrl/public/api/first-time-login';
  static const savePassword = '$baseUrl/private/api/save-user-passwd';
  static const login = '$baseUrl/public/api/login-student';
  static const resetPasswordVerify = '$baseUrl/public/api/forget-password-verify';
  static const changePassword = '$baseUrl/private/api/change-password';
  static const technologyList = '$baseUrl/public/api/view-technology-list';
  static const sessionList = '$baseUrl/public/api/view-sessions';
  static const courseList = '$baseUrl/public/api/view-course-names';
  static const personalInfoGet = '$baseUrl/private/api/view-personal-info?private_id=';
  static const personalInfoPost = '$baseUrl/private/api/save-student-personal-info/';
  static const educationInfoGet = '$baseUrl/private/api/view-educational-info?private_id=';
  static const educationInfoPost = '$baseUrl/private/api/save-student-educational-info/';
  static const occupationInfoGet = '$baseUrl/private/api/view-occupational-info?private_id=';
  static const occupationInfoPost = '$baseUrl/private/api/save-student-occupation-info/';
  static const deleteApi = '$baseUrl/private/api/remove-educational-info?id=';
  static const adminLogin = '$baseUrl/admin/api/admin-login';
  static const filteredData = '$baseUrl/private/api/filter-student-list';
  static const appStatus = '$baseUrl/public/api/view-app-status';
}