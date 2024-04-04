import 'package:get/get.dart';

extension TimerExtension on RxInt {
  String formatTimer() {
    String showResult = '';
    Duration duration = Duration(seconds: value);
    var day = duration.inDays.remainder(365);
    var hour = duration.inHours.remainder(24);
    var minute = duration.inMinutes.remainder(60);
    var secods = duration.inSeconds.remainder(60);

    if (day > 0) {
      showResult += '${day.toString().padLeft(2, "0")}:';
      showResult += "${hour.toString().padLeft(2, "0")}:";
      showResult += '${minute.toString().padLeft(2, '0')}:';
      showResult += secods.toString().padLeft(2, '0');
    } else if (hour > 0) {
      showResult += "${hour.toString().padLeft(2, "0")}:";
      showResult += '${minute.toString().padLeft(2, '0')}:';
      showResult += secods.toString().padLeft(2, '0');
    } else  {
      showResult += '${minute.toString().padLeft(2, '0')}:';
      showResult += secods.toString().padLeft(2, '0');
    }
    return showResult;
  }
}
