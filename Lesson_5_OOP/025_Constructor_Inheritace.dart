//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 025: Constructor & Inheritance (คอนสตรักเตอร์กับการสืบทอด)
//═══════════════════════════════════════════════════════════════════════════════

import 'dart:math';

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║           📖 Constructor & Inheritance (คอนสตรักเตอร์กับการสืบทอด)          ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: Constructor ไม่สืบทอดอัตโนมัติจากคลาสแม่ คลาสลูกต้องสร้าง
 Constructor ของตัวเองและเรียก Constructor ของคลาสแม่โดยใช้ super()

 📌 ข้อมูลสำคัญ:
   • Constructor ไม่สืบทอด (ชื่อต้องตรงกับชื่อคลาส)
   • Property และ Method สืบทอดได้
   • ต้องใช้ super() เพื่อเรียก Constructor ของแม่
   • super() เขียนใน Initializer List (:)

 🎯 ประเภท Constructor Inheritance:
   1. Default Constructor: ไม่มี parameter, super() แบบธรรมชาติ
   2. Parameterized: เรียก super() ด้วยค่า
   3. Named Parameters: super ด้วย named parameters
   4. Constructor with Field Initialization: ฟิลด์พิเศษ
   5. Multiple Constructors: หลาย constructor ในคลาสเดียว

 💡 Initializer List (:) คืออะไร:
   - บรรทัดระหว่าง () และ {} ของ Constructor
   - ใช้เรียก super() หรือ this()
   - มี Field initialization
   - ต้องอยู่ก่อน Constructor body

 📌 Syntax:
   class Child extends Parent {
     Child({required param}) : super(parentParam: param) {
       // Constructor body
     }
   }

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                  🏗️ ตัวอย่าง: Constructor & Inheritance
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Simple Constructor Inheritance
//───────────────────────────────────────────────────────────────────────────────

class Animal {
  String name = '';
  int age = 0;

  // Constructor ของ Parent
  Animal({required this.name, required this.age}) {
    print('🐾 Animal Constructor เรียก - $name ($age ปี)');
  }

  void display() {
    print('สัตว์: $name, อายุ: $age ปี');
  }
}

class Dog extends Animal {
  String breed = '';

  // Constructor ของ Child - เรียก super() ก่อน
  Dog({required String name, required int age, required this.breed})
    : super(name: name, age: age) {
    print('🐕 Dog Constructor เรียก - $breed');
  }

  void displayDog() {
    print('สุนัข: $name, พันธุ์: $breed, อายุ: $age ปี');
  }
}

/*
💡 อธิบาย:
   • Dog Constructor รับ name, age, breed
   • ใช้ super(name: name, age: age) เรียก Animal Constructor
   • Initializer List (:) ใช้เรียก super()
   • เขียน print ใน Constructor body หลังเรียก super()
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Multi-level Constructor
//───────────────────────────────────────────────────────────────────────────────

class Vehicle {
  String brand = '';
  int year = 0;

  Vehicle({required this.brand, required this.year}) {
    print('🚗 Vehicle Constructor: $brand ($year)');
  }
}

class Car extends Vehicle {
  int doors = 0;

  Car({required String brand, required int year, required this.doors})
    : super(brand: brand, year: year) {
    print('🚙 Car Constructor: $doors ประตู');
  }

  void displayCar() {
    print('$brand - ปี $year - $doors ประตู');
  }
}

class ElectricCar extends Car {
  int batteryCapacity = 0;

  ElectricCar({
    required String brand,
    required int year,
    required int doors,
    required this.batteryCapacity,
  }) : super(brand: brand, year: year, doors: doors) {
    print('⚡ ElectricCar Constructor: $batteryCapacity kWh');
  }

  void displayElectric() {
    print(
      '$brand (ไฟฟ้า) - ปี $year - $doors ประตู - แบตเตอรี่: $batteryCapacity kWh',
    );
  }
}

/*
💡 อธิบาย:
   • ElectricCar → Car → Vehicle (3 ระดับ)
   • ทุก Constructor ต้องเรียก super() ของแม่
   • Parameters ต้องผ่านไปตามห่วงโซ่
   • Initializer List เรียก super() ก่อน body
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Constructor ด้วย Default Values
//───────────────────────────────────────────────────────────────────────────────

class Person {
  String name = '';
  int age = 0;

  Person({required this.name, this.age = 0}) {
    print('👤 Person: $name');
  }
}

class Student extends Person {
  String studentId = '';
  double gpa = 0;

  Student({
    required String name,
    int age = 0,
    required this.studentId,
    this.gpa = 0,
  }) : super(name: name, age: age) {
    print('🎓 Student ID: $studentId');
  }

  void displayStudent() {
    print('นักเรียน: $name ($age ปี) - ID: $studentId - GPA: $gpa');
  }
}

/*
💡 อธิบาย:
   • Parent ใช้ default value: age = 0
   • Child ก็ใช้ default value เช่นเดียวกัน
   • Child เรียก super ด้วยค่า parent parameters
   • Parameter ที่มี default ไม่จำเป็นต้องส่ง
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Field Initialization ก่อน super()
//───────────────────────────────────────────────────────────────────────────────

class Product {
  String name = '';
  double price = 0;

  Product({required this.name, required this.price}) {
    print('📦 Product: $name - $price บาท');
  }

  double getPrice() => price;
}

class DiscountedProduct extends Product {
  double discountRate = 0;
  late double finalPrice;

  DiscountedProduct({
    required String name,
    required double price,
    required this.discountRate,
  }) : super(name: name, price: price) {
    // คำนวณราคาหลังเรียก super()
    finalPrice = price * (1 - discountRate / 100);
    print('💰 ลด $discountRate% = $finalPrice บาท');
  }

  void displayPrice() {
    print('สินค้า: $name');
    print('ราคาเดิม: $price บาท');
    print('ส่วนลด: $discountRate%');
    print('ราคาสุดท้าย: $finalPrice บาท');
  }
}

/*
💡 อธิบาย:
   • DiscountedProduct ทำการคำนวณใน Constructor body
   • Initializer List: super() เรียกจากแม่
   • Constructor body: งาน logic เพิ่มเติม
   • late keyword: ประกาศให้เนื่อร หลังเรียก super()
*/

//═════════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═════════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 025: Constructor & Inheritance\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Simple Constructor Inheritance
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Simple Constructor Inheritance:');
  print('───────────────────────────────\n');

  var dog = Dog(name: 'ตัวตี๋', age: 3, breed: 'ลาบราดอร์');
  print('');
  dog.display();
  dog.displayDog();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Multi-level Constructor (3 ชั้น)
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Multi-level Constructor:');
  print('────────────────────────\n');

  var tesla = ElectricCar(
    brand: 'Tesla',
    year: 2024,
    doors: 4,
    batteryCapacity: 100,
  );
  print('');
  tesla.displayElectric();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Constructor ด้วย Default Values
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Constructor ด้วย Default Values:');
  print('──────────────────────────────\n');

  var student1 = Student(name: 'สมชาย', age: 20, studentId: 'ST001', gpa: 3.5);
  print('');
  student1.displayStudent();
  print('');

  // ใช้ default value
  var student2 = Student(name: 'วิชัย', studentId: 'ST002');
  print('');
  student2.displayStudent();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Field Initialization และ Calculation
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Field Initialization & Calculation:');
  print('────────────────────────────────\n');

  var product1 = DiscountedProduct(
    name: 'Laptop',
    price: 30000,
    discountRate: 20,
  );
  print('');
  product1.displayPrice();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ ตัวอย่างอื่นๆ: Constructor Order
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Constructor Order (ลำดับการเรียก):');
  print('──────────────────────────────\n');

  print('📌 สร้าง ElectricCar ตัวใหม่:');
  var car = ElectricCar(
    brand: 'BMW',
    year: 2025,
    doors: 2,
    batteryCapacity: 150,
  );
  print('');
  print('✅ สังเกต: Constructor เรียกตามลำดับ Vehicle → Car → ElectricCar\n');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ CONSTRUCTOR ไม่สืบทอด
   - Property และ Method สืบทอดได้
   - Constructor ต้องสร้างใหม่ในคลาสลูก
   - ชื่อ Constructor ต้องตรงกับชื่อคลาส

2️⃣ SUPER() KEYWORD
   - เรียก Constructor ของคลาสแม่
   - เขียนใน Initializer List (:)
   - เรียก super() ก่อน Constructor body
   - super() ได้รับ parameters ของแม่

3️⃣ INITIALIZER LIST (:)
   - บรรทัดระหว่าง () และ {}
   - ใช้เรียก super() หรือ this()
   - Initialize fields และ assertions
   - ต้องอยู่ก่อน body

4️⃣ SINGLE INHERITANCE CONSTRUCTOR
   class Child extends Parent {
     Child({required param}) : super(parentParam: param) {
       // body
     }
   }

5️⃣ MULTI-LEVEL CONSTRUCTOR
   Parent → Child → GrandChild
   - ทุก Constructor ต้องเรียก super()
   - Parameters ผ่านตามห่วงโซ่
   - Initializer List: super() ของโดยตรง

6️⃣ DEFAULT VALUES ใน Constructor
   Parent({this.age = 0}) ✓
   Child({int age = 0}) : super(age: age) ✓

7️⃣ CONSTRUCTOR ORDER
   ElectricCar → Car → Vehicle
   - เรียก Parent Constructor ก่อน
   - เรียกจากบนลงล่าง
   - Initialize fields เมื่อ super() เสร็จ

✨ การประมวลผล Constructor:
   ┌─────────────────────────────────┐
   │ Initializer List:               │
   │ 1. super() / this()             │
   │ 2. Field initialization         │
   │ 3. Assertions                   │
   │                                 │
   │ Constructor Body:               │
   │ 4. Logic & statements           │
   └─────────────────────────────────┘
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Simple Constructor Inheritance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Employee
    - Properties: name, salary
    - Constructor รับ name, salary
    
  • Child: Manager extends Employee
    - Properties: department
    - Constructor รับ name, salary, department
    - เรียก super(name: name, salary: salary)

จากนั้น:
  1. สร้าง Manager instance
  2. ตั้งค่า name, salary, department ผ่าน Constructor
  3. แสดงข้อมูล

📌 แบบฝึกหัดที่ 2: Multi-level Constructor
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Hierarchy:
  • Level 1: Shape (color)
    - Constructor({required this.color})
    
  • Level 2: Circle extends Shape (radius)
    - Constructor({required String color, required this.radius})
    - เรียก super(color: color)
    
  • Level 3: Sphere extends Circle (dimension)
    - Constructor ทั้ง 3 parameters + dimension
    - เรียก super ตามลำดับ

จากนั้น:
  1. สร้าง Sphere
  2. คำนวณพื้นที่และปริมาตร
  3. แสดงข้อมูล

📌 แบบฝึกหัดที่ 3: Constructor ด้วย Calculation
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Item (name, quantity, unitPrice)
    - Constructor: ใช้ named parameters
    
  • Child: CartItem extends Item (discount)
    - Constructor: รับ name, quantity, unitPrice, discount
    - คำนวณ totalPrice = (quantity * unitPrice) * (1 - discount/100)
    - Store ใน field

จากนั้น:
  1. สร้าง CartItem
  2. คำนวณราคาทั้งหมด
  3. แสดงราคา: เดิม, ส่วนลด, สุดท้าย

📌 แบบฝึกหัดที่ 4: Challenge - Bank System
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Level 1: Account (accountNumber, owner, balance)
    - Constructor: ใช้ named parameters
    
  • Level 2: SavingsAccount extends Account (interestRate)
    - Constructor ระบุ interestRate
    
  • Level 3: FixedDepositAccount extends SavingsAccount (term)
    - Constructor ระบุ term (เดือน)

จากนั้น:
  1. สร้าง FixedDepositAccount
  2. ฝากเงิน 100,000 บาท
  3. คำนวณดอกเบี้ย (balance * interestRate * term/12)
  4. แสดงข้อมูลทั้งหมด

💡 เคล็ดลับ:
   ✓ ใช้ : (Initializer List) เรียก super()
   ✓ เขียน print ในแต่ละ Constructor เพื่อดูลำดับ
   ✓ ทดสอบ Default values
   ✓ ใช้ late keyword เมื่อต้องคำนวณหลัง super()
   ✓ Named parameters ทำให้ Constructor ชัดเจน
*/
