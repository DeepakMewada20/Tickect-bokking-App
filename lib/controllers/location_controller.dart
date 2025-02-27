import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class LocationController extends GetxController {
  RxString city = citys[0].obs;
  RxBool isLocating = false.obs;
  static LocationController instence = Get.find();

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  Future<void> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    //check if location service enable of not
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    //check location permision is granted of not
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    isLocating = true.obs;
    //getting the current location
    locationData = await location.getLocation();

    var address =
        await geo.GeocodingPlatform.instance!.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    isLocating = false.obs;
    //print(address[0].subLocality);
    setCity(address[0].locality!);
  }

  setCity(String myCity) {
    city = myCity.obs;
    update();
  }
}
