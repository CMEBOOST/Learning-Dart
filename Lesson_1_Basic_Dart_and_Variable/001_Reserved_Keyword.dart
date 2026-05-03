//Keyword หรือ Reserved Keyword เป็นคำที่สงวนในภาษา Dart
//ไม่สามารถใช้เป็นชื่อตัวแปร ฟังก์ชัน หรือคลาส

// ===== ตัวอย่างคำสงวนที่สำคัญในภาษา Dart =====

// 1. การควบคุมการไหลของโปรแกรม
if (true) {
  print("ใช้ if สำหรับเงื่อนไข");
}

for (int i = 0; i < 3; i++) {
  print("ใช้ for สำหรับวนซ้ำ");
}

while (true) {
  break; // ใช้ break เพื่อออกจากวนซ้ำ
}

switch (1) {
  case 1:
    print("ใช้ switch สำหรับตัวเลือก");
    break;
  default:
    print("ค่าเริ่มต้น");
}

// 2. การจัดการข้อมูล
var name = "Dart"; // ใช้ var เพื่อประกาศตัวแปร
int age = 5; // ใช้ int สำหรับจำนวนเต็ม
String message = "Hello"; // ใช้ String สำหรับข้อความ
bool isActive = true; // ใช้ bool สำหรับค่าจริง/เท็จ
double price = 99.99; // ใช้ double สำหรับเลขทศนิยม
List<int> numbers = [1, 2, 3]; // ใช้ List สำหรับรายการ
Map<String, int> scores = {"AI": 100}; // ใช้ Map สำหรับคู่ key-value

// 3. การประกาศคลาส และ ฟังก์ชัน
class Person { // ใช้ class สำหรับประกาศคลาส
  String name;
  
  Person(this.name); // Constructor
}

void sayHello() { // ใช้ void หากฟังก์ชันไม่ส่งกลับค่า
  print("Hello!");
}

String getName() { // ใช้ return type สำหรับคืนค่า
  return "Dart";
}

// 4. Getters และ Setters
class User {
  String _name;
  
  get name => _name; // ใช้ get สำหรับอ่านค่า
  set name(String value) => _name = value; // ใช้ set สำหรับตั้งค่า
}

// 5. การจัดการข้อยกเว้น
try {
  throw Exception("Error!");
} on Exception {
  print("จับข้อมูล Error");
} catch (e) {
  print("ข้อมูล Error ทั่วไป");
} finally {
  print("ทำงานเสมอ");
}

// 6. คำสำคัญอื่นๆ
const PI = 3.14159; // ใช้ const สำหรับค่าคงที่ที่ compile time
static void staticMethod() {} // ใช้ static สำหรับเมธอดของคลาส
abstract class Shape {} // ใช้ abstract สำหรับคลาสที่ไม่มี object แน่นอน
interface class MyInterface {} // ใช้ interface
extends // ใช้ extends สำหรับการสืบทอด
implements // ใช้ implements สำหรับการใช้งาน interface
mixin // ใช้ mixin สำหรับการผสมฟีเจอร์
async // ใช้ async สำหรับฟังก์ชัน asynchronous
await // ใช้ await เพื่อรอ Future
Future // ใช้ Future สำหรับการจัดการงาน asynchronous
null // ค่า null
is // ตรวจสอบประเภท
as // แปลงประเภท
in // ใช้ใน for loop
late // ประกาศตัวแปร late initialization
required // ใช้ required parameter ในฟังก์ชัน
covariant // ใช้สำหรับ type safety ในการสืบทอด
export // ส่งออก library
import // นำเข้า library
library // ประกาศ library
part // ส่วนของ library
deferred // โหลด library แบบชะลาช้า
typedef // สร้างนามแฝง type
enum // ประกาศ enumeration (ค่าที่เป็นไปได้จำนวนจำกัด)

