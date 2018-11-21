import 'User.dart';

class Model {
  List<User> _userListModel;
  List<User> get userListModel => _userListModel;
  Model() {
    _userListModel = [];
  }
}
