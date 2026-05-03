//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 029: Generic (ประเภททั่วไป)
//═══════════════════════════════════════════════════════════════════════════════

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                    📖 Generic (ประเภททั่วไป) คืออะไร?                        ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: กลไก OOP ที่ให้คลาส/method สามารถทำงานกับหลายชนิดข้อมูล
 โดยต้องระบุชนิดเมื่อสร้าง instance โดยไม่ต้องเขียนคลาสซ้ำหลายตัว

 📌 ข้อมูลสำคัญ:
   • Generic ใช้ <T> เป็นตัวแทนชนิดข้อมูล (T = Type)
   • Type parameter สามารถเป็นอะไรก็ได้ (String, int, double, custom class)
   • Generic ช่วยลดโค้ดที่ซ้ำซ้อน
   • Compile-time type safety

 🎯 ประเภท Generic:
   1. Generic Class: class Box<T> { }
   2. Generic Method: T getValue<T>() { }
   3. Generic with Constraints: class Container<T extends Comparable> { }
   4. Multiple Type Parameters: class Pair<K, V> { }

 💡 ข้อดีของ Generic:
   ✓ ลดการเขียนโค้ดซ้ำ
   ✓ Type safe (ตรวจสอบชนิดตั้งแต่ compile time)
   ✓ Reusability
   ✓ ชัดเจนเจตนา

 ⚠️ สำคัญ:
   • <T> เป็น placeholder สำหรับชนิด
   • ต้องระบุชนิดเมื่อสร้าง instance
   • Generic ไม่มี runtime overhead ใน Dart
   • T สามารถ override ได้

 📌 Syntax:
   // Generic Class
   class Box<T> {
     T value;
     Box(this.value);
   }

   // การใช้
   var intBox = Box<int>(42);
   var stringBox = Box<String>('Hello');

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                       🏗️ ตัวอย่าง: Generic
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Simple Generic Class
//───────────────────────────────────────────────────────────────────────────────

class Box<T> {
  T? value;

  Box(this.value);

  void set(T newValue) {
    value = newValue;
  }

  T? get() {
    return value;
  }

  void display() {
    print('📦 Box: $value (ชนิด: ${T.toString()})');
  }

  String getType() {
    return value.runtimeType.toString();
  }
}

/*
💡 อธิบาย:
   • Box<T> คือ generic class
   • <T> เป็นตัวแทนชนิดข้อมูล
   • Box<int>, Box<String>, Box<double> ต่างกันเลย
   • set(), get() ทำงานกับ T
   • display() แสดง value และ type
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Generic with Multiple Parameters
//───────────────────────────────────────────────────────────────────────────────

class Pair<K, V> {
  K key;
  V value;

  Pair(this.key, this.value);

  void display() {
    print('🔑 Key: $key (${K.toString()}), Value: $value (${V.toString()})');
  }

  String getInfo() {
    return 'Pair<$K, $V>';
  }
}

/*
💡 อธิบาย:
   • Pair<K, V> มี 2 type parameters
   • K และ V สามารถเป็นชนิดต่างกัน
   • Pair<String, int> แตกต่างจาก Pair<int, String>
   • display() แสดง key และ value พร้อม type
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Generic Container (List-like)
//───────────────────────────────────────────────────────────────────────────────

class Container<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  void remove(T item) {
    items.remove(item);
  }

  int count() {
    return items.length;
  }

  void display() {
    print('📦 Container: $items');
  }

  List<T> getAll() {
    return items;
  }

  T? getFirst() {
    return items.isNotEmpty ? items.first : null;
  }

  void printAll() {
    for (int i = 0; i < items.length; i++) {
      print('  [$i] ${items[i]}');
    }
  }
}

/*
💡 อธิบาย:
   • Container<T> เก็บ List<T>
   • add(), remove() ทำงานกับ T
   • getAll() return List<T>
   • getFirst() return T? (nullable)
   • printAll() loop ผ่าน items ทั้งหมด
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Generic with Constraint
//───────────────────────────────────────────────────────────────────────────────

abstract class Comparable {
  int compareTo(dynamic other);
}

class Score implements Comparable {
  int points;

  Score(this.points);

  @override
  int compareTo(dynamic other) {
    if (other is Score) {
      return points.compareTo(other.points);
    }
    return 0;
  }

  @override
  String toString() => 'Score($points)';
}

class Repository<T extends Comparable> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  T? getMax() {
    if (items.isEmpty) return null;
    T max = items[0];
    for (T item in items) {
      if (item.compareTo(max) > 0) {
        max = item;
      }
    }
    return max;
  }

  T? getMin() {
    if (items.isEmpty) return null;
    T min = items[0];
    for (T item in items) {
      if (item.compareTo(min) < 0) {
        min = item;
      }
    }
    return min;
  }

  void displayAll() {
    print('Repository: $items');
  }
}

/*
💡 อธิบาย:
   • Repository<T extends Comparable>
   • T ต้องเป็น Comparable เท่านั้น
   • getMax(), getMin() ใช้ compareTo()
   • ตรวจสอบชนิดตั้งแต่ compile time
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 5: Generic Method
//───────────────────────────────────────────────────────────────────────────────

class Utility {
  // Generic method
  static T? findFirst<T>(List<T> items, bool Function(T) predicate) {
    for (T item in items) {
      if (predicate(item)) {
        return item;
      }
    }
    return null;
  }

  // Generic method swap
  static void swap<T>(List<T> list, int i, int j) {
    if (i >= 0 && i < list.length && j >= 0 && j < list.length) {
      T temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }

  // Generic method print list
  static void printList<T>(List<T> items) {
    print('📋 List: ');
    for (int i = 0; i < items.length; i++) {
      print('  [$i] ${items[i]}');
    }
  }
}

/*
💡 อธิบาย:
   • findFirst<T>() เป็น generic method
   • predicate เป็น function ที่ accept T
   • swap<T>() swap สมาชิกในลิส
   • printList<T>() print ทุก item
   • Type สามารถ infer จากการเรียก
*/

//═════════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═════════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 029: Generic (ประเภททั่วไป)\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Simple Generic Class
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Simple Generic Class:');
  print('────────────────────\n');

  var intBox = Box<int>(42);
  intBox.display();
  print('ค่า: ${intBox.get()}');
  intBox.set(100);
  intBox.display();
  print('');

  var stringBox = Box<String>('Hello Dart');
  stringBox.display();
  print('ค่า: ${stringBox.get()}');
  stringBox.set('Generic!');
  stringBox.display();
  print('');

  var doubleBox = Box<double>(3.14);
  doubleBox.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Generic with Multiple Parameters
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Generic with Multiple Parameters:');
  print('────────────────────────────────\n');

  var pair1 = Pair<String, int>('age', 30);
  pair1.display();
  print('Info: ${pair1.getInfo()}');
  print('');

  var pair2 = Pair<String, double>('score', 95.5);
  pair2.display();
  print('Info: ${pair2.getInfo()}');
  print('');

  var pair3 = Pair<int, String>(1, 'one');
  pair3.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Generic Container
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Generic Container:');
  print('──────────────────\n');

  var intContainer = Container<int>();
  intContainer.add(10);
  intContainer.add(20);
  intContainer.add(30);
  print('📊 Integer Container:');
  intContainer.display();
  print('Count: ${intContainer.count()}');
  print('First: ${intContainer.getFirst()}');
  print('All Items:');
  intContainer.printAll();
  print('');

  var stringContainer = Container<String>();
  stringContainer.add('Dart');
  stringContainer.add('Flutter');
  stringContainer.add('Generic');
  print('📊 String Container:');
  stringContainer.display();
  print('Count: ${stringContainer.count()}');
  print('First: ${stringContainer.getFirst()}');
  print('All Items:');
  stringContainer.printAll();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Generic with Constraint
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Generic with Constraint:');
  print('───────────────────────\n');

  var scoreRepo = Repository<Score>();
  scoreRepo.add(Score(85));
  scoreRepo.add(Score(92));
  scoreRepo.add(Score(78));
  scoreRepo.add(Score(95));

  print('📊 Score Repository:');
  scoreRepo.displayAll();
  print('Max Score: ${scoreRepo.getMax()}');
  print('Min Score: ${scoreRepo.getMin()}');
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ Generic Method
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Generic Method:');
  print('────────────────\n');

  List<int> numbers = [10, 20, 30, 40, 50];
  print('📋 Original Numbers:');
  Utility.printList<int>(numbers);
  print('');

  print(
    '🔍 Find first > 25: ${Utility.findFirst<int>(numbers, (n) => n > 25)}',
  );
  print('');

  print('🔄 Swap index 0 dan 4:');
  Utility.swap<int>(numbers, 0, 4);
  Utility.printList<int>(numbers);
  print('');

  List<String> words = ['Hello', 'Dart', 'Generic', 'Type'];
  print('📋 Words:');
  Utility.printList<String>(words);
  print('');

  print(
    '🔍 Find first == "Dart": ${Utility.findFirst<String>(words, (w) => w == 'Dart')}',
  );
  print('');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ GENERIC คืออะไร
   - ประเภททั่วไป (Generic Type)
   - ช่วยสร้าง class/method ที่ทำงานหลายชนิด
   - ไม่ต้องเขียนคลาสซ้ำหลายตัว
   - Type safe

2️⃣ TYPE PARAMETER
   - <T> เป็นตัวแทนชนิดข้อมูล
   - Box<T> เป็น generic class
   - T สามารถเป็นอะไรก็ได้
   - ต้องระบุชนิดเมื่อสร้าง instance

3️⃣ GENERIC CLASS
   class Box<T> {
     T? value;
     void set(T newValue) { }
     T? get() { }
   }

   var box = Box<int>(42);
   var box = Box<String>('Hello');

4️⃣ MULTIPLE TYPE PARAMETERS
   class Pair<K, V> {
     K key;
     V value;
   }

   var pair = Pair<String, int>('age', 30);

5️⃣ GENERIC METHOD
   T findFirst<T>(List<T> items, bool Function(T) predicate)
   - Static method ที่ generic
   - Type สามารถ infer จากการเรียก

6️⃣ GENERIC WITH CONSTRAINT
   class Repository<T extends Comparable> {
     // T ต้องเป็น Comparable
   }
   - ต้องการ T ที่มี method บางตัว
   - Compile-time checking

7️⃣ ประโยชน์ของ Generic
   ✓ Code Reusability
   ✓ Type Safety
   ✓ ลดโค้ดซ้ำ
   ✓ ชัดเจนเจตนา

✨ Generic Syntax:
   ┌─────────────────────────────────┐
   │ Generic Class:                  │
   │ class Box<T> { }                │
   │                                 │
   │ Generic Method:                 │
   │ T method<T>(T param) { }        │
   │                                 │
   │ Generic Constraint:             │
   │ class R<T extends Type> { }     │
   │                                 │
   │ Multiple Parameters:            │
   │ class Pair<K, V> { }            │
   └─────────────────────────────────┘

✨ Naming Convention:
   • T: Type (ทั่วไป)
   • K: Key (สำหรับ key ใน map)
   • V: Value (สำหรับ value ใน map)
   • E: Element (สำหรับ element ใน collection)
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Simple Generic Stack
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Generic Stack<T>:
  • List<T> items
  • push(T item) - เพิ่ม item
  • pop() → T? - นำ item ออก
  • peek() → T? - ดู top item
  • isEmpty() → bool
  • size() → int

จากนั้น:
  1. สร้าง Stack<int>
  2. push(10, 20, 30)
  3. pop() และ peek()
  4. สร้าง Stack<String>
  5. ทดสอบทั้งคู่

📌 แบบฝึกหัดที่ 2: Generic Queue
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Generic Queue<T>:
  • enqueue(T item) - เพิ่มจากด้านหลัง
  • dequeue() → T? - นำออกจากด้านหน้า
  • front() → T? - ดู item หน้า
  • isEmpty() → bool
  • displayAll()

จากนั้น:
  1. สร้าง Queue<String>
  2. enqueue('first', 'second', 'third')
  3. dequeue() และ front()
  4. displayAll()

📌 แบบฝึกหัดที่ 3: Generic Dictionary
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Generic Dictionary<K, V>:
  • add(K key, V value)
  • get(K key) → V?
  • containsKey(K key) → bool
  • remove(K key)
  • getAll() → List<Pair<K, V>>

จากนั้น:
  1. สร้าง Dictionary<String, int> เก็บ name-age
  2. add() หลายคู่
  3. ค้นหาด้วย get(), containsKey()
  4. แสดง getAll()

📌 แบบฝึกหัดที่ 4: Challenge - Generic Cache
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Generic Cache<K, V> with TTL:
  • put(K key, V value) - เพิ่ม
  • get(K key) → V? - ดึง
  • isExpired(K key) → bool - เช็ค expire
  • clear() - ลบทั้งหมด
  • size() → int
  • CacheEntry<V> (value, timestamp)

จากนั้น:
  1. สร้าง Cache<String, String>
  2. put() และ get() ข้อมูล
  3. เช็ค isExpired()
  4. clear()

💡 เคล็ดลับ:
   ✓ <T> เป็นตัวแทนชนิด
   ✓ ต้องระบุชนิดเมื่อสร้าง instance
   ✓ ใช้ ? เมื่อ T สามารถ null ได้
   ✓ Generic method สามารถ infer type
   ✓ extends ใช้สำหรับ constraint
   ✓ K, V ใช้สำหรับ key-value pairs
*/
