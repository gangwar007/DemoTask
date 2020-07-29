
import 'package:scoped_model/scoped_model.dart';

class HomeViewModel extends Model {

  int _buttonType = 0;
  int get buttonType => _buttonType;
  set buttonType(int value) {
    _buttonType = value;
    notifyListeners();
  }


}
