import 'package:flutter/material.dart';
import 'package:oneww/core/helpers/app_logger.dart';
import 'package:oneww/core/network/network_client.dart';

import '../models/accompany_category_detail_entity.dart';
import '../models/banner_respose_entity.dart';
import '../models/home_menu_item.dart';
import '../repositories/home_repository.dart';
import 'view_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({HomeRepository? repository}) : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;

  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  List<HomeMenuItem> _menus = const [];
  AccompanyCategoryDetailEntity? _accompanyCategoryDetail;

  BannerResposeEntity? _bannerResposeEntity;

  ViewStatus get status => _status;
  String? get errorMessage => _errorMessage;
  List<HomeMenuItem> get menus => _menus;
  AccompanyCategoryDetailEntity? get accompanyCategoryDetail => _accompanyCategoryDetail;

  Future<void> loadMenus() async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      _menus = _repository.menuItems;
      AppLogger.info('_repository:${_menus.length}', tag: 'wangling');
      _status = _menus.isEmpty ? ViewStatus.empty : ViewStatus.success;
      AppLogger.info('_status:$_status', tag: 'wangling');
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString();
      _status = ViewStatus.error;
      notifyListeners();
    }
  }

  Future<AccompanyCategoryDetailEntity?> loadAccompanyCategoryDetail(String categoryId, String userId) async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final detail = await _repository.getAccompanyCategoryDetail(categoryId, userId);
      _accompanyCategoryDetail = detail;
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

  ///首页的BannerList
  Future<BannerResposeEntity?> getBannerList() async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();
    try {
      final detail = await _repository.getBannerList();
      _bannerResposeEntity = detail;
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
