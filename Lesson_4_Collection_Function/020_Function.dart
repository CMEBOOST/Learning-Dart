import 'dart:io';
import 'dart:math';

//═════════════════════════════════════════════════════════════════
// 📚 บทเรียน: ฟังก์ชัน (Function)
//═════════════════════════════════════════════════════════════════
// Function คือการแบ่งการทำงานออกเป็นส่วนย่อย เพื่อให้สามารถ:
// • เรียกใช้ซ้ำได้ โดยไม่ต้องเขียนโค้ดซ้ำหลายครั้ง
// • จัดโค้ดให้เป็นระเบียบ ง่ายต่อการจัดการ
// • ซ่อนรายละเอียดที่ซับซ้อนไว้ในฟังก์ชัน

void main() {
  print('💡 ตัวอย่างการใช้ Function ใน Dart\n');

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 1: Function พื้นฐาน (ไม่มีพารามิเตอร์)
  //═══════════════════════════════════════════════════════════════
  // รูปแบบ:
  // void ชื่อฟังก์ชัน() {
  //   คำสั่งต่างๆ
  // }

  void sumNumber() {
    print('--- ตัวอย่างที่ 1: หาผลบวก 0-9 ---');
    int sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += i;
    }
    print('ผลบวก: $sum\n');
  }

  sumNumber(); // เรียกใช้ฟังก์ชัน

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 2: Function ที่มี Parameter
  //═══════════════════════════════════════════════════════════════
  // Parameter = ตัวแปรที่ประกาศในฟังก์ชัน (รับค่ามาจากภายนอก)
  // Argument = ค่าที่ส่งเข้าไปเมื่อเรียกใช้ฟังก์ชัน
  //
  // รูปแบบ:
  // void ชื่อฟังก์ชัน(ชนิดข้อมูล ชื่อพารามิเตอร์) {
  //   คำสั่งต่างๆ
  // }

  void oddEven(int num) {
    print('--- ตัวอย่างที่ 2: ตรวจสอบเลขคู่/เลขคี่ ---');
    if (num % 2 == 0) {
      print('$num เป็นเลขคู่');
    } else {
      print('$num เป็นเลขคี่');
    }
  }

  oddEven(12); // ส่ง 12 เข้ามา (Argument)
  oddEven(7); // ส่ง 7 เข้ามา
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 3: Function ที่ส่งค่ากลับ (Return)
  //═══════════════════════════════════════════════════════════════
  // Return ใช้เพื่อส่งผลลัพธ์กลับจากฟังก์ชัน
  // ชนิดข้อมูลที่ส่งกลับ จะระบุไว้หน้าชื่อฟังก์ชัน
  //
  // รูปแบบ:
  // ชนิดข้อมูลที่ส่งกลับ ชื่อฟังก์ชัน(parameters) {
  //   return ค่าที่ต้องการส่งกลับ;
  // }

  String getOddEven(int num) {
    if (num % 2 == 0) {
      return 'เลขคู่';
    } else {
      return 'เลขคี่';
    }
  }

  print('--- ตัวอย่างที่ 3: ส่งค่ากลับ (Return) ---');
  String result1 = getOddEven(9);
  String result2 = getOddEven(20);
  print('9 เป็น: $result1');
  print('20 เป็น: $result2');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 4: Function ที่มีหลาย Parameters
  //═══════════════════════════════════════════════════════════════

  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }

  print('--- ตัวอย่างที่ 4: หลาย Parameters ---');
  print('5 + 3 = ${add(5, 3)}');
  print('10 - 4 = ${subtract(10, 4)}');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 5: Parameter ที่มีค่าเริ่มต้น (Default)
  //═══════════════════════════════════════════════════════════════
  // รูปแบบ: ต้องใส่ [] เพื่อให้ parameter เป็น optional
  // void func([ชนิดข้อมูล ชื่อพารามิเตอร์ = ค่าเริ่มต้น]) { }

  void greet([String name = 'เพื่อน']) {
    print('สวัสดี $name!');
  }

  print('--- ตัวอย่างที่ 5: Default Parameter (Positional Optional) ---');
  greet(); // ใช้ค่า default
  greet('สมชาย'); // ใช้ค่าที่กำหนดเอง
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 6: Named Parameters
  //═══════════════════════════════════════════════════════════════
  // ใช้ {} เพื่อกำหนด named parameters
  // ต้องระบุชื่อเมื่อเรียกใช้ required = บังคับต้องส่ง
  // รูปแบบ:
  // void func({required ชนิด name, ชนิด city = 'default'}) { }

  void printInfo({
    required String name,
    required int age,
    String city = 'กรุงเทพ',
  }) {
    print('ชื่อ: $name');
    print('อายุ: $age ปี');
    print('เมือง: $city');
  }

  print('--- ตัวอย่างที่ 6: Named Parameters (ใช้ {}) ---');
  printInfo(name: 'สมปอง', age: 25);
  printInfo(name: 'วิชัย', age: 30, city: 'เชียงใหม่');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 7: Function ที่คืนค่าแบบ List
  //═══════════════════════════════════════════════════════════════

  List<int> generateRandomNumbers(int min, int max, int count) {
    var rand = Random();
    List<int> result = [];

    for (int i = 0; i < count; i++) {
      int randomNum = min + rand.nextInt(max - min + 1);
      result.add(randomNum);
    }
    return result;
  }

  print('--- ตัวอย่างที่ 7: Return List ---');
  List<int> numbers = generateRandomNumbers(1, 100, 5);
  print('เลขสุ่ม: $numbers');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 8: Function ที่รับ List เป็น Parameter
  //═══════════════════════════════════════════════════════════════

  int sumList(List<int> myList) {
    int sum = 0;
    for (int num in myList) {
      sum += num;
    }
    return sum;
  }

  print('--- ตัวอย่างที่ 8: Parameter เป็น List ---');
  List<int> myNumbers = [10, 20, 30, 40];
  print('รายการ: $myNumbers');
  print('ผลบวก: ${sumList(myNumbers)}');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 9: Nullable Type (สามารถเป็น null ได้)
  //═══════════════════════════════════════════════════════════════
  // ใช้ ? เพื่อบ่งชี้ว่าค่านี้อาจเป็น null ได้

  String? getGrade(int? score) {
    if (score == null) {
      return null;
    }
    if (score >= 80) {
      return 'A';
    } else if (score >= 70) {
      return 'B';
    } else {
      return 'C';
    }
  }

  print('--- ตัวอย่างที่ 9: Nullable Type ---');
  print('คะแนน 85 ได้เกรด: ${getGrade(85)}');
  print('คะแนน null ได้เกรด: ${getGrade(null)}');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 10: Arrow Function
  //═══════════════════════════════════════════════════════════════
  // ใช้ => สำหรับฟังก์ชันที่มีคำสั่งเดียว
  // ไม่ต้องใช้ {} และไม่ต้องใช้ return
  //
  // Regular Function:  int add(int a, int b) { return a + b; }
  // Arrow Function:    int add(int a, int b) => a + b;

  int multiply(int a, int b) => a * b;
  int divide(int a, int b) => (a ~/ b); // ~/ คือ integer division

  print('--- ตัวอย่างที่ 10: Arrow Function ---');
  print('7 × 6 = ${multiply(7, 6)}');
  print('20 ÷ 3 = ${divide(20, 3)}');
  print("");

  //═══════════════════════════════════════════════════════════════
  // ✨ ตัวอย่างที่ 11: Null Coalescing Operator (?? และ ??=)
  //═════════════════════════════════════════════════════════════════

  int? randomWithDefault(int? min, int? max) {
    // ?? ใช้เมื่อค่าทางซ้ายเป็น null ให้ใช้ค่าทางขวา
    min = min ?? 0;
    max = max ?? 100;

    if (max <= min) {
      return null;
    }
    return min + Random().nextInt(max - min);
  }

  print('--- ตัวอย่างที่ 11: Null Coalescing (??) ---');
  print('Random(null, null): ${randomWithDefault(null, null)}');
  print('Random(50, null): ${randomWithDefault(50, null)}');
  print("");

  //═══════════════════════════════════════════════════════════════
  // 📌 สรุปจุดสำคัญเกี่ยวกับ Function
  //═════════════════════════════════════════════════════════════════
  print('📌 สรุป:');
  print('• Function ช่วยเรียกใช้โค้ดซ้ำโดยไม่ต้องเขียนใหม่');
  print('• Parameter = ตัวแปรในฟังก์ชัน, Argument = ค่าที่ส่งเข้า');
  print('• void = ไม่ส่งค่ากลับ, return = ส่งค่ากลับ');
  print('• Arrow function => ใช้สำหรับฟังก์ชันเชิงเดียว');
  print('• ? ใช้บ่งชี้ว่าค่านี้อาจเป็น null ได้');
  print('• ?? ใช้เมื่อค่าเป็น null ให้ใช้ค่าเริ่มต้น');
}
