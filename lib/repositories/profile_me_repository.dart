import 'package:oneww/models/user_gift_wall_request_entity.dart';

import '../core/helpers/app_logger.dart';
import '../core/network/api_service.dart';
import '../models/user_detail_response_entity.dart';
import '../models/user_gift_wall_light_response_entity.dart';
import '../models/user_gift_wall_response_entity.dart';

/**
 * @author wangling
 * @date 2026/6/29 16:45
 * @description 我的模块-个人信息详情
 */
class ProfileMeRepository {
  ProfileMeRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  ///获取个人信息接口
  Future<UserDetailResponseEntity> getUserInfo() async {
    final response = await _apiService.getUserInfo();
    AppLogger.info('UserDetailResponseEntity 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    return response;
  }


  ///指定用户的礼物墙
  // {"lightType":1,"pageNo":1,"pageSize":5,"userId":"2033485243273674753"}
  Future<UserGiftWallResponseEntity> giftUserGiftWall(int lightType, int pageNo, int pageSize, String userId) async {
    final request = UserGiftWallRequestEntity(
      lightType: lightType,
      pageNo: pageNo,
      pageSize: pageSize,
      userId: userId,
    );
    final response = await _apiService.giftUserGiftWall(request);
    AppLogger.info('giftUserGiftWall 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    return response;
  }


  //指定用户礼物墙点亮数
  Future<UserGiftWallLightResponseEntity> giftUserGiftWallLight(String userId) async {
    final response = await _apiService.giftUserGiftWallLight(userId);
    AppLogger.info('giftUserGiftWallLight 成功: code=${response.code}, message=${response.message}', tag: 'wangling');
    return response;
  }

}
