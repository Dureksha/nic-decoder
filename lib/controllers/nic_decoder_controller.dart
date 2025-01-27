import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICDecoderController extends GetxController {
  String dob = '';
  String gender = '';
  String weekday = '';
  int age = 0;

  void decodeNIC(String nic) {
    bool isOldFormat =
        nic.length == 10 && RegExp(r'^[0-9]{9}[VXvx]$').hasMatch(nic);
    bool isNewFormat = nic.length == 12 && RegExp(r'^[0-9]{12}$').hasMatch(nic);

    if (!isOldFormat && !isNewFormat) {
      Get.snackbar('Error', 'Invalid NIC format');
      return;
    }

    int birthYear = isOldFormat
        ? int.parse('19${nic.substring(0, 2)}')
        : int.parse(nic.substring(0, 4));
    int dayOfYear =
        int.parse(nic.substring(isOldFormat ? 2 : 4, isOldFormat ? 5 : 7));
    gender = dayOfYear > 500 ? 'Female' : 'Male';
    dayOfYear = dayOfYear > 500 ? dayOfYear - 500 : dayOfYear;

    DateTime dateOfBirth =
        DateTime(birthYear).add(Duration(days: dayOfYear - 1));
    dob = DateFormat('yyyy-MM-dd').format(dateOfBirth);
    weekday = DateFormat('EEEE').format(dateOfBirth);
    age = DateTime.now().year - birthYear;
  }
}
