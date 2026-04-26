สรุป บทที่ 3 - Conditions, Loops, และ Null Safety

---

## 📌 Setup
```dart
import 'dart:io';     // สำหรับ stdin, stdout
import 'dart:math';   // สำหรับ Random
```

---

## 1. Comparison Operators (ตัวดำเนินการเปรียบเทียบ)

| ตัวดำเนินการ | ชื่อ | ตัวอย่าง | ผลลัพธ์ |
|------------|------|---------|--------|
| `==` | เท่ากับ | 5 == 5 | true |
| `!=` | ไม่เท่ากับ | 5 != 3 | true |
| `>` | มากกว่า | 10 > 5 | true |
| `<` | น้อยกว่า | 3 < 8 | true |
| `>=` | มากกว่าหรือเท่ากับ | 5 >= 5 | true |
| `<=` | น้อยกว่าหรือเท่ากับ | 3 <= 5 | true |

**ตัวอย่าง:**
```dart
void main() {
  int a = 10, b = 5;
  print(a == b);      // false
  print(a != b);      // true
  print(a > b);       // true
  print(a <= b);      // false
  
  // String Comparison
  String name1 = "Dart";
  String name2 = "dart";
  print(name1 == name2);  // false (case-sensitive)
  print("Hello" == "Hello");  // true
}
```

---

## 2. Logical Operators (ตัวดำเนินการตรรมศาสตร์)

| ตัวดำเนินการ | ชื่อ | ความหมาย |
|------------|------|---------|
| `&&` | AND (และ) | ทั้งสองเป็นจริง = จริง |
| `\|\|` | OR (หรือ) | อย่างน้อยหนึ่งจริง = จริง |
| `!` | NOT (ไม่) | เปลี่ยนเป็นตรงข้าม |

**Truth Tables:**
```
AND (&&):
true  && true  = true
true  && false = false
false && false = false

OR (||):
true  || true  = true
true  || false = true
false || false = false

NOT (!):
!true  = false
!false = true
```

**ตัวอย่าง:**
```dart
void main() {
  // AND (&&)
  print((5 > 3) && (10 < 20));    // true && true = true
  print((5 > 3) && (10 > 20));    // true && false = false
  
  // OR (||)
  print((5 > 10) || (10 < 20));   // false || true = true
  print((5 > 10) || (10 > 20));   // false || false = false
  
  // NOT (!)
  print(!(5 > 10));               // true
  print(!(5 < 10));               // false
}
```

---

## 3. Conditional Statements (คำสั่งเงื่อนไข)

### 3.1 if Statement
```dart
void main() {
  int age = 18;
  
  if (age >= 18) {
    print("You are an adult");
  }
}
```

### 3.2 if-else Statement
```dart
void main() {
  int num = 7;
  
  if (num % 2 == 0) {
    print("Even number");
  } else {
    print("Odd number");
  }
}
```

### 3.3 if-else if-else Statement
```dart
void main() {
  int score = 75;
  
  if (score >= 80) {
    print("Grade: A");
  } else if (score >= 70) {
    print("Grade: B");
  } else if (score >= 60) {
    print("Grade: C");
  } else {
    print("Grade: F");
  }
}
```

### 3.4 Ternary Operator (ตัวดำเนินการสามตัว)
```dart
// รูปแบบ: condition ? valueIfTrue : valueIfFalse

void main() {
  int age = 20;
  String status = (age >= 18) ? "Adult" : "Kid";
  print(status);  // Adult
  
  int a = 10, b = 5;
  int max = (a > b) ? a : b;
  print(max);  // 10
}
```

### 3.5 Switch-Case Statement
```dart
void main() {
  int day = 3;
  
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    default:
      print("Invalid day");
  }
}
```

---

## 4. Loops (การวนลูป)

### 4.1 for Loop
```dart
void main() {
  // นับขึ้น 0-9
  for (int i = 0; i < 10; i++) {
    print(i);
  }
  
  // นับลง 10-1
  for (int i = 10; i > 0; i--) {
    print(i);
  }
  
  // เพิ่มทีละ 0.5
  for (double i = 0; i <= 5; i += 0.5) {
    print(i);
  }
}
```

### 4.2 while Loop
```dart
void main() {
  int count = 0;
  
  while (count < 5) {
    print(count);
    count++;
  }
  
  // Example: User input until correct
  String password = "";
  while (password != "abc123") {
    password = stdin.readLineSync() ?? "";
  }
  print("Correct!");
}
```

### 4.3 do-while Loop
```dart
void main() {
  // ทำก่อน อย่างน้อย 1 ครั้ง แล้วตรวจสอบเงื่อนไข
  int i = 0;
  
  do {
    print(i);
    i++;
  } while (i < 5);
}
```

### 4.4 break Statement
```dart
void main() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      break;  // ออกจากลูป
    }
    print(i);  // 0 1 2 3 4
  }
}
```

### 4.5 continue Statement
```dart
void main() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      continue;  // ข้ามการวนรอบนี้
    }
    print(i);  // 0 1 2 3 4 6 7 8 9
  }
}
```

---

## 5. Null Safety (การจัดการค่า Null)

### 5.1 Nullable Types (ชนิดข้อมูล Nullable)
```dart
void main() {
  int? score;        // ✅ อนุญาต null
  score = 100;       // ✅ OK
  score = null;      // ✅ OK
  
  String? name = null;  // ✅ OK
  
  // int age = null;   // ❌ ERROR! ห้าม null
}
```

### 5.2 Null-Aware Operators

#### 5.2.1 `??` (if-null)
```dart
void main() {
  int? a = null;
  int b = a ?? 0;      // ถ้า a เป็น null ใช้ 0
  print(b);            // 0
  
  String? name = null;
  print(name ?? "Guest");  // Guest
}
```

#### 5.2.2 `??=` (null-aware assignment)
```dart
void main() {
  int? x;
  x ??= 10;      // ถ้า x เป็น null ให้ = 10
  print(x);      // 10
  
  x ??= 20;      // x ไม่เป็น null ข้าม
  print(x);      // 10
}
```

#### 5.2.3 `?.` (safe navigation)
```dart
void main() {
  String? name = null;
  int? len = name?.length;  // ถ้า null ไม่ crash
  print(len);               // null
  
  name = "Dart";
  len = name?.length;       // เรียก method ได้
  print(len);               // 4
}
```

#### 5.2.4 `!` (null assertion - เสี่ยง!)
```dart
void main() {
  int? score = 100;
  int value = score!;     // บังคับ: "ฉันแน่ใจ ไม่เป็น null"
  print(value);           // 100
  
  // int? nullScore = null;
  // int bad = nullScore!;  // ❌ CRASH! Runtime Error
}
```

---

## 6. User Input (รับข้อมูลจากผู้ใช้)

### 6.1 Read String Input
```dart
import 'dart:io';

void main() {
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  print("Hello $name");
}
```

### 6.2 Read Integer Input
```dart
import 'dart:io';

void main() {
  stdout.write("Enter your age: ");
  int? age = int.parse(stdin.readLineSync() ?? "0");
  print("You are $age years old");
}
```

### 6.3 Read with Null Safety
```dart
import 'dart:io';

void main() {
  stdout.write("Enter score: ");
  String? input = stdin.readLineSync();
  
  if (input != null && input.isNotEmpty) {
    int score = int.parse(input);
    print("Score: $score");
  } else {
    print("Invalid input");
  }
}
```

### 6.4 Safe Reading (ปลอดภัยที่สุด)
```dart
import 'dart:io';

void main() {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? "Guest";
  
  stdout.write("Enter your age: ");
  int age = int.parse(stdin.readLineSync() ?? "0");
  
  print("$name is $age years old");
}
```

---

## 📋 Complete Example - ตัวอย่างรวม
```dart
import 'dart:io';

void main() {
  print("===== Lesson 3 Complete Example =====\n");
  
  // 1. Comparison & Logical Operators
  print("1️⃣ Comparison & Logical:");
  int x = 10, y = 5;
  print("  x > y: ${x > y}");
  print("  (x > y) && (x < 20): ${(x > y) && (x < 20)}");
  print("  (x == 10) || (y == 10): ${(x == 10) || (y == 10)}\n");
  
  // 2. if-else if-else
  print("2️⃣ Conditional (if-else if-else):");
  int score = 85;
  if (score >= 80) {
    print("  Grade: A");
  } else if (score >= 70) {
    print("  Grade: B");
  } else {
    print("  Grade: C");
  }
  print("");
  
  // 3. Ternary Operator
  print("3️⃣ Ternary Operator:");
  String status = (x > y) ? "x is greater" : "y is greater";
  print("  $status\n");
  
  // 4. Switch-case
  print("4️⃣ Switch-case:");
  int day = 3;
  switch (day) {
    case 1:
      print("  Monday");
      break;
    case 3:
      print("  Wednesday");
      break;
    default:
      print("  Other day");
  }
  print("");
  
  // 5. for Loop
  print("5️⃣ for Loop (1-5):");
  for (int i = 1; i <= 5; i++) {
    print("  $i", );
  }
  print("");
  
  // 6. while Loop
  print("6️⃣ while Loop:");
  int count = 0;
  while (count < 3) {
    print("  Count: $count");
    count++;
  }
  print("");
  
  // 7. break & continue
  print("7️⃣ break & continue:");
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue;    // ข้าม
    if (i == 4) break;       // ออก
    print("  $i");
  }
  print("");
  
  // 8. Null Safety
  print("8️⃣ Null Safety:");
  int? score1 = null;
  int result = score1 ?? 0;
  print("  score1 ?? 0 = $result");
  
  String? name = "Dart";
  print("  name?.length = ${name?.length}\n");
  
  // 9. User Input
  print("9️⃣ User Input:");
  stdout.write("  Enter your name: ");
  String userName = stdin.readLineSync() ?? "Guest";
  print("  Hello $userName!");
}
```

---

## 🎯 Summary - สรุปหลัก

### Comparison Operators
✅ `==`, `!=`, `>`, `<`, `>=`, `<=`

### Logical Operators
✅ `&&` (AND), `||` (OR), `!` (NOT)

### Conditionals
✅ `if`, `else if`, `else`  
✅ Ternary: `condition ? valueTrue : valueFalse`  
✅ `switch-case` สำหรับหลายกรณี

### Loops
✅ `for` - เมื่อรู้จำนวนรอบ  
✅ `while` - เมื่อไม่รู้จำนวนรอบ  
✅ `do-while` - ทำก่อน แล้วตรวจเงื่อนไข  
✅ `break` - ออกจากลูป  
✅ `continue` - ข้ามรอบนี้

### Null Safety
✅ `int?` - Nullable type (อนุญาต null)  
✅ `??` - if-null (ค่า default)  
✅ `?.` - Safe navigation (ปลอดภัย)  
✅ `!` - Null assertion (เสี่ยง)

### Input
✅ `stdin.readLineSync()` - รับข้อมูล  
✅ `int.parse()` - แปลง String → int  
✅ ใช้ `??` และ `?.` สำหรับ null safety
