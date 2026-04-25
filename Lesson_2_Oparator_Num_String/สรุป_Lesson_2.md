สรุป บทที่ 2 - Operators, Numbers, และ Strings

---

## 📌 Setup
```dart
import 'dart:math';              // สำหรับ math functions
import 'package:intl/intl.dart'; // สำหรับ format numbers
```

---

## 1. Arithmetic Operators (ตัวดำเนินการทางคณิตศาสตร์)

| ตัวดำเนินการ | ชื่อ | ตัวอย่าง | ผลลัพธ์ |
|------------|------|---------|--------|
| `+` | บวก | 10 + 5 | 15 |
| `-` | ลบ | 10 - 5 | 5 |
| `*` | คูณ | 10 * 5 | 50 |
| `/` | หาร | 10 / 5 | 2.0 (double) |
| `~/` | หารปัดเศษ | 10 ~/ 3 | 3 (int) |
| `%` | หารเอาเศษ | 10 % 3 | 1 |

**ตัวอย่าง:**
```dart
void main() {
  int x = 10, y = 3;
  print("$x + $y = ${x + y}");      // 13
  print("$x - $y = ${x - y}");      // 7
  print("$x * $y = ${x * y}");      // 30
  print("$x / $y = ${x / y}");      // 3.333... (double)
  print("$x ~/ $y = ${x ~/ y}");    // 3 (int)
  print("$x % $y = ${x % y}");      // 1 (เศษ)
}
```

---

## 2. Assignment Operators (ตัวดำเนินการกำหนดค่า)

| ตัวดำเนินการ | เท่ากับ | ตัวอย่าง |
|------------|--------|---------|
| `=` | กำหนดค่า | x = 5 |
| `+=` | บวก และ กำหนด | x += 3 → x = x + 3 |
| `-=` | ลบ และ กำหนด | x -= 2 → x = x - 2 |
| `*=` | คูณ และ กำหนด | x *= 2 → x = x * 2 |
| `/=` | หาร และ กำหนด | x /= 4 → x = x / 4 |
| `~/=` | หารปัดเศษ และ กำหนด | x ~/= 2 → x = x ~/ 2 |
| `%=` | หารเอาเศษ และ กำหนด | x %= 3 → x = x % 3 |

**ตัวอย่าง:**
```dart
void main() {
  int x = 10;
  x += 5;    // x = 15
  x -= 3;    // x = 12
  x *= 2;    // x = 24
  x ~/= 5;   // x = 4
  print(x);  // 4
}
```

---

## 3. Increment & Decrement Operators

| ตัวดำเนินการ | ชื่อ | ตัวอย่าง |
|------------|------|---------|
| `++` | เพิ่มค่า 1 | x++ (เท่ากับ x = x + 1) |
| `--` | ลดค่า 1 | x-- (เท่ากับ x = x - 1) |

**ตัวอย่าง:**
```dart
void main() {
  int count = 0;
  count++;  // count = 1
  count++;  // count = 2
  count--;  // count = 1
  print(count);  // 1
}
```

---

## 4. Math Functions (ฟังก์ชันทางคณิตศาสตร์)

ต้อง `import 'dart:math';`

| ฟังก์ชัน | ความหมาย | ตัวอย่าง |
|---------|---------|---------|
| `.abs()` | ค่าแบบไม่ติดลบ (Absolute) | (-10).abs() → 10 |
| `.round()` | ปัดเศษใกล้ที่สุด | 3.7.round() → 4 |
| `.ceil()` | ปัดเศษขึ้น | 3.2.ceil() → 4 |
| `.floor()` | ปัดเศษลง | 3.7.floor() → 3 |
| `.truncate()` | ตัดทศนิยม | 3.9.truncate() → 3 |
| `sqrt(n)` | หารากที่สอง | sqrt(16) → 4.0 |
| `pow(base, exp)` | ยกกำลัง | pow(2, 3) → 8 |

**ตัวอย่าง:**
```dart
import 'dart:math';

void main() {
  double a = -10.5;
  double b = 3.7;
  
  print(a.abs());        // 10.5 (ค่าบวก)
  print(b.round());      // 4 (ปัดขึ้น)
  print(b.ceil());       // 4 (ปัดขึ้น)
  print(b.floor());      // 3 (ปัดลง)
  print(b.truncate());   // 3 (ตัดทศนิยม)
  print(sqrt(16));       // 4.0
  print(pow(2, 3));      // 8.0 (2 ยกกำลัง 3)
}
```

---

## 5. Number Formatting (จัดรูปแบบตัวเลข)

ต้อง `import 'package:intl/intl.dart';`

ใช้ `NumberFormat()` เพื่อคั่นหลักพันด้วย comma

**ตัวอย่าง:**
```dart
import 'package:intl/intl.dart';

void main() {
  var fmt = NumberFormat();
  
  int salary = 1234567;
  String formatted = fmt.format(salary);
  
  print(formatted);  // 1,234,567
  print(formatted.runtimeType);  // String
}
```

---

## 6. Random Numbers (สุ่มตัวเลข)

ต้อง `import 'dart:math';`

```dart
import 'dart:math';

void main() {
  var rand = Random();
  
  // สุ่ม int ตั้งแต่ 0 ถึง (max - 1)
  print(rand.nextInt(1000));      // 0-999
  print(rand.nextInt(100));       // 0-99
  
  // สุ่ม double ตั้งแต่ 0.0 ถึง 1.0
  double randDouble = rand.nextDouble();
  print(randDouble);              // 0.xxx
  print(randDouble * 256);        // 0-256
}
```

---

## 7. String Methods (ฟังก์ชันสำหรับ String)

### 7.1 String Properties
| เมธอด | ความหมาย | ตัวอย่าง |
|-------|---------|---------|
| `.length` | ความยาวของ String | "Dart".length → 4 |

### 7.2 String Search Methods
| เมธอด | ความหมาย | ตัวอย่าง |
|-------|---------|---------|
| `.contains(str)` | มี String นั้นไหม | "Dart".contains("ar") → true |
| `.indexOf(str)` | ตำแหน่งแรกที่พบ | "Dart".indexOf("a") → 1 |
| `.lastIndexOf(str)` | ตำแหน่งครั้งสุดท้าย | "Banana".lastIndexOf("a") → 5 |
| `.startsWith(str)` | ขึ้นต้นด้วย | "Dart".startsWith("D") → true |
| `.endsWith(str)` | ลงท้ายด้วย | "Dart".endsWith("t") → true |

### 7.3 String Manipulation Methods
| เมธอด | ความหมาย | ตัวอย่าง |
|-------|---------|---------|
| `.toLowerCase()` | แปลงเป็นพิมพ์เล็ก | "Dart".toLowerCase() → "dart" |
| `.toUpperCase()` | แปลงเป็นพิมพ์ใหญ่ | "Dart".toUpperCase() → "DART" |
| `.substring(start, end)` | ตัดส่วนของ String | "Dart".substring(0, 2) → "Da" |
| `.replaceFirst(old, new)` | แทนที่ครั้งแรก | "nono".replaceFirst("no", "yes") → "yesno" |
| `.replaceAll(old, new)` | แทนที่ทั้งหมด | "nono".replaceAll("no", "yes") → "yesyes" |
| `.split(delimiter)` | แยก String เป็น List | "a/b/c".split("/") → ["a", "b", "c"] |
| `.trim()` | ตัดช่องว่าง หน้า-หลัง | " hello ".trim() → "hello" |
| `.trimLeft()` | ตัดช่องว่างหน้า | " hello".trimLeft() → "hello" |
| `.trimRight()` | ตัดช่องว่างหลัง | "hello ".trimRight() → "hello" |
| `.padLeft(len, char)` | เติมทางซ้าย | "7".padLeft(3, "0") → "007" |
| `.padRight(len, char)` | เติมทางขวา | "7".padRight(3, "0") → "700" |

**ตัวอย่าง:**
```dart
void main() {
  String name = "Surachet";
  String fruit = "Banana";
  
  // Properties
  print(name.length);                    // 8
  
  // Search
  print(name.contains("S"));             // true
  print(name.indexOf("e"));              // 4
  print(fruit.lastIndexOf("a"));         // 5
  print(name.startsWith("Sura"));        // true
  print(fruit.endsWith("na"));           // true
  
  // Manipulation
  print(name.toLowerCase());             // surachet
  print(name.toUpperCase());             // SURACHET
  print(name.substring(0, 4));           // Sura
  print("nono".replaceAll("no", "yes")); // yesyes
  
  // Split & Trim
  var path = "you/can/do/what";
  print(path.split("/"));                // [you, can, do, what]
  print("  hello  ".trim());             // hello
  
  // Padding
  print("7".padLeft(3, "0"));            // 007
}
```

---

## 8. Type Casting - String ↔ Number (แปลงชนิดข้อมูล)

### String → Number
```dart
void main() {
  // String → int
  String s1 = "123";
  int num1 = int.parse(s1);     // 123
  
  // String → double
  String s2 = "3.14";
  double num2 = double.parse(s2);  // 3.14
  
  // String → num (ทั้ง int และ double)
  String s3 = "100";
  num n1 = num.parse(s3);       // 100
  
  String s4 = "99.99";
  num n2 = num.parse(s4);       // 99.99
}
```

### Number → String
```dart
void main() {
  // int → String
  int i = 192;
  String str1 = i.toString();    // "192"
  
  // double → String
  double d = 192.168;
  String str2 = d.toString();    // "192.168"
}
```

---

## 📋 Complete Example - ตัวอย่างรวม
```dart
import 'dart:math';
import 'package:intl/intl.dart';

void main() {
  print("===== Lesson 2 Complete Example =====\n");
  
  // 1. Arithmetic Operators
  print("1️⃣ Arithmetic Operators:");
  int a = 10, b = 3;
  print("  10 + 3 = ${a + b}");
  print("  10 - 3 = ${a - b}");
  print("  10 * 3 = ${a * b}");
  print("  10 / 3 = ${a / b}");
  print("  10 ~/ 3 = ${a ~/ b}");
  print("  10 % 3 = ${a % b}\n");
  
  // 2. Math Functions
  print("2️⃣ Math Functions:");
  double x = 3.7;
  print("  round($x) = ${x.round()}");
  print("  ceil($x) = ${x.ceil()}");
  print("  floor($x) = ${x.floor()}");
  print("  sqrt(16) = ${sqrt(16)}");
  print("  pow(2, 3) = ${pow(2, 3)}\n");
  
  // 3. Random
  print("3️⃣ Random Numbers:");
  var rand = Random();
  print("  Random int (0-99): ${rand.nextInt(100)}");
  print("  Random double (0-1): ${rand.nextDouble()}\n");
  
  // 4. Number Formatting
  print("4️⃣ Number Formatting:");
  var fmt = NumberFormat();
  int salary = 1250000;
  print("  Formatted: ${fmt.format(salary)}\n");
  
  // 5. String Methods
  print("5️⃣ String Methods:");
  String msg = "Hello Dart";
  print("  Length: ${msg.length}");
  print("  Uppercase: ${msg.toUpperCase()}");
  print("  Lowercase: ${msg.toLowerCase()}");
  print("  Contains 'Dart': ${msg.contains("Dart")}");
  print("  Substring (0-5): ${msg.substring(0, 5)}");
  print("  Replace: ${msg.replaceAll("Dart", "Flutter")}\n");
  
  // 6. Type Casting
  print("6️⃣ Type Casting:");
  String numStr = "123";
  int num = int.parse(numStr);
  print("  '123' (String) → $num (int)");
  
  int val = 456;
  String str = val.toString();
  print("  $val (int) → '$str' (String)");
}
```

**Output:**
```
===== Lesson 2 Complete Example =====

1️⃣ Arithmetic Operators:
  10 + 3 = 13
  10 - 3 = 7
  10 * 3 = 30
  10 / 3 = 3.3333333333333335
  10 ~/ 3 = 3
  10 % 3 = 1

2️⃣ Math Functions:
  round(3.7) = 4
  ceil(3.7) = 4
  floor(3.7) = 3
  sqrt(16) = 4.0
  pow(2, 3) = 8.0

3️⃣ Random Numbers:
  Random int (0-99): 42
  Random double (0-1): 0.8475...

4️⃣ Number Formatting:
  Formatted: 1,250,000

5️⃣ String Methods:
  Length: 10
  Uppercase: HELLO DART
  Lowercase: hello dart
  Contains 'Dart': true
  Substring (0-5): Hello
  Replace: Hello Flutter

6️⃣ Type Casting:
  '123' (String) → 123 (int)
  456 (int) → '456' (String)
```

---

## 🎯 Summary - สรุปหลัก
✅ Arithmetic Operators: `+`, `-`, `*`, `/`, `~/`, `%`  
✅ Assignment Operators: `=`, `+=`, `-=`, `*=`, `/=`, `~/=`, `%=`  
✅ Increment/Decrement: `++`, `--`  
✅ Math Functions: `abs()`, `round()`, `ceil()`, `floor()`, `sqrt()`, `pow()`  
✅ Number Formatting: `NumberFormat()` สำหรับคั่นหลักพัน  
✅ Random: `Random().nextInt()`, `nextDouble()`  
✅ String Methods: การค้นหา, แปลง, แทนที่, แยก  
✅ Type Casting: `int.parse()`, `double.parse()`, `.toString()`
