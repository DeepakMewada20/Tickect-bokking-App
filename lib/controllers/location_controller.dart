import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:my_movie_ticket/controllers/shared_pref.dart';
import 'package:my_movie_ticket/utils/dummy_data.dart';

class LocationController extends GetxController {
  RxString city = citys[0].obs;
  RxBool isLocating = false.obs;
  static LocationController instence = Get.find();

  Future<void> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    setIsLocating(false);

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
    setIsLocating(true);
    //getting the current location
    locationData = await location.getLocation();

    var address =
        await geo.GeocodingPlatform.instance!.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    setIsLocating(false);
    //print(address[0].subLocality);
    setCity(address[0].locality!);
  }

  setCity(String myCity) async{
    city = myCity.obs;
    await SharedPref.storeLocation(myCity);
    update();
  }

  setIsLocating(bool location) {
    isLocating = location.obs;
    update();
  }
}
