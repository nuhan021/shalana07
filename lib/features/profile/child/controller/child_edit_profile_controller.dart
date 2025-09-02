import 'package:get/get.dart';

class ChildEditProfileController extends GetxController{
     // The selected city
  var selectedCity = ''.obs;

  // List of cities
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
  ];
}