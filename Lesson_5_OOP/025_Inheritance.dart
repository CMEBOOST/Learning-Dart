//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 024: Inheritance (การสืบทอด)
//═══════════════════════════════════════════════════════════════════════════════

// import 'dart:math';

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                  📖 Inheritance (การสืบทอด) คืออะไร?                         ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: กลไกใน OOP ที่ให้คลาสสามารถสืบทอด Property และ Method จาก
 คลาสแม่ (Parent Class) เพื่อไม่ให้ต้องเขียนโค้ดซ้ำ

 📌 คำศัพท์สำคัญ:
   • Parent Class / Super Class: คลาสแม่ (คลาสที่เป็นต้นแบบ)
   • Child Class / Sub Class: คลาสลูก (คลาสที่สืบทอด)
   • extends: คำหลักใน Dart เพื่อสูบทอด

 🎯 ประเภทการสืบทอด:
   1. Single Inheritance: 1 คลาสลูกสืบทอดจาก 1 คลาสแม่
   2. Multi-level Inheritance: A → B → C (ห่วงโซ่)
   3. Hierarchical (ใน Dart ใช้ Mixin แทน Multiple)

 💡 ประโยชน์ของ Inheritance:
   ✓ ไม่ต้องเขียนโค้ดซ้ำ
   ✓ ใช้ซ้ำ Property และ Method จากคลาสแม่
   ✓ ทำให้โค้ดเป็นระเบียบ
   ✓ ง่ายต่อการขยายและแก้ไข
   ✓ สร้าง Hierarchy ที่มีความหมาย

 📌 Syntax:
   class ChildClass extends ParentClass {
     // Property และ Method ของคลาสลูก
   }

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                     🏗️ ตัวอย่าง: การสืบทอด
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Simple Inheritance
//───────────────────────────────────────────────────────────────────────────────

class Animal {
  String name = '';
  int age = 0;

  void eat() {
    print('🍖 $name กำลังกิน');
  }

  void sleep() {
    print('😴 $name กำลังนอน');
  }

  void display() {
    print('ชื่อ: $name, อายุ: $age ปี');
  }
}

// Dog สืบทอดจาก Animal
class Dog extends Animal {
  String breed = '';

  void bark() {
    print('🐕 วาฟ วาฟ! ฉันคือ $name');
  }
}

/*
💡 อธิบาย:
   • Dog สืบทอด name, age, eat(), sleep(), display() จาก Animal
   • Dog เพิ่ม property breed และ method bark() ใหม่
   • Dog สามารถใช้ทั้ง method จากแม่และของตัวเอง
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Shape Hierarchy
//───────────────────────────────────────────────────────────────────────────────

class Shape {
  String color = '';

  void display() {
    print('สี: $color');
  }

  double getArea() {
    return 0;
  }
}

class Circle extends Shape {
  double radius = 0;

  @override
  double getArea() {
    return 3.14159 * radius * radius;
  }

  void displayCircle() {
    print(
      '🔵 วงกลม - รัศมี: $radius, พื้นที่: ${getArea().toStringAsFixed(2)}',
    );
  }
}

class Rectangle extends Shape {
  double width = 0;
  double height = 0;

  @override
  double getArea() {
    return width * height;
  }

  void displayRectangle() {
    print(
      '▢ สี่เหลี่ยม - กว้าง: $width, สูง: $height, พื้นที่: ${getArea().toStringAsFixed(2)}',
    );
  }
}

/*
💡 อธิบาย:
   • Shape คือ parent class
   • Circle และ Rectangle สืบทอดจาก Shape
   • ทั้งคู่สืบทอด color และ display()
   • ทั้งคู่ override getArea() เพื่อคำนวณพื้นที่เอง
   • @override: annotation ที่บ่งบอกว่ากำลัง override method
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Multi-level Inheritance
//───────────────────────────────────────────────────────────────────────────────

class Vehicle {
  String brand = '';
  int year = 0;

  void start() {
    print('🔧 $brand เครื่องยนต์สตาร์ท');
  }

  void stop() {
    print('🛑 $brand เครื่องยนต์หยุด');
  }
}

class Car extends Vehicle {
  int doors = 0;

  void openDoor() {
    print('🚪 เปิดประตูทั้ง $doors บาน');
  }
}

class ElectricCar extends Car {
  int batteryPercentage = 0;

  void chargeBattery() {
    print('🔋 ชาร์จแบตเตอรี่');
    batteryPercentage = 100;
  }

  void displayInfo() {
    print(
      '$brand - ${year} ปี - $doors ประตู - แบตเตอรี่: $batteryPercentage%',
    );
  }
}

/*
💡 อธิบาย:
   • Vehicle → Car → ElectricCar (ห่วงโซ่ 3 ชั้น)
   • ElectricCar สืบทอด: brand, year, doors, start(), stop(), openDoor()
   • ElectricCar เพิ่มของใหม่: batteryPercentage, chargeBattery(), displayInfo()
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: เข้าถึง Parent Class (super)
//───────────────────────────────────────────────────────────────────────────────

class Employee {
  String name = '';
  double salary = 0;

  void display() {
    print('พนักงาน: $name, เงินเดือน: $salary บาท');
  }
}

class Manager extends Employee {
  int teamSize = 0;

  @override
  void display() {
    // เรียก method จาก parent ด้วย super.
    super.display();
    print('คนในทีม: $teamSize คน');
  }

  void giveBonus(double amount) {
    salary += amount;
    print('💰 $name ได้โบนัส $amount บาท');
  }
}

/*
💡 อธิบาย:
   • super. ใช้เข้าถึง method/property จากคลาสแม่
   • Manager override display() แต่เรียก super.display() ด้วย
*/

//═════════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 024: Inheritance (การสืบทอด)\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Simple Inheritance
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Simple Inheritance (สืบทอดง่ายๆ):');
  print('─────────────────────────────────\n');

  var dog = Dog();
  dog.name = 'ตัวตี๋';
  dog.age = 3;
  dog.breed = 'ลาบราดอร์';

  print('📌 ข้อมูลสุนัข:');
  dog.display(); // Method จากแม่
  print('พันธุ์: ${dog.breed}'); // Property ของลูก
  dog.eat(); // Method จากแม่
  dog.bark(); // Method ของลูก
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Inheritance กับ Override
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Inheritance กับ Override:');
  print('─────────────────────────\n');

  var circle = Circle();
  circle.color = 'แดง';
  circle.radius = 5;
  circle.display();
  circle.displayCircle();
  print('');

  var rect = Rectangle();
  rect.color = 'น้ำเงิน';
  rect.width = 10;
  rect.height = 5;
  rect.display();
  rect.displayRectangle();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Multi-level Inheritance
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Multi-level Inheritance (สืบทอดหลายชั้น):');
  print('──────────────────────────────────────────\n');

  var tesla = ElectricCar();
  tesla.brand = 'Tesla';
  tesla.year = 2024;
  tesla.doors = 4;

  print('📌 ข้อมูลรถยนต์:');
  tesla.start();
  tesla.openDoor();
  tesla.chargeBattery();
  tesla.displayInfo();
  tesla.stop();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Super keyword
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Super keyword (เรียก Parent Method):');
  print('─────────────────────────────────────\n');

  var manager = Manager();
  manager.name = 'สมชาย';
  manager.salary = 50000;
  manager.teamSize = 5;

  print('📌 ข้อมูลผู้จัดการ:');
  manager.display(); // Override method ที่เรียก super
  manager.giveBonus(5000);
  print('เงินเดือนใหม่: ${manager.salary} บาท\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ Parent vs Child Property
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Parent vs Child (คลาสแม่ไม่เข้าถึง Child):');
  print('────────────────────────────────────────\n');

  var animal = Animal();
  animal.name = 'หมา';
  animal.age = 2;

  print('📌 Animal (Parent):');
  animal.display();
  animal.eat();
  // animal.breed; // ❌ Error! Parent ไม่มี breed
  // animal.bark(); // ❌ Error! Parent ไม่มี bark()
  print('');

  print('📌 Dog (Child) สามารถทำได้ทั้งหมด:');
  var dog2 = Dog();
  dog2.name = 'ลูกหมา';
  dog2.age = 1;
  dog2.breed = 'ปูดเดิล';
  dog2.display();
  dog2.eat();
  dog2.bark();
  print('');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ INHERITANCE (การสืบทอด)
   - คลาสลูกสืบทอด Property และ Method จากคลาสแม่
   - ใช้ extends เพื่อสูบทอด

2️⃣ PARENT vs CHILD
   - Parent Class: คลาสแม่ (ต้นแบบ)
   - Child Class: คลาสลูก (สืบทอด)
   - Child เข้าถึง Parent ได้ แต่ Parent เข้าถึง Child ไม่ได้

3️⃣ SINGLE INHERITANCE
   - 1 Child สืบทอดจาก 1 Parent
   - class Child extends Parent { }

4️⃣ MULTI-LEVEL INHERITANCE
   - ห่วงโซ่การสืบทอด: A → B → C
   - C สืบทอด B, B สืบทอด A
   - C สามารถใช้ของ B และ A ได้

5️⃣ OVERRIDE (แทนที่)
   - Child เขียน method ที่ชื่อเดียวกับ Parent
   - ใช้ @override annotation
   - Child method จะแทนที่ Parent method

6️⃣ SUPER KEYWORD
   - เรียก method/property จากคลาสแม่
   - super.method() หรือ super.property
   - ใช้ใน override method

7️⃣ ประโยชน์ของ Inheritance
   ✓ Code Reusability - ไม่ต้องเขียนซ้ำ
   ✓ Hierarchy - สร้างโครงสร้างที่มีความสัมพันธ์
   ✓ Maintainability - ง่ายต่อการแก้ไข
   ✓ Extensibility - ง่ายต่อการขยาย

✨ ข้อกำหนด Inheritance:
   ┌─────────────────────────────────┐
   │ class Child extends Parent {     │
   │   // Child content              │
   │                                 │
   │   @override                     │
   │   void method() {               │
   │     super.method(); // call     │
   │     // Child specific code      │
   │   }                             │
   │ }                               │
   └─────────────────────────────────┘
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Simple Inheritance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Person (name, age, display())
  • Child: Student extends Person (studentId, gpa, displayStudent())

จากนั้น:
  1. สร้าง Instance Student
  2. ตั้งค่า name, age, studentId, gpa
  3. เรียก display() จาก Parent
  4. เรียก displayStudent() ของตัวเอง

📌 แบบฝึกหัดที่ 2: Override Method
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Animal (name, sound())
  • Child 1: Cat extends Animal (override sound() → "เหมียว")
  • Child 2: Dog extends Animal (override sound() → "วาฟ")
  • Child 3: Cow extends Animal (override sound() → "มูมู")

จากนั้น:
  1. สร้าง Instance ของ Cat, Dog, Cow
  2. ตั้งชื่อให้แต่ละตัว
  3. เรียก sound() ของแต่ละตัว

📌 แบบฝึกหัดที่ 3: Multi-level Inheritance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Hierarchy:
  • Level 1: LivingThing (eat(), sleep())
  • Level 2: Animal extends LivingThing (move())
  • Level 3: Bird extends Animal (fly())

จากนั้น:
  1. สร้าง Instance Bird
  2. เรียก eat() จาก LivingThing
  3. เรียก move() จาก Animal
  4. เรียก fly() จากตัวเอง

📌 แบบฝึกหัดที่ 4: Challenge - Bank System
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: BankAccount (balance, deposit(), withdraw(), display())
  • Child 1: SavingsAccount extends BankAccount (interestRate, addInterest())
  • Child 2: CheckingAccount extends BankAccount (overdraftLimit)

จากนั้น:
  1. สร้าง SavingsAccount: เริ่มต้น 10000, interest 2.5%
  2. ฝากเงิน 5000
  3. เพิ่มดอกเบี้ย
  4. แสดงข้อมูล
  5. สร้าง CheckingAccount: เริ่มต้น 5000, overdraft 2000
  6. ถอนเงิน (ทดสอบ overdraft)
  7. แสดงข้อมูล

💡 เคล็ดลับ:
   ✓ ใช้ extends เพื่อสูบทอด
   ✓ ใช้ @override เมื่อแทนที่ method
   ✓ ใช้ super. เพื่อเรียก Parent method
   ✓ Child เข้าถึง Parent ได้ แต่ Parent เข้าถึง Child ไม่ได้
   ✓ สร้าง Hierarchy ที่มีความสัมพันธ์ที่มีความหมาย
*/
