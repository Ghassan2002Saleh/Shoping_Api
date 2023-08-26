class ApiSettings {
  static const String _baseUrl = 'http://demo-api.mr-dev.tech/api/';
  static const String users = '${_baseUrl}users';
  static const String register = '${_baseUrl}students/auth/register';
  static const String login = '${_baseUrl}students/auth/login';
  static const String logout = '${_baseUrl}students/auth/logout';
  static const String forgotPassword =
      '${_baseUrl}students/auth/forget-password';
  static const String resetPassword = '${_baseUrl}students/auth/reset-password';
  static const String image = '${_baseUrl}student/images/{id}';
  static const String task = '${_baseUrl}tasks/{id}';
}
