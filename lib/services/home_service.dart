import '../models/home_menu_item.dart';
import '../repositories/home_repository.dart';

class HomeService {
  HomeService({HomeRepository? repository})
      : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;

  List<HomeMenuItem> buildMenuItems() => _repository.menuItems;
}
