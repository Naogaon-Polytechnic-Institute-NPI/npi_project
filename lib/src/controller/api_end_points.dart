class ApiEndPoints{
  static const signUp = 'https://npi-job-placement-backend.onrender.com/public/api/first-time-login';
  static const savePassword = 'https://npi-job-placement-backend.onrender.com/private/api/save-user-passwd';
  static const login = 'https://npi-job-placement-backend.onrender.com/public/api/login-student';
  static const personalInfoGet = 'https://npi-job-placement-backend.onrender.com/private/api/view-personal-info?private_id=';
  static const personalInfoPost = 'https://npi-job-placement-backend.onrender.com/private/api/save-student-personal-info/';
  static const educationInfoGet = 'https://npi-job-placement-backend.onrender.com/private/api/view-educational-info?private_id=';
  static const educationInfoPost = 'https://npi-job-placement-backend.onrender.com/private/api/save-student-educational-info/';
  static const occupationInfoGet = 'https://npi-job-placement-backend.onrender.com/private/api/view-occupational-info?private_id=';
  static const occupationInfoPost = 'https://npi-job-placement-backend.onrender.com/private/api/save-student-occupation-info/';
  static const deleteApi = 'https://npi-job-placement-backend.onrender.com/private/api/remove-educational-info?id=';
}