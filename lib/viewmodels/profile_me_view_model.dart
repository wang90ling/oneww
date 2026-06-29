import 'package:flutter/material.dart';
import 'package:oneww/core/helpers/app_logger.dart';
import 'package:oneww/core/network/network_client.dart';
import 'package:oneww/repositories/profile_me_repository.dart';
import '../models/user_detail_response_entity.dart';
import 'view_state.dart';

/**
 * @author wangling
 * @date 2026/6/29 16:53
 * @description 个人信息详情页面
 */
class ProfileMeViewModel extends ChangeNotifier {
  ProfileMeViewModel({ProfileMeRepository? repository}) : _repository = repository ?? ProfileMeRepository();

  final ProfileMeRepository _repository;

  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  UserDetailResponseEntity? _userDetailResponseEntity;

  Future<UserDetailResponseEntity?> getUserInfo() async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final detail = await _repository.getUserInfo();
      _userDetailResponseEntity = detail;
      _status = ViewStatus.success;
      notifyListeners();
      return detail;
    } on UnauthorizedException {
      rethrow;
    } catch (error) {
      _errorMessage = error.toString();
      _status = ViewStatus.error;
      notifyListeners();
      rethrow;
    }
  }
}
