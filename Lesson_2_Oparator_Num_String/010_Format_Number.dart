//จัดรูปแบบของตัวเลข คั่นหลักพันด้วยเครื่องหมายคอมม่า

import 'package:intl/intl.dart';

void main() {
  // var fmt = NumberFormat.decimalPattern();
  var fmt = NumberFormat();
  int num = 1234567;
  dynamic x = fmt.format(num);
  print("$x type : ${x.runtimeType}"); // output : 1,234,567 เป็น String
}
