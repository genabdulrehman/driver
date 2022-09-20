
import 'package:get/get.dart';

import '../../Data/Models/ChooseAreaModel.dart';

class ChooseAreaController extends GetxController {
  RxString name = "noor".obs;
  RxString age = "noor".obs;
  List<ChooseAreaModel> _chooseAreaList = [
    ChooseAreaModel(
      stationName: "Al-Saad",
      distance: "400M",
      riders: "23",
      drivers: "1",
    ),
    ChooseAreaModel(
      stationName: "The White Place",
      distance: "800M",
      riders: "10",
      drivers: "3",
    ),
    ChooseAreaModel(
      stationName: "Al-Messila",
      distance: "100M",
      riders: "12",
      drivers: "7",
    ),
  ];

  List<ChooseAreaModel> get chooseAreaList => _chooseAreaList.obs;
}
