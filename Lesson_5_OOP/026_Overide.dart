//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 026: Override (การเขียนทับ)
//═══════════════════════════════════════════════════════════════════════════════

// import 'dart:math';

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                    📖 Override (การเขียนทับ) คืออะไร?                        ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: กลไก OOP ที่ให้คลาสลูกสามารถเขียนทับ Method หรือ Property
 ของคลาสแม่เพื่อให้มีความสำหรับของตัวเองที่แตกต่างจากแม่

 📌 ข้อมูลสำคัญ:
   • Override = เขียนทับ (override) method ด้วยชื่อเดียวกัน
   • ใช้ @override annotation เพื่อชี้ว่ากำลัง override
   • Method ที่ override ต้องตรงชื่อ parameter และ return type
   • Override Method ถูกเรียกจากคลาสลูก ไม่ใช่คลาสแม่

 🎯 ประเภท Override:
   1. Method Override: เขียนทับวิธีการทำงาน
   2. Property Override: เขียนทับค่า property (ไม่บ่อยนัก)
   3. Getter/Setter Override: เขียนทับการ get/set

 💡 ทำไมต้อง Override:
   ✓ คลาสลูกมีวิธีการที่เฉพาะเจาะจง
   ✓ ปรับแต่งพฤติกรรมของ Method
   ✓ สมดุลกับสัญญา (Contract) ของคลาสแม่

 📌 Syntax:
   class Child extends Parent {
     @override
     void method() {
       // ลอจิค ที่แตกต่างจาก Parent
     }
   }

 ⚠️ สำคัญ: Signature ต้องตรงกัน!
   Parent: int calculate(int a, int b) => a + b;
   Child: @override
          int calculate(int a, int b) => a * b;

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                       🏗️ ตัวอย่าง: Override
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Method Override ง่ายๆ
//───────────────────────────────────────────────────────────────────────────────

class Animal {
  String name = '';

  void speak() {
    print('🔊 สัตว์กำลังส่งเสียง');
  }

  void display() {
    print('ชื่อ: $name');
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print('🐕 $name: วาฟ! วาฟ!');
  }
}

class Cat extends Animal {
  @override
  void speak() {
    print('🐱 $name: เหมียว!');
  }
}

class Cow extends Animal {
  @override
  void speak() {
    print('🐄 $name: มูมู!');
  }
}

/*
💡 อธิบาย:
   • speak() override ในแต่ละ class
   • ชื่อ method เดียวกัน แต่ทำงานต่างกัน
   • @override annotation ช่วยให้รู้ว่ากำลัง override
   • display() ไม่ override ใช้จากแม่ได้เลย
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Override ด้วย Return Value
//───────────────────────────────────────────────────────────────────────────────

class Shape {
  String name = '';

  double getArea() {
    return 0;
  }

  void displayInfo() {
    print('รูปทรง: $name');
  }
}

class Circle extends Shape {
  double radius = 0;

  @override
  double getArea() {
    return 3.14159 * radius * radius;
  }

  void displayCircle() {
    print('📀 วงกลม: รัศมี $radius, พื้นที่ ${getArea().toStringAsFixed(2)}');
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
      '▢ สี่เหลี่ยม: กว้าง $width, สูง $height, พื้นที่ ${getArea().toStringAsFixed(2)}',
    );
  }
}

class Triangle extends Shape {
  double base = 0;
  double height = 0;

  @override
  double getArea() {
    return 0.5 * base * height;
  }

  void displayTriangle() {
    print(
      '△ สามเหลี่ยม: ฐาน $base, สูง $height, พื้นที่ ${getArea().toStringAsFixed(2)}',
    );
  }
}

/*
💡 อธิบาย:
   • getArea() override ในแต่ละ class
   • Return type เดียวกัน (double)
   • แต่ละ class คำนวณ area ต่างกัน
   • Shape.getArea() return 0 (default)
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Override Method ด้วย Parameter
//───────────────────────────────────────────────────────────────────────────────

class Calculator {
  String name = 'Calculator';

  double calculate(double a, double b) {
    return a + b;
  }

  void display() {
    print('เครื่องคำนวณ: $name');
  }
}

class AdvancedCalculator extends Calculator {
  @override
  String get name => 'Advanced Calculator';

  @override
  double calculate(double a, double b) {
    // ทำคณิตศาสตร์ขั้นสูง
    return (a + b) * 2 - 5;
  }

  double multiplyAndAdd(double a, double b, double multiplier) {
    return calculate(a, b) * multiplier;
  }
}

/*
💡 อธิบาย:
   • calculate() override ด้วยตรรมชาติต่างกัน
   • Parameter เดียวกัน
   • ใช้ super.calculate() หรือ this.calculate() ได้ (ตัวอย่างนี้ไม่ใช้)
   • getter name ก็ override ได้
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Override ด้วย super
//───────────────────────────────────────────────────────────────────────────────

class Vehicle {
  String brand = '';
  int year = 0;

  void displayInfo() {
    print('ยานพาหนะ: $brand (ปี $year)');
  }

  void drive() {
    print('🏎️ เริ่มขับ');
  }
}

class Car extends Vehicle {
  int doors = 0;

  @override
  void displayInfo() {
    // เรียก parent method ด้วย super
    super.displayInfo();
    print('ประตู: $doors บาน');
  }

  @override
  void drive() {
    super.drive();
    print('🚗 ขับรถยนต์');
  }
}

class Motorcycle extends Vehicle {
  bool hasSidecar = false;

  @override
  void displayInfo() {
    super.displayInfo();
    print('มี Sidecar: ${hasSidecar ? "ใช่" : "ไม่"}');
  }

  @override
  void drive() {
    super.drive();
    print('🏍️ ขับรถมอเตอร์ไซค์');
  }
}

/*
💡 อธิบาย:
   • Override method เรียก super.method() ก่อน
   • super ให้เข้าถึง parent method ได้
   • ผสมพฤติกรรมของแม่กับลูก
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 5: Override ด้วยตรรมชาติที่ไม่เหมือน
//───────────────────────────────────────────────────────────────────────────────

class PaymentMethod {
  String methodName = '';
  double amount = 0;

  bool process() {
    print('💳 ประมวลผลการชำระเงิน');
    return true;
  }

  void displayDetails() {
    print('วิธีชำระ: $methodName, จำนวน: $amount บาท');
  }
}

class CreditCard extends PaymentMethod {
  String cardNumber = '';
  String cvv = '';

  @override
  bool process() {
    print(
      '💳 ตรวจสอบหมายเลขบัตร: ${cardNumber.substring(cardNumber.length - 4)}',
    );
    print('🔒 ตรวจสอบ CVV');
    print('✅ ชำระเงินด้วยบัตรเครดิต');
    return true;
  }
}

class BankTransfer extends PaymentMethod {
  String accountNumber = '';
  String bankName = '';

  @override
  bool process() {
    print(
      '🏦 ตรวจสอบบัญชี: ${accountNumber.substring(accountNumber.length - 4)}',
    );
    print('🏛️ ธนาคาร: $bankName');
    print('✅ โอนเงินสำเร็จ');
    return true;
  }
}

//═════════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═════════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 026: Override (การเขียนทับ)\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Simple Override - speak() Method
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Simple Override - speak() Method:');
  print('────────────────────────────────\n');

  var dog = Dog();
  dog.name = 'บิ๋ม';
  dog.speak();
  dog.display();
  print('');

  var cat = Cat();
  cat.name = 'มิกกี้';
  cat.speak();
  cat.display();
  print('');

  var cow = Cow();
  cow.name = 'นมสด';
  cow.speak();
  cow.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Override Return Value - getArea()
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Override Return Value - getArea():');
  print('──────────────────────────────\n');

  var circle = Circle();
  circle.name = 'วงกลม';
  circle.radius = 5;
  circle.displayInfo();
  circle.displayCircle();
  print('');

  var rect = Rectangle();
  rect.name = 'สี่เหลี่ยม';
  rect.width = 10;
  rect.height = 5;
  rect.displayInfo();
  rect.displayRectangle();
  print('');

  var triangle = Triangle();
  triangle.name = 'สามเหลี่ยม';
  triangle.base = 8;
  triangle.height = 6;
  triangle.displayInfo();
  triangle.displayTriangle();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Override ด้วย Parameter
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Override ด้วย Parameter:');
  print('──────────────────────\n');

  var calc1 = Calculator();
  calc1.display();
  print('calculate(5, 3) = ${calc1.calculate(5, 3)}');
  print('');

  var calc2 = AdvancedCalculator();
  calc2.display();
  print('calculate(5, 3) = ${calc2.calculate(5, 3)}');
  print('multiplyAndAdd(5, 3, 2) = ${calc2.multiplyAndAdd(5, 3, 2)}');
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Override ด้วย super
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Override ด้วย super:');
  print('────────────────────\n');

  var car = Car();
  car.brand = 'Toyota';
  car.year = 2024;
  car.doors = 4;
  car.displayInfo();
  car.drive();
  print('');

  var bike = Motorcycle();
  bike.brand = 'Honda';
  bike.year = 2023;
  bike.hasSidecar = true;
  bike.displayInfo();
  bike.drive();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ Override ด้วยตรรมชาติต่างกัน
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Override ด้วยตรรมชาติต่างกัน:');
  print('─────────────────────────\n');

  var credit = CreditCard();
  credit.methodName = 'CreditCard';
  credit.amount = 5000;
  credit.cardNumber = '1234567890123456';
  credit.cvv = '123';
  credit.displayDetails();
  credit.process();
  print('');

  var transfer = BankTransfer();
  transfer.methodName = 'BankTransfer';
  transfer.amount = 5000;
  transfer.accountNumber = '1234567890';
  transfer.bankName = 'กสิกรไทย';
  transfer.displayDetails();
  transfer.process();
  print('');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ OVERRIDE คืออะไร
   - เขียนทับ Method หรือ Property ของคลาสแม่
   - ชื่อ method เดียวกัน แต่เนื้อหาต่างกัน
   - เป็นการปรับแต่งพฤติกรรมให้เหมาะกับคลาสลูก

2️⃣ SIGNATURE ต้องตรง
   - ชื่อ method: เดียวกัน ✓
   - Parameter: ชนิดและจำนวนเดียวกัน ✓
   - Return Type: เดียวกัน ✓
   - ❌ ถ้าไม่ตรง มันจะไม่ใช่ override

3️⃣ @OVERRIDE ANNOTATION
   - @override ช่วยให้รู้ว่าเป็นการ override
   - ไม่บังคับ แต่เป็นการปฏิบัติที่ดี
   - IDE จะช่วย flag หากไม่ตรง

4️⃣ OVERRIDE vs OVERLOAD
   - Override: method ชื่อเดียวกัน (ต่างคลาส)
   - Overload: method ชื่อเดียวกัน (คลาสเดียวกัน)

5️⃣ SUPER KEYWORD ใน OVERRIDE
   - เรียก method ของ parent class
   - super.method() ใช้ได้ใน override method
   - มักใช้เมื่อต้องการรวม parent + child behavior

6️⃣ POLYMORPHISM ผ่าน OVERRIDE
   - List<Shape> shapes = [Circle(), Rectangle(), Triangle()]
   - for (var shape in shapes) print(shape.getArea())
   - แต่ละ override ทำงานต่างกัน!

7️⃣ ตัวอย่าง Override Signature:
   ┌─────────────────────────────────┐
   │ Parent:                         │
   │ int calculate(int a) { }        │
   │                                 │
   │ Child:                          │
   │ @override                       │
   │ int calculate(int a) { }        │
   └─────────────────────────────────┘

✨ ข้อกำหนด Override:
   ✓ Signature ต้องตรง
   ✓ ใช้ @override annotation
   ✓ เขียนทับ method ใน child class
   ✓ ไม่ต้องเขียนทับ method ทั้งหมด
   ✓ ใช้ super. เมื่อต้องเรียก parent method
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Simple Method Override
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Student (name, age, display())
  • Child 1: NormalStudent extends Student (override display())
  • Child 2: UniversityStudent extends Student (override display())

จากนั้น:
  1. สร้าง instance ของแต่ละ class
  2. เรียก display() เปรียบเทียบผล
  3. เห็นว่า method เดียวกัน แต่ output ต่างกัน

📌 แบบฝึกหัดที่ 2: Override ด้วย Return Value
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Employee (salary, getSalary())
  • Child 1: PermanentEmployee extends Employee (+ allowance)
  • Child 2: ContractEmployee extends Employee (- deduction)

จากนั้น:
  1. PermanentEmployee: override getSalary() = salary + allowance
  2. ContractEmployee: override getSalary() = salary - deduction
  3. สร้าง 2 instance และเปรียบเทียบ

📌 แบบฝึกหัดที่ 3: Override ด้วย super
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Person (name, displayInfo())
  • Child 1: Employee extends Person (override displayInfo()
    เรียก super.displayInfo() ก่อน แล้วเพิ่มข้อมูลพนักงาน)
  • Child 2: Student extends Person (override displayInfo()
    เรียก super.displayInfo() ก่อน แล้วเพิ่มข้อมูลนักเรียน)

จากนั้น:
  1. สร้าง Employee และ Student
  2. เรียก displayInfo() แล้วเห็น parent info + child info

📌 แบบฝึกหัดที่ 4: Challenge - Payment System
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Parent: Payment (amount, calculate(), displayReceipt())
  • Child 1: CashPayment extends Payment (override calculate())
  • Child 2: CreditCardPayment extends Payment (+ fee, override calculate())
  • Child 3: BankTransferPayment extends Payment (+ tax, override calculate())

จากนั้น:
  1. สร้าง List<Payment> payments
  2. เพิ่ม instance ของแต่ละ payment method
  3. Loop: ทุก payment เรียก calculate() และ displayReceipt()
  4. เห็น Polymorphism ในการทำงาน

💡 เคล็ดลับ:
   ✓ ตรวจสอบว่า signature ตรงกัน
   ✓ ใช้ @override annotation เสมอ
   ✓ ใช้ super. เมื่อต้องการ parent method
   ✓ Override ช่วยให้โค้ดเป็นระเบียบ
   ✓ ใช้ Polymorphism ให้เต็มที่
*/
