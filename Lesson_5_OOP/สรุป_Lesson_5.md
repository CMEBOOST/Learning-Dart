สรุป บทที่ 5 - Object-Oriented Programming (OOP) ขั้นสูง

---

## 📌 ความรู้เบื้องต้น

**Class = Template/Blueprint** ที่บอกว่า Object มีอะไรบ้าง  
**Object = Instance** ที่สร้างจาก Class  

```
Class     ≈ แบบพิมพ์รถยนต์
Object    ≈ รถยนต์ที่สร้างจากแบบพิมพ์
```

---

## 1. Class และ Object - การสร้าง Instance

### 1.1 สร้าง Class และ Object
```dart
// Class = Template
class Person {
  String name = '';
  int age = 0;
  
  void introduce() {
    print('ชื่อ $name อายุ $age ปี');
  }
}

void main() {
  // สร้าง Instance (Object) จาก Class
  Person person1 = Person();
  person1.name = 'สมชาย';
  person1.age = 25;
  person1.introduce();  // ชื่อ สมชาย อายุ 25 ปี
  
  // หรือใช้ var ช่วยลดการเขียนซ้ำ
  var person2 = Person();
  person2.name = 'วิชัย';
  person2.age = 30;
  person2.introduce();  // ชื่อ วิชัย อายุ 30 ปี
}
```

### 1.2 ชื่อ Class ที่ดี
```dart
// ✅ ชื่อ Class นิยม: ตัวแรกเป็นตัวพิมพ์ใหญ่ (PascalCase)
class BankAccount { }     // ✅ ดี
class bankAccount { }     // ❌ ไม่ดี
class BANKACCOUNT { }     // ❌ ไม่ดี
```

---

## 2. Properties - คุณลักษณะของ Class

### 2.1 ประกาศ Properties
```dart
class Employee {
  int id = 0;              // ต้องกำหนด default value
  String name = '';
  double salary = 0.0;
  String? email;           // Nullable: ไม่ต้องกำหนด default
}
```

### 2.2 Late Initialization - ทำให้ค่าทีหลัง
```dart
class Car {
  late int price;         // ต้องกำหนดค่าทีหลัง ไม่อาจ null
  late String color;
}

void main() {
  Car myCar = Car();
  
  // ต้องกำหนดค่าก่อนใช้ มิเช่นนั้น error
  myCar.price = 500000;
  myCar.color = 'Red';
}
```

### 2.3 เข้าถึง Properties
```dart
void main() {
  var emp = Employee();
  
  // อ่านค่า
  print(emp.name);        // ''
  
  // ตั้งค่า
  emp.name = 'Surachet';
  print(emp.name);        // Surachet
}
```

### 2.4 Cascade Operator (..) - ตั้งค่าหลายตัวพร้อมกัน
```dart
void main() {
  var person = Person()
    ..name = 'สมชาย'      // ตั้งค่า name
    ..age = 25            // ตั้งค่า age
    ..email = 'abc@123';  // ตั้งค่า email
    // ✅ สะอาดกว่าการตั้งทีละ 3 บรรทัด
}
```

---

## 3. Methods - วิธี/พฤติกรรม

### 3.1 สร้าง Method
```dart
class Calculator {
  // Method แบบปกติ
  double add(double a, double b) {
    return a + b;
  }
  
  // Arrow function (ถ้า 1 บรรทัด)
  double subtract(double a, double b) => a - b;
}

void main() {
  var calc = Calculator();
  print(calc.add(5, 3));        // 8
  print(calc.subtract(10, 4));  // 6
}
```

### 3.2 ใช้ this ใน Method
```dart
class Calculator {
  double add(double a, double b) => a + b;
  
  double calculate(double x) {
    // this.add() = เรียก method ในคลาสเดียวกัน
    double step1 = this.add(x, 10);
    return step1 * 2;
  }
}

void main() {
  var calc = Calculator();
  print(calc.calculate(5));  // (5+10)*2 = 30
}
```

---

## 4. Constructor - ตัวสร้าง Instance

### 4.1 Constructor พื้นฐาน
```dart
class Circle {
  double radius;
  
  // Constructor: ชื่อต้องเหมือนชื่อ Class
  Circle(double radius) {
    this.radius = radius;
  }
}

void main() {
  Circle c = Circle(5);  // ส่ง 5 เข้า Constructor
  print(c.radius);       // 5
}
```

### 4.2 Constructor แบบ Shorthand
```dart
class Circle {
  double radius;
  
  // Shorthand: บันทึกค่า auto
  Circle(this.radius);
}

void main() {
  Circle c = Circle(5);
  print(c.radius);  // 5
}
```

### 4.3 Named Parameters ใน Constructor
```dart
class Person {
  String name;
  int age;
  String? email;
  
  // Named parameters: ต้องระบุชื่อตอนเรียก
  Person({
    required this.name,
    required this.age,
    this.email,
  });
}

void main() {
  var p = Person(
    name: 'สมชาย',
    age: 25,
    email: 'abc@example.com',
  );
  print(p.name);  // สมชาย
}
```

### 4.4 Default Values ใน Constructor
```dart
class BankAccount {
  String accountNumber;
  double balance;
  String currency;
  
  BankAccount({
    required this.accountNumber,
    required this.balance,
    this.currency = 'THB',  // default value
  });
}

void main() {
  var acc1 = BankAccount(accountNumber: '123', balance: 5000);
  print(acc1.currency);  // THB (ค่า default)
  
  var acc2 = BankAccount(
    accountNumber: '456',
    balance: 10000,
    currency: 'USD',
  );
  print(acc2.currency);  // USD
}
```

---

## 5. Inheritance - การสืบทอด

### 5.1 extends - สืบทอดจาก Parent Class
```dart
// Parent Class (Superclass)
class Animal {
  String name;
  
  Animal(this.name);
  
  void eat() {
    print('$name กำลังกิน');
  }
}

// Child Class (Subclass) - สืบทอด Animal
class Dog extends Animal {
  String breed;
  
  Dog(String name, this.breed) : super(name);
  
  void bark() {
    print('$name: หมาหมา!');
  }
}

void main() {
  Dog dog = Dog('ป้อม', 'Labrador');
  
  dog.eat();    // จากคลาสแม่: ป้อม กำลังกิน
  dog.bark();   // คำสั่งของตัวเอง: ป้อม: หมาหมา!
}
```

### 5.2 super() - เรียก Constructor ของ Parent
```dart
class Shape {
  String name;
  
  Shape(this.name);
  
  void display() {
    print('Shape: $name');
  }
}

class Circle extends Shape {
  double radius;
  
  // super(name) = เรียก constructor ของ parent
  Circle(String name, this.radius) : super(name);
}

void main() {
  Circle c = Circle('วงกลม', 5);
  c.display();  // Shape: วงกลม
  print(c.radius);  // 5
}
```

---

## 6. Polymorphism - Override (แทนที่ Method)

### 6.1 @override - แทนที่ Method ของ Parent
```dart
class Shape {
  String name;
  
  Shape(this.name);
  
  void printInfo() {
    print('Shape: $name');
  }
}

class Circle extends Shape {
  double radius;
  
  Circle(String name, this.radius) : super(name);
  
  @override  // ← บ่งชี้ว่ากำลัง override
  void printInfo() {
    print('Circle: $name, Radius: $radius');
  }
}

class Rectangle extends Shape {
  double width, height;
  
  Rectangle(String name, this.width, this.height) : super(name);
  
  @override
  void printInfo() {
    print('Rectangle: $name, ${width}x$height');
  }
}

void main() {
  Circle c = Circle('วงกลม', 5);
  c.printInfo();  // Circle: วงกลม, Radius: 5
  
  Rectangle r = Rectangle('สี่เหลี่ยม', 4, 6);
  r.printInfo();  // Rectangle: สี่เหลี่ยม, 4x6
  
  // ใช้ Parent Type ได้กับทั้งหมด (Polymorphism)
  List<Shape> shapes = [c, r];
  for (Shape shape in shapes) {
    shape.printInfo();  // แต่ละตัวใช้ของตัวเอง!
  }
}
```

---

## 7. Mixin - ผสมคุณสมบัติเพิ่มเติม

### 7.1 ปัญหา Multiple Inheritance
```dart
// ❌ Dart ไม่รองรับ Multiple Inheritance
// class Dog extends Animal, Pet { }  // ✗ ERROR!
```

### 7.2 Mixin - วิธีแก้ปัญหา
```dart
// Mixin = คุณสมบัติพิเศษที่ "ผสม" เข้าไป
mixin CanRun {
  void run() {
    print('รันๆๆ!');
  }
}

mixin CanSwim {
  void swim() {
    print('ว่ายน้ำๆๆ!');
  }
}

class Animal {
  String name;
  
  Animal(this.name);
}

// ใช้ with เพื่อ mixin
class Duck extends Animal with CanRun, CanSwim {
  Duck(String name) : super(name);
}

void main() {
  Duck duck = Duck('โดนัลด์');
  duck.run();    // รันๆๆ! (จาก mixin CanRun)
  duck.swim();   // ว่ายน้ำๆๆ! (จาก mixin CanSwim)
}
```

### 7.3 ประโยชน์ของ Mixin
```dart
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}

mixin Validator {
  bool isValidEmail(String email) {
    return email.contains('@');
  }
}

class User with Logger, Validator {
  String name;
  String email;
  
  User(this.name, this.email);
}

void main() {
  User user = User('สมชาย', 'somchai@example.com');
  
  user.log('สร้างผู้ใช้ใหม่');        // [LOG] สร้างผู้ใช้ใหม่
  print(user.isValidEmail('abc'));   // false
  print(user.isValidEmail('a@b'));   // true
}
```

---

## 8. Static - สมาชิกของ Class (ไม่ใช่ Instance)

### 8.1 Static Variables - ตัวแปรร่วมกัน
```dart
class Student {
  String name;
  static int totalCount = 0;  // ← Static: ของ class ทั้งหมด
  
  Student(this.name) {
    totalCount++;  // นับเพิ่มทุกครั้งที่สร้าง instance
  }
}

void main() {
  print(Student.totalCount);  // 0
  
  Student s1 = Student('สมชาย');
  print(Student.totalCount);  // 1
  
  Student s2 = Student('วิชัย');
  print(Student.totalCount);  // 2
  
  // ตัวแปร instance ไม่ต่อเนื่อง
  print(s1.name);  // สมชาย
  print(s2.name);  // วิชัย
}
```

### 8.2 Static Methods - Method ของ Class
```dart
class Math {
  // Static method: เรียกได้โดยไม่ต้อง new
  static int add(int a, int b) => a + b;
  static int multiply(int a, int b) => a * b;
}

void main() {
  print(Math.add(5, 3));        // 8 (ไม่ต้อง new Math())
  print(Math.multiply(4, 2));   // 8
}
```

### 8.3 Instance ไม่สามารถ Access Static
```dart
class Config {
  static String appName = 'MyApp';
  String userId = 'user123';
}

void main() {
  // ✅ Static: เข้าถึงผ่าน Class
  print(Config.appName);  // MyApp
  
  // ❌ Non-static: ต้อง instance
  // print(Config.userId);  // ERROR!
  
  Config config = Config();
  print(config.userId);   // user123
}
```

---

## 9. Generic - Class ที่ยืดหยุ่น

### 9.1 ปัญหา: เขียนซ้ำหลายครั้ง
```dart
// ❌ เขียนคลาสซ้ำๆ สำหรับแต่ละชนิด
class Container<int> {
  int value;
  
  Container(this.value);
}

class Container<String> {
  String value;
  
  Container(this.value);
}

class Container<double> {
  double value;
  
  Container(this.value);
}
```

### 9.2 Generic - วิธีแก้ปัญหา
```dart
// ✅ ใช้ Generic Type <T>
class Container<T> {
  T value;
  
  Container(this.value);
  
  T getValue() => value;
}

void main() {
  // ใช้กับ int
  Container<int> intBox = Container<int>(42);
  print(intBox.getValue());  // 42
  
  // ใช้กับ String
  Container<String> strBox = Container<String>('Hello');
  print(strBox.getValue());  // Hello
  
  // ใช้กับ double
  Container<double> dblBox = Container<double>(3.14);
  print(dblBox.getValue());  // 3.14
}
```

### 9.3 Generic ที่ซับซ้อนยิ่งขึ้น
```dart
class Pair<K, V> {
  K key;
  V value;
  
  Pair(this.key, this.value);
  
  void display() {
    print('Key: $key, Value: $value');
  }
}

void main() {
  Pair<String, int> pair = Pair<String, int>('Age', 25);
  pair.display();  // Key: Age, Value: 25
  
  Pair<int, String> pair2 = Pair<int, String>(1, 'One');
  pair2.display(); // Key: 1, Value: One
}
```

---

## 10. Getters & Setters - อ่านและตั้งค่า

### 10.1 Getter - อ่านค่า
```dart
class Student {
  String _name;        // Private: _ หน้าชื่อ
  double _gpa;
  
  Student(this._name, this._gpa);
  
  // Getter
  String get name => _name;
  double get gpa => _gpa;
  
  // Getter ที่ซับซ้อน
  String get grade {
    if (_gpa >= 3.5) return 'A';
    if (_gpa >= 3.0) return 'B';
    if (_gpa >= 2.5) return 'C';
    return 'D';
  }
}

void main() {
  Student s = Student('สมชาย', 3.7);
  
  print(s.name);   // สมชาย (Getter)
  print(s.gpa);    // 3.7
  print(s.grade);  // A
}
```

### 10.2 Setter - ตั้งค่า
```dart
class BankAccount {
  double _balance = 0;
  
  // Getter
  double get balance => _balance;
  
  // Setter: ใช้ logic ตรวจสอบ
  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print('ยอดเงินต้องมากกว่า 0');
    }
  }
}

void main() {
  BankAccount acc = BankAccount();
  
  acc.balance = 5000;   // Setter
  print(acc.balance);   // 5000 (Getter)
  
  acc.balance = -1000;  // ❌ ยอดเงินต้องมากกว่า 0
}
```

---

## 📋 Complete Example - ระบบจัดการนักเรียน

```dart
// Abstract Class
abstract class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void display();
}

// Mixin
mixin Teachable {
  void teach(String subject) {
    print('กำลังสอน $subject');
  }
}

// Parent Class
class Student extends Person {
  double gpa;
  
  Student(String name, int age, this.gpa) : super(name, age);
  
  @override
  void display() {
    print('นักเรียน: $name อายุ $age GPA $gpa');
  }
  
  void study(String subject) {
    print('$name เรียน $subject');
  }
}

// Teacher Class
class Teacher extends Person with Teachable {
  String subject;
  
  Teacher(String name, int age, this.subject) : super(name, age);
  
  @override
  void display() {
    print('ครู: $name อายุ $age สอน $subject');
  }
}

// Classroom Class (ใช้ Generic)
class Classroom<T extends Person> {
  String classNumber;
  List<T> members = [];
  
  Classroom(this.classNumber);
  
  void addMember(T person) {
    members.add(person);
  }
  
  void displayAll() {
    print('=== ห้อง $classNumber ===');
    for (T person in members) {
      person.display();
    }
  }
}

void main() {
  // สร้างนักเรียน
  Student s1 = Student('สมชาย', 17, 3.5);
  Student s2 = Student('วิชัย', 17, 3.8);
  
  // สร้างครู
  Teacher t1 = Teacher('อาจารย์สมปอง', 35, 'Dart Programming');
  
  // สร้างห้องเรียน
  Classroom<Student> room = Classroom<Student>('4/1');
  room.addMember(s1);
  room.addMember(s2);
  
  room.displayAll();
  // === ห้อง 4/1 ===
  // นักเรียน: สมชาย อายุ 17 GPA 3.5
  // นักเรียน: วิชัย อายุ 17 GPA 3.8
  
  t1.display();  // ครู: อาจารย์สมปอง อายุ 35 สอน Dart Programming
  t1.teach('OOP');  // กำลังสอน OOP (จาก Mixin)
}
```

---

## 🎯 Summary - สรุปหลัก

### 📌 9 Concepts สำคัญ

| Concept | ความหมาย | ตัวอย่าง |
|---------|---------|---------|
| **Class** | Template/Blueprint | `class Person { }` |
| **Constructor** | ตัวสร้าง Instance | `Person(this.name)` |
| **Properties** | ข้อมูล | `String name` |
| **Methods** | พฤติกรรม | `void walk() { }` |
| **Inheritance** | สืบทอด | `class Dog extends Animal` |
| **Override** | แทนที่ method | `@override void sound()` |
| **Mixin** | ผสมคุณสมบัติ | `class Dog with CanRun` |
| **Static** | ของ Class ร่วม | `static int count` |
| **Generic** | ยืดหยุ่น type | `class Box<T>` |

### ✅ หลักการ 4 ประการ

1. **Encapsulation** - ซ่อนเบื้องใน (private _)
2. **Inheritance** - สืบทอด (extends)
3. **Polymorphism** - แปลงรูป (@override)
4. **Abstraction** - สรุป (abstract class)

### 🚀 Tips ใช้ได้จริง

✅ ใช้ `final` สำหรับ property ที่ไม่เปลี่ยน  
✅ ใช้ `late` เมื่อต้องตั้งค่าทีหลัง  
✅ ใช้ Cascade Operator (..) เพื่อตั้งค่าหลายตัวพร้อมกัน  
✅ ใช้ Mixin เพื่อหลีกเลี่ยง Multiple Inheritance  
✅ ใช้ Generic เพื่อความยืดหยุ่น
