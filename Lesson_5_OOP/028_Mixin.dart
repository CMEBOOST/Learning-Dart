//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 027: Mixin (การผสมผสานคุณสมบัติ)
//═══════════════════════════════════════════════════════════════════════════════

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                     📖 Mixin (การผสมผสาน) คืออะไร?                           ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: กลไกในภาษา Dart ที่ให้เพิ่มคุณสมบัติ (Method/Property) จากหลายแหล่ง
 โดยไม่ต้องใช้ Multiple Inheritance

 📌 ข้อมูลสำคัญ:
   • Dart ไม่รองรับ Multiple Inheritance
   • Mixin คือการแก้ปัญหาโดยการ "mix in" คุณสมบัติ
   • ใช้คำว่า with เพื่อรวม mixin
   • Mixin เป็นการทำให้โค้ดซ้ำใช้ได้มากขึ้น

 🎯 ประเภท Mixin:
   1. Simple Mixin: 1 mixin กับ 1 class
   2. Multiple Mixins: หลาย mixin กับ 1 class
   3. Mixin on: mixin ที่มีข้อกำหนด (on superclass)
   4. Chained Mixins: mixin ที่ใช้ mixin อื่น

 💡 Mixin vs Inheritance:
   • Inheritance: is-a relationship (Dog IS-A Animal)
   • Mixin: has-a capability (Dog HAS-A ability to run)

 📌 Syntax:
   mixin NameMixin {
     // Method และ Property
   }

   class MyClass extends Parent with Mixin1, Mixin2 {
     // class content
   }

 ⚠️ สำคัญ:
   • Mixin ไม่มี constructor
   • Mixin ไม่มี super class
   • Class สามารถใช้ mixin หลายตัว

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                        🏗️ ตัวอย่าง: Mixin
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Simple Mixin
//───────────────────────────────────────────────────────────────────────────────

mixin CanRun {
  void run() {
    print('🏃 วิ่ง!');
  }
}

mixin CanSwim {
  void swim() {
    print('🏊 ว่ายน้ำ!');
  }
}

mixin CanFly {
  void fly() {
    print('🦅 บิน!');
  }
}

class Animal {
  String name = '';

  void display() {
    print('สัตว์: $name');
  }
}

// Dog: สืบทอด Animal + mixin CanRun
class Dog extends Animal with CanRun {
  @override
  String get name => 'สุนัข';
}

// Duck: สืบทอด Animal + mixin CanRun, CanSwim, CanFly
class Duck extends Animal with CanRun, CanSwim, CanFly {
  @override
  String get name => 'เป็ด';
}

// Penguin: สืบทอด Animal + mixin CanSwim, CanRun
class Penguin extends Animal with CanSwim, CanRun {
  @override
  String get name => 'เพนกวิน';
}

/*
💡 อธิบาย:
   • Dog มี method: display() (จากแม่), run() (จาก CanRun)
   • Duck มี method: display(), run(), swim(), fly()
   • Penguin มี method: display(), swim(), run()
   • ไม่ต้องสืบทอดจากหลาย class
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Mixin ด้วย Property
//───────────────────────────────────────────────────────────────────────────────

mixin Loggable {
  String logPrefix = '[LOG]';

  void log(String message) {
    print('$logPrefix $message');
  }

  void warning(String message) {
    print('$logPrefix ⚠️  $message');
  }

  void error(String message) {
    print('$logPrefix ❌ $message');
  }
}

mixin Trackable {
  String? userId;
  DateTime? createdAt;

  void track(String user) {
    userId = user;
    createdAt = DateTime.now();
    print('👤 Tracked by: $user');
  }

  void showInfo() {
    print('ผู้ใช้: $userId, สร้างเมื่อ: $createdAt');
  }
}

class Logger with Loggable {
  void process() {
    log('Process started');
    warning('Process running');
    error('Process failed');
  }
}

class Document with Loggable, Trackable {
  String title = '';

  void create(String name, String user) {
    title = name;
    track(user);
    log('Document created: $title');
  }

  void show() {
    print('เอกสาร: $title');
    showInfo();
  }
}

/*
💡 อธิบาย:
   • Loggable mixin มี property: logPrefix
   • Trackable mixin มี: userId, createdAt
   • Document ใช้ทั้ง 2 mixin
   • Property และ Method มาจากทั้ง 2 mixin
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Mixin on (มีข้อกำหนด)
//───────────────────────────────────────────────────────────────────────────────

class Person {
  String name = '';
  int age = 0;

  void display() {
    print('ชื่อ: $name, อายุ: $age ปี');
  }
}

mixin Trainable on Person {
  // Trainable mixin ต้องใช้กับ Person หรือ subclass ของ Person
  int level = 0;

  void train() {
    level++;
    print('📚 $name ฝึกสิ่งใหม่! Level: $level');
  }

  void trainSkill(String skill) {
    print('$name ฝึก $skill');
    train();
  }
}

class Employee extends Person with Trainable {
  void work() {
    print('💼 $name ทำงาน (Level: $level)');
  }
}

/*
💡 อธิบาย:
   • mixin Trainable on Person: ต้องใช้กับ Person
   • Employee extends Person with Trainable: ถูก ✓
   • Trainable สามารถใช้ Person properties
   • class Trainable with Trainable: ผิด ❌ (ต้อง Person base)
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Mixin Composition
//───────────────────────────────────────────────────────────────────────────────

mixin Drawable {
  void draw() {
    print('🎨 วาดภาพ');
  }
}

mixin Movable {
  int x = 0;
  int y = 0;

  void move(int dx, int dy) {
    x += dx;
    y += dy;
    print('📍 ย้ายไป ($x, $y)');
  }
}

mixin Colorable {
  String color = 'ขาว';

  void setColor(String newColor) {
    color = newColor;
    print('🎨 เปลี่ยนสี เป็น $newColor');
  }

  void showColor() {
    print('สี: $color');
  }
}

class Shape {
  String name = '';
}

class Circle extends Shape with Drawable, Movable, Colorable {
  void display() {
    print('วงกลม: $name');
    showColor();
    draw();
    move(10, 20);
  }
}

/*
💡 อธิบาย:
   • Circle ใช้ 3 mixin: Drawable, Movable, Colorable
   • ต่างคนต่างมี method และ property
   • ทั้ง 3 mixin ทำงานร่วมกัน
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 5: Mixin ด้วยการ Abstract
//───────────────────────────────────────────────────────────────────────────────

mixin Comparable {
  int compareTo(dynamic other) {
    return 0; // Default
  }

  bool isGreater(dynamic other) => compareTo(other) > 0;
  bool isLess(dynamic other) => compareTo(other) < 0;
  bool isEqual(dynamic other) => compareTo(other) == 0;
}

class Score with Comparable {
  int points = 0;

  Score(this.points);

  @override
  int compareTo(dynamic other) {
    if (other is Score) {
      return points.compareTo(other.points);
    }
    return 0;
  }

  void display() {
    print('คะแนน: $points');
  }
}

/*
💡 อธิบาย:
   • Comparable mixin ให้ method isGreater, isLess, isEqual
   • Score override compareTo() เพื่อระบุวิธีเปรียบเทียบ
   • Mixin ให้ reusable logic
*/

//═════════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═════════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 027: Mixin (การผสมผสาน)\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Simple Mixin
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Simple Mixin (CanRun, CanSwim, CanFly):');
  print('────────────────────────────────────────\n');

  var dog = Dog();
  dog.display();
  dog.run();
  print('');

  var duck = Duck();
  duck.display();
  duck.run();
  duck.swim();
  duck.fly();
  print('');

  var penguin = Penguin();
  penguin.display();
  penguin.run();
  penguin.swim();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Mixin ด้วย Property
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Mixin ด้วย Property (Loggable & Trackable):');
  print('──────────────────────────────────────────\n');

  var logger = Logger();
  logger.process();
  print('');

  var doc = Document();
  doc.create('Report.pdf', 'user001');
  doc.show();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Mixin on (มีข้อกำหนด)
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Mixin on (Trainable on Person):');
  print('──────────────────────────────\n');

  var emp = Employee();
  emp.name = 'สมชาย';
  emp.age = 30;
  emp.display();
  emp.trainSkill('Dart');
  emp.trainSkill('Flutter');
  emp.work();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Mixin Composition
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Mixin Composition (Drawable, Movable, Colorable):');
  print('──────────────────────────────────────────────\n');

  var circle = Circle();
  circle.name = 'Circle1';
  circle.setColor('แดง');
  circle.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ Mixin ด้วย Abstract Method
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Mixin ด้วย Comparable:');
  print('───────────────────────\n');

  var score1 = Score(85);
  var score2 = Score(90);
  var score3 = Score(85);

  score1.display();
  score2.display();
  score3.display();

  print('');
  print('85 > 90: ${score1.isGreater(score2)}');
  print('85 < 90: ${score1.isLess(score2)}');
  print('85 == 85: ${score1.isEqual(score3)}');
  print('');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ MIXIN คืออะไร
   - วิธีการเพิ่มความสามารถให้กับ class
   - ทำให้อ้อมปัญหา Multiple Inheritance
   - Composition over Inheritance

2️⃣ SYNTAX
   mixin MixinName {
     // Method และ Property
   }

   class MyClass extends Parent with Mixin1, Mixin2 { }

3️⃣ SIMPLE MIXIN
   - 1 mixin กับ 1 class: with CanRun
   - ใช้ method จาก mixin ได้เลย

4️⃣ MULTIPLE MIXINS
   - หลาย mixin: with Mixin1, Mixin2, Mixin3
   - ทั้งหมดถูก "mix in" ให้กับ class
   - ได้ทุก method จากทั้งหมด

5️⃣ MIXIN WITH PROPERTY
   - Mixin สามารถมี property ได้
   - Class ที่ใช้ mixin ได้ property เหล่านั้น
   - Class สามารถ override ได้

6️⃣ MIXIN ON (มีข้อกำหนด)
   mixin MixinName on BaseClass {
     // สามารถใช้ BaseClass property
   }
   - ต้องใช้กับ BaseClass หรือ subclass เท่านั้น

7️⃣ MIXIN vs INHERITANCE
   Inheritance: Dog IS-A Animal
   Mixin: Dog HAS-A ability to run

✨ ลำดับ with:
   class D extends B with M1, M2, M3 { }
   - M1 เรียกก่อน
   - M2 เรียกถัดไป
   - M3 เรียกล่าสุด
   - class D override ได้

✨ ข้อกำหนด Mixin:
   ✓ ไม่มี extends/with
   ✓ ไม่มี constructor
   ✓ ไม่มี super() call
   ✓ สามารถมี method และ property
   ✓ สามารถมี abstract method
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Simple Mixin
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Mixin:
  • CanEat: eat()
  • CanSleep: sleep()
  • CanBark: bark()

สร้าง Class:
  • Animal (base)
  • Dog extends Animal with CanEat, CanSleep, CanBark

จากนั้น:
  1. สร้าง Dog instance
  2. เรียก eat(), sleep(), bark()
  3. ดูว่า method มาจาก mixin ทั้งหมด

📌 แบบฝึกหัดที่ 2: Mixin ด้วย Property
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Mixin:
  • Saveable: save(), load()
  • Deletable: delete()
  • Shareable: share(user)

สร้าง Class:
  • Document with Saveable, Deletable, Shareable

จากนั้น:
  1. สร้าง Document
  2. ทดสอบ save(), load(), delete(), share()

📌 แบบฝึกหัดที่ 3: Mixin on
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง:
  • Base: Vehicle (brand, year)
  • Mixin: Maintainable on Vehicle (lastService, maintenance())
  • Class: Car extends Vehicle with Maintainable

จากนั้น:
  1. สร้าง Car
  2. ตั้ง brand, year
  3. เรียก maintenance()
  4. เห็น mixin ใช้ Vehicle property

📌 แบบฝึกหัดที่ 4: Challenge - E-Commerce Product
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Mixin:
  • Sellable: price, sell()
  • Rateable: rating, review()
  • Discountable: discount, applyDiscount()

สร้าง Class:
  • Product (name, stock)
  • Laptop extends Product with Sellable, Rateable, Discountable

จากนั้น:
  1. สร้าง Laptop
  2. ตั้งค่า price, rating, discount
  3. ทดสอบ sell(), review(), applyDiscount()
  4. แสดงข้อมูลทั้งหมด

💡 เคล็ดลับ:
   ✓ Mixin ไม่มี constructor
   ✓ สามารถใช้ multiple mixins ได้
   ✓ ใช้ with เพื่อรวม mixin
   ✓ Mixin on ต้องระบุ base class
   ✓ Order of mixins สำคัญ
*/
