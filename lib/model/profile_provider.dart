import 'package:e_commerce/custom.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//_getCurrentUser is the main function
//You can access the lat and the long

class ProfileProvider extends ChangeNotifier{
  Position? _currentPosition ;
  String? _currentAddress;
  String? _street;
  String? _country;
  String? _postalCode;

  Position? get currentPosition => _currentPosition;
  String? get currentAddress => _currentAddress;
  Future<void> get getCurrentPosition => _getCurrentPosition();
  String? get street => _street;
  String? get country => _country;
  String? get postalCode => _postalCode;

Future<void> _getCurrentPosition() async {
  final hasPermission = await _handleLocationPermission();
  try{
    if (!hasPermission) return;
  await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
     _currentPosition = position;
  });
  }
  catch(e){
    debugPrint(e.toString());
  }
}

Future<bool> _handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ErrMes.showSnackBar('Location services are disabled. Please enable the services');
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {   
     ErrMes.showSnackBar('Location permissions are denied');
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
   ErrMes.showSnackBar('Location permissions are permanently denied, we cannot request permissions.');
    return false;
  }
  return true;
}


Future<void> _getAddressFromLatLng(Position position) async {
  try{
    await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
    _street = place.street;
    _country = place.country;
    _postalCode = place.postalCode;
      // _currentAddress =
      //    '${place.street}, ${place.subLocality},
      //     ${place.subAdministrativeArea}, ${place.postalCode}';
    
  });
  }
  catch(e){
    debugPrint(e.toString());
  }
 }

}

//Use an init State and then run this function to get location, display an empty string if user denied location or it's null.





