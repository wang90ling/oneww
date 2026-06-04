class NetworkEndpoints {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String wanAndroidBaseUrl = 'https://wanandroid.com';
  static const String appBaseUrl = 'https://apitest.dianta.pw/app';

  static const String posts = '/posts';
  static const String users = '/users';
  static const String todos = '/todos';
  static const String sendTelephoneNew = '/code/send/telephoneNew';
  static const String loginCode = '/login/code';

  static String articleList(int page) => '/article/list/$page/json';
}
