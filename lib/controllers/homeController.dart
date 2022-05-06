import 'package:get/get.dart';
import 'package:projectinit/pages/auth/login/auth.dart';
import 'package:projectinit/services/authService.dart';

class HomeController extends GetxController {
  // var token = "".obs;
  var user = {}.obs;
  var authService = AuthService().authInstance;
  signout() async {
    await authService.signOut();
    Get.back();
    Get.offAll(() => LoginPage());
  }
}
