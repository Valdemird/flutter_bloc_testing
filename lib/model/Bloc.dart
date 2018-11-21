import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'User.dart';
import 'Model.dart';

class Bloc {
  Model model;
  final _userListStreamController = BehaviorSubject<List<User>>(seedValue: []);
  final _generalStreamController = StreamController<User>();

  //data
  Stream get userList => _userListStreamController.stream;

  //actions
  Function(User) get setUser => _generalStreamController.sink.add;

  Bloc() {
    model = Model();
    _generalStreamController.stream.listen(_handleAddition);
  }

  void _handleAddition(User user) {
    model.userListModel.add(user);
    _userListStreamController.sink.add(model.userListModel);
  }

  void dispose() {
    _generalStreamController.close();
    _userListStreamController.close();
  }
}

final bloc = Bloc();
