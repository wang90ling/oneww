import 'package:flutter/material.dart';
import 'package:oneww/core/helpers/app_logger.dart';

import '../models/home_menu_item.dart';
import '../repositories/home_repository.dart';
import 'view_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({HomeRepository? repository}) : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;

  ViewStatus _status = ViewStatus.initial;
  String? _errorMessage;
  List<HomeMenuItem> _menus = const [];

  ViewStatus get status => _status;
  String? get errorMessage => _errorMessage;
  List<HomeMenuItem> get menus => _menus;

  Future<void> loadMenus() async {
    _status = ViewStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      _menus = _repository.menuItems;
      AppLogger.info("_repository:"+_menus.length.toString(),tag: "wangling");
      _status = _menus.isEmpty ? ViewStatus.empty : ViewStatus.success;
      AppLogger.info("_status:"+_status.toString(),tag: "wangling");

      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString();
      _status = ViewStatus.error;
      notifyListeners();
    }
  }
}
