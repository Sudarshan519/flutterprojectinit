import 'package:get/get.dart';

class HomeController extends GetxController {
  var token = "".obs;
  var user = {}.obs;
  @override
  void onInit() {
    token.value = Get.arguments["idToken"];
    user.value = Get.arguments;
    print(Get.arguments);
    super.onInit();
  }
}
