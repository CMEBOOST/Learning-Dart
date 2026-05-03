import 'dart:io';

void main() {
  // ===== 1. stdout.write() vs print() =====
  stdout.write("Hello : "); // <-- แสดงข้อความภายในบรรทัด (ไม่ขึ้นบรรทัดใหม่)
  print("Surachet"); // <-- แสดงข้อความพร้อมขึ้นบรรทัดใหม่
  
  // Output: Hello : Surachet
  
  // ===== 2. print() เพียงอย่างเดียว =====
  print("บรรทัดที่ 1");
  print("บรรทัดที่ 2");
  print("บรรทัดที่ 3");
  
  // Output:
  // บรรทัดที่ 1
  // บรรทัดที่ 2
  // บรรทัดที่ 3
  
  // ===== 3. String interpolation (แทรกค่าตัวแปร) =====
  String name = "พิชญ์";
  int age = 25;
  print("ชื่อ: $name, อายุ: $age");
  // Output: ชื่อ: พิชญ์, อายุ: 25
  
  // ===== 4. Expression ในการแสดงผล =====
  print("5 + 3 = ${5 + 3}");
  print("ส่วนสูง: ${age > 20 ? 'สูงกว่า 20' : 'น้อยกว่า 20'}");
  
  // ===== 5. List และ Map =====
  List numbers = [1, 2, 3, 4, 5];
  print("ตัวเลข: $numbers");
  
  Map person = {"name": "Dart", "version": 3.0};
  print("ข้อมูล: $person");
  
  // ===== 6. stdout.writeln() - เหมือน print =====
  stdout.writeln("ใช้ writeln แบบนี้");
  stdout.writeln("มันจะขึ้นบรรทัดใหม่");
  
  // ===== 7. หลายบรรทัด String (multi-line) =====
  String multiline = """
  บรรทัดที่ 1
  บรรทัดที่ 2
  บรรทัดที่ 3
  """;
  print(multiline);
}
