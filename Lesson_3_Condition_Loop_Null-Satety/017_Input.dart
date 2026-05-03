//การรับข้อมูลผ่าน Keyborad

//นำเข้า Package 'dart:io'

import 'dart:io';

//การอ่านข้อมูลใช้ stdin.readLineSync()

//ซึ่งจะได้ค่า String? แบบ Nullable Type
//เนื่องจากรับมาเป็น String? ก็ต้องใช้วิธีจัดการแบบ Nullable type ก่อนใช้
//หากรับเข้ามาเป็นตัวเลข int? ต้องแคสก่อน int.parse() เพื่อนำไปคำนวณ

void main() {
  stdout.write("Enter Your Name :");
  String? name = stdin.readLineSync();
  stdout.write("Enter your Age");

  int? age = int.parse(stdin.readLineSync()!);

  print("You name is $name your age is ${age}");
}
