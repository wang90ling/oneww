import '../core/helpers/app_logger.dart';
import '../core/network/api_service.dart';
import '../models/user_detail_response_entity.dart';

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

}
