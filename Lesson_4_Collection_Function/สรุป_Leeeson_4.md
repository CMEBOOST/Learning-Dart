สรุป บทที่ 4 - Collections (List & Map) และ Functions

---

## 📌 Setup
```dart
import 'dart:io';     // สำหรับ input/output
import 'dart:math';   // สำหรับ Random
```

---

## 1. List (ลิสต์) - Collection ของข้อมูลที่เป็นลำดับ

### 1.1 การสร้าง List
```dart
void main() {
  // แบบ 1: ชนิด dynamic (ได้ทุกชนิด)
  var mixedList = [1, 2.5, 'Hello', true];
  
  // แบบ 2: List<int>
  List<int> numbers = [10, 20, 30, 40, 50];
  
  // แบบ 3: List<String>
  List<String> colors = ['แดง', 'เขียว', 'น้ำเงิน'];
  
  // แบบ 4: List ว่างเปล่า
  List<int> emptyList = [];
  
  print(numbers);  // [10, 20, 30, 40, 50]
}
```

### 1.2 เข้าถึงสมาชิก (Index)
```dart
void main() {
  List<String> fruits = ['ส้ม', 'แอปเปิ้ล', 'กล้วย', 'องุ่น'];
  
  print(fruits[0]);           // ส้ม
  print(fruits[2]);           // กล้วย
  print(fruits.first);        // ส้ม (ตัวแรก)
  print(fruits.last);         // องุ่น (ตัวสุดท้าย)
  print(fruits.length);       // 4
}
```

### 1.3 แก้ไขค่า
```dart
void main() {
  List<String> animals = ['หมา', 'แมว', 'หนู'];
  
  animals[1] = 'ปลา';  // เปลี่ยน 'แมว' เป็น 'ปลา'
  print(animals);      // [หมา, ปลา, หนู]
}
```

### 1.4 เพิ่มสมาชิก
```dart
void main() {
  List<int> scores = [85, 90, 78];
  
  scores.add(95);           // เพิ่มตัวเดียว
  scores.addAll([88, 92]);  // เพิ่มหลายตัว
  scores += [100];          // ใช้ += เพิ่มเติม
  
  print(scores);  // [85, 90, 78, 95, 88, 92, 100]
}
```

### 1.5 ลบสมาชิก
```dart
void main() {
  List<String> items = ['ปากกา', 'ดินสอ', 'ยางลบ', 'ไม้บรรทัด'];
  
  items.remove('ดินสอ');   // ลบค่าที่ระบุ
  items.removeAt(0);       // ลบตามตำแหน่ง (Index 0)
  items.clear();           // ลบทั้งหมด
  
  print(items);
}
```

### 1.6 ตรวจสอบ List
```dart
void main() {
  List<String> names = ['สมชาย', 'วิชัย'];
  List<int> empty = [];
  
  print(names.length);           // 2
  print(names.isEmpty);          // false
  print(empty.isEmpty);          // true
  print(names.contains('สมชาย')); // true
  print(names.indexOf('วิชัย'));  // 1
}
```

### 1.7 วนลูป List - for Loop
```dart
void main() {
  List<int> numbers = [10, 20, 30, 40];
  
  for (int i = 0; i < numbers.length; i++) {
    print('Index $i: ${numbers[i]}');
  }
}
```

### 1.8 วนลูป List - for-in
```dart
void main() {
  List<String> cities = ['กรุงเทพ', 'เชียงใหม่', 'ขอนแก่น'];
  
  for (String city in cities) {
    print('- $city');
  }
}
```

### 1.9 วนลูป List - forEach
```dart
void main() {
  List<int> values = [5, 10, 15, 20];
  
  values.forEach((value) {
    print('ค่า: $value × 2 = ${value * 2}');
  });
}
```

### 1.10 insert() - แทรกสมาชิก
```dart
void main() {
  List<String> days = ['จันทร์', 'อังคาร', 'พฤหัสบดี'];
  
  days.insert(1, 'วันนี้');  // แทรก "วันนี้" ที่ index 1
  print(days);  // [จันทร์, วันนี้, อังคาร, พฤหัสบดี]
}
```

### 1.11 sort() - เรียงลำดับ
```dart
void main() {
  List<int> numbers = [50, 20, 80, 10, 40];
  
  numbers.sort();           // เรียงน้อยไปมาก
  print(numbers);           // [10, 20, 40, 50, 80]
  
  numbers.sort((a, b) => b.compareTo(a));  // เรียงมากไปน้อย
  print(numbers);           // [80, 50, 40, 20, 10]
}
```

---

## 2. Map (พจนานุกรม) - Collection ของคู่ key-value

### 2.1 การสร้าง Map
```dart
void main() {
  // แบบ 1: Map<String, String>
  Map<String, String> country = {
    'th': 'ไทย',
    'jp': 'ญี่ปุ่น',
    'us': 'สหรัฐอเมริกา',
  };
  
  // แบบ 2: Map<String, int>
  Map<String, int> age = {'สมชาย': 25, 'วิชัย': 30};
  
  // แบบ 3: Map ว่าง
  Map<String, int> empty = {};
  
  print(country);  // {th: ไทย, jp: ญี่ปุ่น, us: สหรัฐอเมริกา}
}
```

### 2.2 เข้าถึง Map - ใช้ Key
```dart
void main() {
  Map<String, String> country = {
    'th': 'ไทย',
    'jp': 'ญี่ปุ่น',
  };
  
  print(country['th']);  // ไทย
  print(country['jp']);  // ญี่ปุ่น
}
```

### 2.3 แก้ไขค่า
```dart
void main() {
  Map<String, int> phone = {'iPhone': 35999, 'Samsung': 39999};
  
  phone['iPhone'] = 40000;  // เปลี่ยนราคา
  print(phone);  // {iPhone: 40000, Samsung: 39999}
}
```

### 2.4 เพิ่มข้อมูลใหม่
```dart
void main() {
  Map<String, String> country = {'th': 'ไทย', 'jp': 'ญี่ปุ่น'};
  
  country['de'] = 'เยอรมัน';  // เพิ่มสมาชิกใหม่
  country['fr'] = 'ฝรั่งเศส';
  
  print(country);
}
```

### 2.5 Keys และ Values
```dart
void main() {
  Map<String, String> country = {
    'th': 'ไทย',
    'jp': 'ญี่ปุ่น',
    'us': 'สหรัฐ',
  };
  
  print(country.keys);     // (th, jp, us)
  print(country.values);   // (ไทย, ญี่ปุ่น, สหรัฐ)
  print(country.length);   // 3
}
```

### 2.6 วนลูป Map - for-in
```dart
void main() {
  Map<String, String> country = {'th': 'ไทย', 'jp': 'ญี่ปุ่น'};
  
  for (String key in country.keys) {
    print('$key = ${country[key]}');
  }
}
```

### 2.7 วนลูป Map - forEach
```dart
void main() {
  Map<String, int> age = {'สมชาย': 25, 'วิชัย': 30};
  
  age.forEach((name, years) {
    print('$name: $years ปี');
  });
}
```

### 2.8 ตรวจสอบ Map
```dart
void main() {
  Map<String, String> country = {'th': 'ไทย', 'jp': 'ญี่ปุ่น'};
  
  print(country.isEmpty);           // false
  print(country.length);            // 2
  print(country.containsKey('th'));  // true
  print(country.containsValue('ไทย')); // true
}
```

### 2.9 ลบข้อมูล
```dart
void main() {
  Map<String, String> country = {'th': 'ไทย', 'jp': 'ญี่ปุ่น', 'de': 'เยอรมัน'};
  
  country.remove('de');  // ลบสมาชิกตามที่ระบุ
  print(country);        // {th: ไทย, jp: ญี่ปุ่น}
  
  country.clear();       // ลบทั้งหมด
  print(country);        // {}
}
```

### 2.10 รวม Map
```dart
void main() {
  Map<String, String> map1 = {'th': 'ไทย', 'jp': 'ญี่ปุ่น'};
  Map<String, String> map2 = {'de': 'เยอรมัน', 'fr': 'ฝรั่งเศส'};
  
  map1.addAll(map2);
  print(map1);  // {th: ไทย, jp: ญี่ปุ่น, de: เยอรมัน, fr: ฝรั่งเศส}
}
```

### 2.11 Map ของ List
```dart
void main() {
  Map<String, List<String>> skills = {
    'สมชาย': ['Dart', 'Flutter', 'Java'],
    'วิชัย': ['Python', 'JavaScript'],
  };
  
  skills.forEach((name, skillList) {
    print('$name มีทักษะ: $skillList');
  });
}
```

### 2.12 Map ของ Map
```dart
void main() {
  Map<String, Map<String, int>> person = {
    'สมชาย': {'อายุ': 25, 'คะแนน': 85},
    'วิชัย': {'อายุ': 30, 'คะแนน': 92},
  };
  
  person.forEach((name, info) {
    print('$name: อายุ ${info['อายุ']}, คะแนน ${info['คะแนน']}');
  });
}
```

---

## 3. Functions (ฟังก์ชัน)

### 3.1 Function พื้นฐาน (ไม่มี parameter)
```dart
void main() {
  void sayHello() {
    print('สวัสดีชาวโลก!');
  }
  
  sayHello();  // เรียกใช้
}
```

### 3.2 Function ที่มี Parameter
```dart
void main() {
  void oddEven(int num) {
    if (num % 2 == 0) {
      print('$num เป็นเลขคู่');
    } else {
      print('$num เป็นเลขคี่');
    }
  }
  
  oddEven(12);  // Argument: 12
  oddEven(7);   // Argument: 7
}
```

### 3.3 Function ที่ส่งค่ากลับ (Return)
```dart
void main() {
  // ชนิดที่ส่งกลับ ชื่อฟังก์ชัน(parameter) { return ค่า; }
  
  String getGrade(int score) {
    if (score >= 80) {
      return 'A';
    } else if (score >= 70) {
      return 'B';
    } else {
      return 'C';
    }
  }
  
  print('คะแนน 85 ได้เกรด: ${getGrade(85)}');  // A
  print('คะแนน 75 ได้เกรด: ${getGrade(75)}');  // B
}
```

### 3.4 Function ที่มีหลาย Parameter
```dart
void main() {
  int add(int a, int b) {
    return a + b;
  }
  
  int multiply(int a, int b) {
    return a * b;
  }
  
  print('5 + 3 = ${add(5, 3)}');        // 8
  print('5 × 3 = ${multiply(5, 3)}');  // 15
}
```

### 3.5 Default Parameter (Positional Optional)
```dart
void main() {
  // ใช้ [] เพื่อให้ parameter เป็น optional
  void greet([String name = 'เพื่อน']) {
    print('สวัสดี $name!');
  }
  
  greet();           // ใช้ค่า default: สวัสดี เพื่อน!
  greet('สมชาย');    // สวัสดี สมชาย!
}
```

### 3.6 Named Parameter
```dart
void main() {
  // ใช้ {} เพื่อกำหนด named parameters
  void printInfo({
    required String name,
    required int age,
    String city = 'กรุงเทพ',
  }) {
    print('ชื่อ: $name');
    print('อายุ: $age ปี');
    print('เมือง: $city');
  }
  
  printInfo(name: 'สมปอง', age: 25);
  printInfo(name: 'วิชัย', age: 30, city: 'เชียงใหม่');
}
```

### 3.7 Function รับ List เป็น Parameter
```dart
void main() {
  int sumList(List<int> numbers) {
    int sum = 0;
    for (int num in numbers) {
      sum += num;
    }
    return sum;
  }
  
  List<int> myNumbers = [10, 20, 30, 40];
  print('รายการ: $myNumbers');
  print('ผลบวก: ${sumList(myNumbers)}');  // 100
}
```

### 3.8 Function ส่งคืน List
```dart
void main() {
  List<int> generateNumbers(int start, int end) {
    List<int> result = [];
    for (int i = start; i <= end; i++) {
      result.add(i);
    }
    return result;
  }
  
  print(generateNumbers(1, 5));  // [1, 2, 3, 4, 5]
}
```

### 3.9 Arrow Function (=>)
```dart
void main() {
  // ใช้ => สำหรับฟังก์ชันที่มีคำสั่งเดียว
  int multiply(int a, int b) => a * b;
  int square(int x) => x * x;
  
  print('5 × 3 = ${multiply(5, 3)}');  // 15
  print('5² = ${square(5)}');          // 25
}
```

### 3.10 Nullable Return Type
```dart
void main() {
  String? getGrade(int? score) {
    if (score == null) {
      return null;
    }
    if (score >= 80) {
      return 'A';
    } else {
      return 'B';
    }
  }
  
  print('คะแนน 85: ${getGrade(85)}');  // A
  print('คะแนน null: ${getGrade(null)}'); // null
}
```

### 3.11 Parameter vs Argument
```dart
void test(int a, String b) {
  //    ↑
  // a, b = Parameter (ตัวแปรในฟังก์ชัน)
}

test(10, "hello");
//   ↑     ↑
// 10, "hello" = Argument (ค่าที่ส่งเข้า)
```

---

## 📋 Complete Example - ตัวอย่างรวม
```dart
import 'dart:io';

void main() {
  print("===== Lesson 4 Complete Example =====\n");
  
  // 1. List
  print("1️⃣ List:");
  List<int> numbers = [5, 2, 8, 1, 9];
  print("  ตัวเลข: $numbers");
  print("  ความยาว: ${numbers.length}");
  numbers.sort();
  print("  เรียงลำดับ: $numbers\n");
  
  // 2. Map
  print("2️⃣ Map:");
  Map<String, int> scores = {
    'สมชาย': 85,
    'วิชัย': 92,
    'สมปอง': 78,
  };
  scores.forEach((name, score) {
    print("  $name: $score");
  });
  print("");
  
  // 3. Function ส่งค่ากลับ
  print("3️⃣ Function (Return):");
  String getStatus(int score) {
    if (score >= 80) return 'ผ่าน';
    return 'ไม่ผ่าน';
  }
  print("  85 คะแนน: ${getStatus(85)}");
  print("  60 คะแนน: ${getStatus(60)}\n");
  
  // 4. Function รับ List
  print("4️⃣ Function (List Parameter):");
  int sumList(List<int> nums) {
    int total = 0;
    for (int n in nums) {
      total += n;
    }
    return total;
  }
  List<int> myList = [10, 20, 30, 40];
  print("  รายการ: $myList");
  print("  ผลบวก: ${sumList(myList)}\n");
  
  // 5. Function Named Parameters
  print("5️⃣ Function (Named Parameters):");
  void printProfile({
    required String name,
    required int age,
    String job = 'ไม่ระบุ',
  }) {
    print("  ชื่อ: $name");
    print("  อายุ: $age");
    print("  งาน: $job");
  }
  printProfile(name: 'สมชาย', age: 25, job: 'วิศวกร');
}
```

**Output:**
```
===== Lesson 4 Complete Example =====

1️⃣ List:
  ตัวเลข: [5, 2, 8, 1, 9]
  ความยาว: 5
  เรียงลำดับ: [1, 2, 5, 8, 9]

2️⃣ Map:
  สมชาย: 85
  วิชัย: 92
  สมปอง: 78

3️⃣ Function (Return):
  85 คะแนน: ผ่าน
  60 คะแนน: ไม่ผ่าน

4️⃣ Function (List Parameter):
  รายการ: [10, 20, 30, 40]
  ผลบวก: 100

5️⃣ Function (Named Parameters):
  ชื่อ: สมชาย
  อายุ: 25
  งาน: วิศวกร
```

---

## 🎯 Summary - สรุปหลัก

### List
✅ เก็บข้อมูลที่เป็นลำดับ (Ordered)  
✅ เข้าถึงด้วย Index (0, 1, 2, ...)  
✅ `.add()`, `.remove()`, `.insert()`, `.sort()`  
✅ `.length`, `.isEmpty`, `.contains()`, `.indexOf()`  
✅ วนลูป: `for`, `for-in`, `forEach`

### Map
✅ เก็บข้อมูลในรูป key-value  
✅ เข้าถึงด้วย key: `map[key]`  
✅ `.keys`, `.values`, `.remove()`, `.clear()`  
✅ `.containsKey()`, `.containsValue()`  
✅ วนลูป: `for-in`, `forEach((key, value))`

### Function
✅ `void` = ไม่ส่งค่ากลับ  
✅ `return ค่า` = ส่งค่ากลับ  
✅ **Parameter** = ตัวแปรในฟังก์ชัน  
✅ **Argument** = ค่าที่ส่งเข้าไป  
✅ Default Parameter: `[type name = value]`  
✅ Named Parameter: `{required type name, type name2 = value}`  
✅ Arrow Function: `type name(params) => expression`  
✅ Nullable: `type?` อนุญาต null
