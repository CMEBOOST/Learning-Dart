สรุป บทที่ 1 - Dart พื้นฐาน และตัวแปร

---

## 📌 Setup
```dart
import 'dart:io';  // สำคัญ! ต้องใช้ stdout.write()
```

---

## 1. Reserved Keyword (คำสงวน)
- ภาษา Dart มี Keyword ที่เป็นคำเฉพาะ
- ไม่สามารถใช้เป็นชื่อตัวแปร ชื่อฟังก์ชัน หรือ ชื่อคลาส
- ตัวอย่าง: if, for, while, class, void, return, etc.

## 2. Syntax - โครงสร้างพื้นฐาน
- คล้ายกับภาษา Java
- มีฟังก์ชัน `main()` เป็นจุดเริ่มต้นของโปรแกรม
- `void` บอกว่าฟังก์ชันไม่มีการ return ค่า
- ใช้ `{}` หุ้มรอบ block และ `;` ปิดท้าย statement

## 3. Output - การแสดงผล
- `stdout.write()` → แสดงข้อมูลโดยไม่เว้นบรรทัดใหม่ (ต้อง import 'dart:io')
- `print()` → แสดงข้อมูลและขึ้นบรรทัดใหม่
- `stdout.writeln()` → เหมือน print()

**ตัวอย่าง:**
```dart
import 'dart:io';

void main() {
  stdout.write("Hello : ");
  print("Dart");
- Multi-line String: ใช้ `"""..."""` สำหรับหลายบรรทัด

**ตัวอย่าง:**
```dart
void main() {
  String name = "พิชญ์";
  int age = 25;
  
  print("ชื่อ: $name, อายุ: $age");
  print("ความแตกต่าง: ${age > 20 ? 'อยู่ในวัยทำงาน' : 'นักเรียน'}");
  
  String multiline = """
  บรรทัดที่ 1
  บรรทัดที่ 2
  บรรทัดที่ 3
  """;
  print(multiline);
}
```
  // Output: Hello : Dart (ในบรรทัดเดียว)
  
  print("บรรทัดที่ 1");
  print("บรรทัดที่ 2");
  // Output: แต่ละแถวใหม่
}

**ตัวอย่าง:**
```dart
void main() {
  int age = 25;
  double height = 175.5;
  String name = "Dart";
  bool isActive = true;
  
  List<int> numbers = [1, 2, 3, 4, 5];
  Map<String, dynamic> person = {
    "name": "พิชญ์",
    "age": 25,

// ตรวจสอบชนิดข้อมูล
print(age.runtimeType);     // int
print(name.runtimeType);    // String
print(data.runtimeType);    // String
    "active": true
  };
  
  print("ชื่อ: $name, อายุ: $age, สูง: $height");
  print("ตัวเลข: $numbers");
  print("ข้อมูล: $person");
}
```
```

## 4. Comments - ความเห็น
- Single line: `// ความเห็นบรรทัดเดียว`
- Multi-line: `/* ความเห็น หลาย บรรทัด */`

## 5. String Interpolation - แทรกค่าตัวแปร
- `print("ชื่อ: $name")` → แทรกค่าตัวแปรตรงๆ
- `print("อายุ: ${age + 1}")` → แทรกค่า expression

## 6. Primitive Data Types - ชนิดข้อมูลพื้นฐาน
- `int` → จำนวนเต็ม (25, -100)
- `double` → ทศนิยม (3.14, 99.99)
- `num` → ทั้ง int และ double
- `String` → ข้อความ ("Hello Dart")
- `bool` → ค่าจริง/เท็จ (true, false)
- `List` → รายการ ([1, 2, 3])
- `Map` → คู่ key-value ({"name": "Dart", "age": 5})
- `dynamic` → ชนิดไหนก็ได้

## 7. ชื่อตัวแปร - Naming Convention
- ต้องเริ่มด้วย a-z, A-Z, _ หรือ $

| คุณสมบัติ | const | final |
|---------|-------|-------|
| **เวลาคำนวณ** | Compile-time | Runtime |
| **ประกาศค่าเมื่อไร** | ต้องทันที | ทีหลังได้ |
| **เปลี่ยนค่าได้ไหม** | ❌ ไม่ได้ | ❌ ไม่ได้ |
| **ใช้กับสิ่งไหน** | ค่า literal เท่านั้น | ทุกสิ่ง |

**ตัวอย่าง:**
```dart
void main() {
  // const - ต้องรู้ค่าตอน compile
  const double PI = 3.14159;
  const String APP_NAME = "Dart Learning";
  // const int maxUsers = getUserCount();  // ❌ ผิด! ไม่รู้ค่าตอน compile
  
  // final - สามารถรู้ค่าตอน runtime
  final double rate = 87.75;
  final int maxUsers = getUserCount();  // ✓ ได้
  final DateTime now = DateTime.now();  // ✓ ได้
  
  print("PI = $PI, APP = $APP_NAME");
  print("Rate = $rate, Max = $maxUsers");
}

int getUserCount() {
  return 100;  // ค่าคำนวณมาจากการ run
}
``ะเภทอัตโนมัติ
dynamic data = "Hello";    // เปลี่ยนประเภทได้
```

## 9. dynamic vs var - ความแตกต่าง
- **dynamic**: สามารถเปลี่ยนชนิดข้อมูลได้ตลอดเวลา
  ```dart
  dynamic x = "Hello";
  x = 123;      // ✓ ได้
- ใช้ `.runtimeType` เพื่อตรวจสอบชนิดข้อมูล

---

## 📋 Complete Example - ตัวอย่างรวม
```dart
import 'dart:io';

void main() {
  print("===== Lesson 1 Complete Example =====\n");
  
  // 1. Declare Variables
  int age = 25;
  String name = "พิชญ์";
  double salary = 50000.50;
  bool isWorking = true;
  
  print("1️⃣ ตัวแปรพื้นฐาน:");
  print("  ชื่อ: $name");
  print("  อายุ: $age ปี");
  print("  เงินเดือน: \$${salary}");
  print("  ทำงาน: $isWorking\n");
  
  // 2. Check Type
  print("2️⃣ ตรวจสอบชนิดข้อมูล:");
  print("  age type: ${age.runtimeType}");
  print("  name type: ${name.runtimeType}");
  print("  salary type: ${salary.runtimeType}\n");
  
  // 3. Collections
  List<int> numbers = [10, 20, 30, 40, 50];
  Map<String, dynamic> profile = {
    "name": name,
    "age": age,
    "skills": ["Dart", "Flutter", "Java"]
  };
  
  print("3️⃣ Collections:");
  print("  ตัวเลข: $numbers");
  print("  โปรไฟล์: $profile\n");
  
  // 4. const vs final
  const double PI = 3.14159;
  final DateTime createdAt = DateTime.now();
  
  print("4️⃣ ค่าคงที่:");
  print("  PI (const): $PI");
  print("  Created (final): $createdAt\n");
  
  // 5. dynamic vs var
  dynamic flexibleData = "Hello";
  var strictData = "Dart";
  
  print("5️⃣ dynamic vs var:");
  print("  flexible: $flexibleData (${flexibleData.runtimeType})");
  print("  strict: $strictData (${strictData.runtimeType})\n");
  
  flexibleData = 123;  // ✓ ได้เปลี่ยน
  print("  flexible (after change): $flexibleData (${flexibleData.runtimeType})");
}
```

**Output:**
```
===== Lesson 1 Complete Example =====

1️⃣ ตัวแปรพื้นฐาน:
  ชื่อ: พิชญ์
  อายุ: 25 ปี
  เงินเดือน: $50000.5
  ทำงาน: true

2️⃣ ตรวจสอบชนิดข้อมูล:
  age type: int
  name type: String
  salary type: double

3️⃣ Collections:
  ตัวเลข: [10, 20, 30, 40, 50]
  โปรไฟล์: {name: พิชญ์, age: 25, skills: [Dart, Flutter, Java]}

4️⃣ ค่าคงที่:
  PI (const): 3.14159
  Created (final): 2026-04-24 14:30:45.123456

5️⃣ dynamic vs var:
  flexible: Hello (String)
  strict: Dart (String)

  flexible (after change): 123 (int)
```

---

## 🎯 Summary - สรุปหลัก
✅ Dart ใช้ syntax คล้าย Java  
✅ ประกาศตัวแปร 3 วิธี: explicit type, var, dynamic  
✅ const = compile-time, final = runtime  
✅ ใช้ String Interpolation `$var` หรือ `${expression}`  
✅ List และ Map สำหรับเก็บหลายค่า  
✅ ใช้ `.runtimeType` เพื่อเช็คชนิด
  x = [1, 2];   // ✓ ได้
  ```
- **var**: ชนิดถูกกำหนดเมื่อประกาศค่าแรก ไม่สามารถเปลี่ยนได้
  ```dart
  var name = "Dart";
  // name = 123;  // ✗ ผิด
  ```

## 10. const vs final - ค่าคงที่
- **const** (Compile-time):
  - ต้องประกาศค่าทันที
  - คำนวณในเวลา compile
  - `const double PI = 3.14159;`
  
- **final** (Runtime):
  - สามารถประกาศค่าทีหลังได้
  - คำนวณในเวลา runtime
  - `final String appName = "MyApp";`

## 11. Best Practices
- ใช้ชื่อตัวแปรที่มีความหมาย
- ใช้ camelCase สำหรับตัวแปรและฟังก์ชัน
- ใช้ CONSTANT_NAME (ตัวพิมพ์ใหญ่) สำหรับ const
- ลดใช้ dynamic เลือก var หรือชนิดเฉพาะ
- ใช้ const/final สำหรับค่าที่ไม่เปลี่ยน