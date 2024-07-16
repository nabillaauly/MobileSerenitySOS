class AppServices {
  static String getBaseUrl() {
    return 'http://194.31.53.102:21094';
  }

  static String getLoginEndpoint() {
    return '${getBaseUrl()}/login';
  }

  static String getRegistEndpoint() {
    return '${getBaseUrl()}/api/register';
  }

  static String getAuthEndpoint() {
    return '${getBaseUrl()}/bearer-auth';
  }

  static String getProfileEndpoint() {
    return '${getBaseUrl()}/profile';
  }

  // static String getUpdateProfileEndpoint() {
  //   return '${getBaseUrl()}/profile';
  // }

  static String getLogoutEndpoint() {
    return '${getBaseUrl()}/api/logout';
  }

}
