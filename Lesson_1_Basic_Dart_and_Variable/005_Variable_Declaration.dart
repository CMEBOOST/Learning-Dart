//มาตรฐานการตั้งชื่อตัวแปร
/*
  1. ต้องประกอบด้วยตัวอักษร a-z, A-Z, _ หรือ $
  2. ไม่สามารถเริ่มต้นด้วยตัวเลขได้
  3. ไม่สามารถใช้คำสงวน (Reserved Keywords) ได้
  4. ใช้ camelCase สำหรับตัวแปรและฟังก์ชัน (userName, getUserName())
  5. Case-sensitive: userName และ username เป็นตัวแปรคนละตัว
*/

// ===== 1. การประกาศตัวแปรตามชนิดข้อมูล =====
// รูปแบบ: ชนิดข้อมูล ชื่อตัวแปร;

int age;
double pi;
num score;
String name;
bool isActive;
dynamic data;
var city;

// ===== 2. การกำหนดค่าให้ตัวแปร =====
// รูปแบบ: ชนิดข้อมูล ชื่อตัวแปร = ค่าที่กำหนด;

int value = 10;
double price = 12.29;

// ===== 3. ประกาศหลายตัวแปรพร้อมกัน =====
int x = 5, y = 10, z = 15;
String firstName = "Surachet", lastName = "Seesa";

// ===== 4. ตัวอย่างการใช้งาน =====
void main() {
  // ตัวแปรทั่วไป
  int myAge = 25;
  String myName = "พิชญ์";
  double height = 175.5;
  bool isStudent = true;

  print("===== ตัวแปรพื้นฐาน =====");
  print("ชื่อ: $myName");
  print("อายุ: $myAge");
  print("ส่วนสูง: $height");
  print("นักเรียน: $isStudent");

  // ประกาศหลายตัว
  print("\n===== ประกาศหลายตัวแปร =====");
  int num1 = 100, num2 = 200, num3 = 300;
  print("num1: $num1, num2: $num2, num3: $num3");

  // สรุป best practices
  print("\n===== สรุป Best Practices =====");
  print("✓ ใช้ชื่อที่มีความหมาย: userName, totalPrice");
  print("✓ ใช้ camelCase: myVariable, getUserAge()");
  print("✓ ลดใช้ dynamic, เลือก var หรือชนิดเฉพาะ");
  print("✓ ใช้ const และ final สำหรับค่าคงที่");
}

//การเช็คชนิดข้อมูลของตัวแปร
//ใช้ .runtimeType เพื่อดูชนิดข้อมูลของตัวแปร
void checkType() {
  var name = "Dart";
  var age = 5;
  var isActive = true;

  print("ชื่อ: $name, ชนิด: ${name.runtimeType}");
  print("อายุ: $age, ชนิด: ${age.runtimeType}");
  print("สถานะ: $isActive, ชนิด: ${isActive.runtimeType}");
}
