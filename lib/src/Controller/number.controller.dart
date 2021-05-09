import 'package:get/get.dart';

class NumberController extends GetxService {
  static NumberController get to => Get.find();

  RxInt min = 1.obs;
  RxInt max = 100.obs;
  void setMin(int value) {
    min(value);
  }

  void setMax(int value) {
    max(value);
  }

  void setInit() {
    min(1);
    max(100);
  }
}
