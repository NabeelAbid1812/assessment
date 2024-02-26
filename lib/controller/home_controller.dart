import 'package:assignment/manager/api_manager.dart';
import 'package:assignment/model/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxBool isLoading = false.obs;
  List<homedata> data = [];
  Future<void> getHomeData() async {
    isLoading.value = true;
    update();
    var data = {};
    Map<String, dynamic>? resp;
    try {
      resp =
          await APIProvider().post("http://95.216.221.251/dev/api/home-posts-test", data, false, Get.context);
    } catch (e) {
      // Get.log('[MerchantController.becomMerchant] called $e');
    }
    isLoading.value = false;
    update();
    print(resp?['data']);
    if (resp != null && resp['status'] == true) {
   data.addAll(resp['posts']
            .map<homedata>((e) => homedata.fromJson(e)));
    } else if (resp != null && resp['is_success'] == false) {
      print("failed");
      print(resp);
     
    } else {
     
    }
  }
}