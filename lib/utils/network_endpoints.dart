class NetworkEndpoints {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String wanAndroidBaseUrl = 'https://wanandroid.com';
  static const String appBaseUrl = 'https://apitest.dianta.pw/app';

  static const String posts = '/posts';
  static const String users = '/users';
  static const String todos = '/todos';

  //发送验证码
  static const String sendTelephoneNew = '/code/send/telephoneNew';
  //登录
  static const String loginCode = '/login/code';

  //首页获取游戏类型的列表
  static const String getCategoryList = '/homePage/getCategoryList';

  //媒体上传
  static const String uploadMedia = '/file/upload';

  static String articleList(int page) => '/article/list/$page/json';

  ///获取搭子详情
  static const String getDetailInfo = '/accompany/detailInfo?userId=';
  //陪玩分类详情
  static const String getAccompanyCategoryDetail = '/accompany/accompanyCategoryDetail?categoryId=';

  //指定用户墙点亮数
  static String userGiftWallLight(String userId) => '/gift/userGiftWallLight/$userId';

  ///获取个人信息详情
  static const String getUserInfo = '/user/detail';

  ///首页的BannerList
  static const String getBannerList = '/homePage/getBannerList';
}
