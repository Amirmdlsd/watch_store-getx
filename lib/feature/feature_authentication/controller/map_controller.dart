// import 'package:get/get.dart';
// import 'package:location/location.dart';
//
// class MapController extends GetxController {
//   PermissionStatus? permissionStatus;
//   Location location = Location();
//   LocationData? _locationData;
//   RxDouble lat = 0.0.obs;
//   RxDouble lng = 0.0.obs;
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     initLocation();
//   }
//
//   Future<void> initLocation() async {
//     permissionStatus = await location.hasPermission();
//     if (permissionStatus == PermissionStatus.granted) {
//       _locationData = await location.getLocation();
//       lat.value = _locationData?.latitude ?? 0;
//       lng.value = _locationData?.longitude ?? 0;
//     } else {
//       location.requestPermission();
//       _locationData = await location.getLocation();
//       lat.value = _locationData?.latitude ?? 0;
//       lng.value = _locationData?.longitude ?? 0;
//     }
//   }
// }
