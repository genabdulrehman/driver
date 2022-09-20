
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Data/Models/pickup_Model.dart';

class PickUpDropOffController extends GetxController {
  List<PickupModel> _getPickups = [
    PickupModel(
        title: "Pickup",
        streetName: "Ahmad bin Thani street",
        distance: "200M",
        duration: "2mints"),
    PickupModel(
        title: "Dropoff",
        streetName: "Doha steet 5",
        distance: "400M",
        duration: "2mints"),
    // PickupModel(
    //     title: "Pickup",
    //     streetName: "Al-Dakhira",
    //     distance: "900M",
    //     duration: "5mints"),
  ];

  List<PickupModel> get getPickups => _getPickups.obs;

  void onComplete() {
    _getPickups.removeAt(0);
  }
}
