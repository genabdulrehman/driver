import 'package:drive_app/Presentation/View/Task-3/readyToDrop.dart';
import 'package:drive_app/Presentation/View/Task-3/wakra_map_complete.dart';
import 'package:drive_app/Presentation/View/Task-4/fromStation_readytoDrop.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../View/Task-4/fromStation_complete.dart';

class UrlLauncher {
  bool isLaunched = false;
  Future<void> navigateTo(double lat, double lng) async {
    isLaunched = false;
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
      isLaunched = true;
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  void gotoCompleteFromArea() {
    Get.to(WakraComplete(
        fromStation: false,
        isPick: true,
        sliderTitle: "Complete",
        navigationActive: true,
        isCall: false,
        waitingTime: "60:00"));
  }

  void gotoCompleteFromAreafromStation() {
    Get.to(WakraComplete(
        fromStation: true,
        isPick: true,
        sliderTitle: "Complete",
        navigationActive: true,
        isCall: false,
        waitingTime: "60:00"));
  }

  void gotoCompleteFromStation() {
    Get.to(FromStationComplete(
        fromStation: true,
        isPick: false,
        sliderTitle: "Complete",
        navigationActive: true,
        isCall: false,
        waitingTime: "60:00"));
  }

  void gotoReadyToDrop() {
    Get.to(ReadyToDrop());
  }

  void fromStationReadyToDrop() {
    Get.to(FromStationReadyToDrop());
  }
}
