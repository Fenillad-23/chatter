import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class signin extends GetxController {
  bool obscure = true;
  bool remember = false;
  Obscure(bool obcure) {
    obscure = !obcure;
  }

  Remember(bool value) {
    remember = value;
  }
}
