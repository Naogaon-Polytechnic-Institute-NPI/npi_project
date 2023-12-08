class ApiEndPoints{
  static const signUp = 'https://npi-job-placement-backend.onrender.com/public/api/first-time-login';
  static const savePassword = 'https://npi-job-placement-backend.onrender.com/private/api/save-user-passwd';
  static const login = 'https://npi-job-placement-backend.onrender.com/public/api/login-student';
  static const resetPasswordVerify = 'https://npi-job-placement-backend.onrender.com/public/api/forget-password-verify';
  static const changePassword = 'https://npi-job-placement-backend.onrender.com/private/api/change-password';
  static const technologyList = 'https://npi-job-placement-backend.onrender.com/public/api/view-technology-list';
  static const sessionList = 'https://npi-job-placement-backend.onrender.com/public/api/view-sessions';
  static const courseList = 'https://npi-job-placement-backend.onrender.com/public/api/view-course-names';
  static const personalInfoGet = 'https://npi-job-placement-backend.onrender.com/private/api/view-personal-info?private_id=';
  static const personalInfoPost = 'https://npi-job-placement-backend.onrender.com/private/api/save-student-personal-info/';
  static const educationInfoGet = 'https://npi-job-placement-backend.onrender.com/private/api/view-educational-info?private_id=';
  static const educationInfoPost = 'https://npi-job-placement-backend.onrender.com/private/api/save-student-educational-info/';
  static const occupationInfoGet = 'https://npi-job-placement-backend.onrender.com/private/api/view-occupational-info?private_id=';
  static const occupationInfoPost = 'https://npi-job-placement-backend.onrender.com/private/api/save-student-occupation-info/';
  static const deleteApi = 'https://npi-job-placement-backend.onrender.com/private/api/remove-educational-info?id=';
  static const adminLogin = 'https://npi-job-placement-backend.onrender.com/admin/api/admin-login';
  static const filteredData = 'https://npi-job-placement-backend.onrender.com/private/api/filter-student-list';
}