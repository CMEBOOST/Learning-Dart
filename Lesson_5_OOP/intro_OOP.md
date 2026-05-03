# 🏗️ Object-Oriented Programming (OOP) ในภาษา Dart

---

## 📌 บทนำ

**OOP (Object-Oriented Programming)** คือการเขียนโปรแกรมโดยมองโลกจำนวนเป็นกลุ่มของ "วัตถุ" (Objects) ที่มีคุณสมบัติและพฤติกรรม แทนที่จะเขียนเป็นฟังก์ชันหรือคำสั่งแยกๆ ออกจากกัน

---

## 🤔 ทำไมต้อง OOP?

### ❌ Procedural Programming (วิธีเก่า)
```dart
// วิธีแบบเก่า: ฟังก์ชันแยกกัน
String car_brand = "Toyota";
int car_price = 800000;
String car_color = "Red";

void printCar() {
  print("Brand: $car_brand, Price: $car_price, Color: $car_color");
}

// ถ้ามีรถหลายคัน ต้องเขียนซ้ำๆ ซากๆ
String car2_brand = "Honda";
int car2_price = 900000;
String car2_color = "Blue";

void printCar2() {
  print("Brand: $car2_brand, Price: $car2_price, Color: $car2_color");
}
```
**ปัญหา:** ซ้ำซากเหล้อเพลิน ยากต่อการจัดการ

### ✅ Object-Oriented Programming (วิธีใหม่)
```dart
// วิธี OOP: ใช้ Class
class Car {
  String brand;
  int price;
  String color;
  
  Car(this.brand, this.price, this.color);
  
  void printInfo() {
    print("Brand: $brand, Price: $price, Color: $color");
  }
}

// เรียกใช้ง่าย
Car car1 = Car("Toyota", 800000, "Red");
Car car2 = Car("Honda", 900000, "Blue");

car1.printInfo();
car2.printInfo();
```
**ข้อดี:** สะอาด เรียบร้อย ซ้ำซากน้อย

---

## 🎯 4 หลักการพื้นฐานของ OOP

### 1️⃣ Encapsulation (การห่อหุ้ม)
**"ซ่อนรายละเอียดภายใน เผยแพร่เฉพาะสิ่งที่จำเป็น"**

```dart
class BankAccount {
  // Private (ซ่อนไว้): ไม่ให้เข้าถึงโดยตรง
  double _balance = 0;  // _ แปลว่า private
  
  // Public (เปิด): ให้เข้าถึงได้
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("ฝากเงิน: $amount บาท");
    }
  }
  
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("ถอนเงิน: $amount บาท");
    } else {
      print("ไม่สามารถถอนได้");
    }
  }
  
  double getBalance() {
    return _balance;
  }
}

void main() {
  BankAccount account = BankAccount();
  account.deposit(5000);
  account.withdraw(1000);
  print("ยอดเงิน: ${account.getBalance()}");
  
  // account._balance = -100;  // ❌ ผิด! ไม่ให้สัมผัสโดยตรง
}
```

**ประโยชน์:**
- ป้องกันข้อมูล
- ควบคุมการเข้าถึง
- ง่ายต่อการแก้ไข

---

### 2️⃣ Inheritance (การสืบทอด)
**"สร้างคลาสใหม่จากคลาสเดิม"**

```dart
// Parent Class (คลาสแม่)
class Animal {
  String name;
  
  Animal(this.name);
  
  void eat() {
    print("$name กำลังกิน");
  }
}

// Child Class (คลาสลูก) - สืบทอดจาก Animal
class Dog extends Animal {
  Dog(String name) : super(name);
  
  void bark() {
    print("$name: หมาหมา!");
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);
  
  void meow() {
    print("$name: เหมี่ยว!");
  }
}

void main() {
  Dog dog = Dog("ป้อม");
  dog.eat();   // จากคลาสแม่
  dog.bark();  // คำสั่งของตัวเอง
  
  Cat cat = Cat("ขาว");
  cat.eat();   // จากคลาสแม่
  cat.meow();  // คำสั่งของตัวเอง
}

// Output:
// ป้อม กำลังกิน
// ป้อม: หมาหมา!
// ขาว กำลังกิน
// ขาว: เหมี่ยว!
```

**ประโยชน์:**
- ลดการเขียนซ้ำ (DRY)
- สร้าง hierarchy
- ง่ายต่อการบำรุงรักษา

---

### 3️⃣ Polymorphism (การมีหลายรูป)
**"คำสั่งเดียวกัน แต่ทำงานต่างกัน"**

```dart
// Base Class
class Animal {
  void sound() {
    print("มี sound ต่างๆ");
  }
}

// Subclasses ที่ override method
class Dog extends Animal {
  @override
  void sound() {
    print("เสียงหมา: หมาหมา!");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("เสียงแมว: เหมี่ยว!");
  }
}

class Cow extends Animal {
  @override
  void sound() {
    print("เสียงวัว: มมมม!");
  }
}

void main() {
  List<Animal> animals = [Dog(), Cat(), Cow()];
  
  // เรียก sound() บน object ต่างๆ
  // แต่ละตัวทำงานต่างกัน!
  for (Animal animal in animals) {
    animal.sound();
  }
}

// Output:
// เสียงหมา: หมาหมา!
// เสียงแมว: เหมี่ยว!
// เสียงวัว: มมมม!
```

**ประโยชน์:**
- ยืดหยุ่นสูง
- เขียนโค้ดทั่วไป (Generic)
- ง่ายต่อการขยาย

---

### 4️⃣ Abstraction (การสรุป)
**"แสดงสิ่งที่สำคัญ ซ่อนความซับซ้อน"**

```dart
// Abstract Class (ตัวอย่างทั่วไป ไม่สามารถ new ได้)
abstract class Shape {
  // Abstract Method (ต้อง implement ในคลาสลูก)
  double getArea();
  double getPerimeter();
  
  // Concrete Method (วิธีปกติ)
  void printInfo() {
    print("Area: ${getArea()}, Perimeter: ${getPerimeter()}");
  }
}

// Concrete Class (สามารถ new ได้)
class Circle implements Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double getArea() {
    return 3.14159 * radius * radius;
  }
  
  @override
  double getPerimeter() {
    return 2 * 3.14159 * radius;
  }
}

class Rectangle implements Shape {
  double width, height;
  
  Rectangle(this.width, this.height);
  
  @override
  double getArea() {
    return width * height;
  }
  
  @override
  double getPerimeter() {
    return 2 * (width + height);
  }
}

void main() {
  Shape circle = Circle(5);
  Shape rectangle = Rectangle(4, 6);
  
  circle.printInfo();      // ใช้วิธีเดียว
  rectangle.printInfo();   // แต่ผลต่างกัน
}

// Output:
// Area: 78.53975, Perimeter: 31.4159
// Area: 24.0, Perimeter: 20.0
```

**ประโยชน์:**
- ซ่อนรายละเอียดที่ซับซ้อน
- ให้ interface ชัดเจน
- บังคับ contract ระหว่างคลาส

---

## 🧩 Concepts สำคัญอื่นๆ

### Class (คลาส)
คือ "แบบ" หรือ "template" สำหรับสร้าง Object

```dart
class Person {
  // Properties (คุณสมบัติ)
  String name;
  int age;
  
  // Constructor (ตัวสร้าง)
  Person(this.name, this.age);
  
  // Methods (วิธี/พฤติกรรม)
  void greet() {
    print("สวัสดี ชื่อ $name อายุ $age ปี");
  }
}
```

### Object (วัตถุ)
คือ "ตัวอย่าง" ที่สร้างจาก Class

```dart
// สร้าง Object จาก Class Person
Person person1 = Person("สมชาย", 25);
Person person2 = Person("วิชัย", 30);

person1.greet();  // สวัสดี ชื่อ สมชาย อายุ 25 ปี
person2.greet();  // สวัสดี ชื่อ วิชัย อายุ 30 ปี
```

### Constructor (ตัวสร้าง)
วิธีที่เรียกใช้เมื่อสร้าง Object ใหม่

```dart
class Car {
  String brand;
  int year;
  
  // Constructor
  Car(this.brand, this.year);
  
  // Named Constructor
  Car.electric(this.brand) : year = 2024;
}

void main() {
  Car car1 = Car("Toyota", 2020);
  Car car2 = Car.electric("Tesla");
}
```

### Getters & Setters
ใช้สำหรับอ่านและตั้งค่า Properties

```dart
class Student {
  String _name;
  double _gpa;
  
  Student(this._name, this._gpa);
  
  // Getter
  String get name => _name;
  double get gpa => _gpa;
  
  // Setter
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }
  
  set gpa(double value) {
    if (value >= 0 && value <= 4) {
      _gpa = value;
    }
  }
}

void main() {
  Student student = Student("สมชาย", 3.5);
  
  print(student.name);  // สมชาย (Getter)
  
  student.name = "วิชัย";  // Setter
  print(student.name);  // วิชัย
}
```

---

## 📊 ตัวอย่างสรุป: ระบบห้องเรียน

```dart
// Parent Class
abstract class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  abstract void work();
}

// Subclass 1: นักเรียน
class Student extends Person {
  double gpa;
  
  Student(String name, int age, this.gpa) : super(name, age);
  
  @override
  void work() {
    print("$name กำลังเรียน");
  }
  
  void study(String subject) {
    print("$name เรียน $subject");
  }
}

// Subclass 2: ครู
class Teacher extends Person {
  String subject;
  
  Teacher(String name, int age, this.subject) : super(name, age);
  
  @override
  void work() {
    print("$name กำลังสอน $subject");
  }
  
  void grade(Student student) {
    print("$name ให้คะแนน ${student.name}");
  }
}

void main() {
  Student s1 = Student("สมชาย", 18, 3.5);
  Teacher t1 = Teacher("อาจารย์วิชัย", 35, "Dart Programming");
  
  s1.work();        // สมชาย กำลังเรียน
  s1.study("OOP");  // สมชาย เรียน OOP
  
  t1.work();        // อาจารย์วิชัย กำลังสอน Dart Programming
  t1.grade(s1);     // อาจารย์วิชัย ให้คะแนน สมชาย
}
```

---

## 🎓 สรุปประเด็นสำคัญ

| หลักการ | ความหมาย | ประโยชน์ |
|--------|---------|---------|
| **Encapsulation** | ซ่อนรายละเอียด | ปลอดภัย เข้าถึงได้ทาง method |
| **Inheritance** | สืบทอด | ลดการเขียนซ้ำ สร้าง hierarchy |
| **Polymorphism** | หลายรูป | ยืดหยุ่น เหมาะกับ multiple types |
| **Abstraction** | สรุป | ง่ายต่อใช้ ซ่อนความซับซ้อน |

---

## ✅ ข้อดีของ OOP

1. **Code Reuse** - เขียนน้อย เรียกใช้ซ้ำ
2. **Modularity** - แยกเป็นส่วนๆ ทำให้จัดการง่าย
3. **Maintainability** - แก้ไขง่าย ปลอดภัย
4. **Scalability** - ขยายโปรแกรมได้ง่าย
5. **Security** - Encapsulation ป้องกันข้อมูล
6. **Flexibility** - Polymorphism ทำให้ยืดหยุ่น

---

## 🚀 ต่อไป: Lesson 5 OOP Practical

บทหน้าเราจะศึกษา:
- ✅ Class และ Object
- ✅ Constructor
- ✅ Properties & Methods
- ✅ Getters & Setters
- ✅ Inheritance
- ✅ Polymorphism & Override
- ✅ Abstract Classes & Interfaces
- ✅ Static Variables & Methods

**มาเริ่มต้นสร้างโปรแกรมแบบ OOP กัน!** 🎉
