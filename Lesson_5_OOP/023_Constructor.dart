//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 023: Constructor (ตัวสร้าง)
//═══════════════════════════════════════════════════════════════════════════════

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                  📖 Constructor (ตัวสร้าง) คืออะไร?                          ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: Method พิเศษที่มีชื่อตรงกับชื่อ Class ซึ่งใช้สร้างและเตรียมค่า
 เริ่มต้นให้กับ Instance ใหม่ Constructor จะถูกเรียกอัตโนมัติเมื่อสร้าง Instance

 🎯 ลักษณะสำคัญของ Constructor:
   1. ชื่อตรงกับชื่อ Class
   2. ไม่มี return type (ไม่ใช้ void ด้วย)
   3. ถูกเรียกอัตโนมัติเมื่อสร้าง Instance
   4. สามารถรับ Parameter ได้
   5. ทุก Class จะมี Constructor อย่างน้อย 1 ตัว (ถ้าไม่เขียน Dart จะสร้างให้)

 📌 ประเภท Constructor:
   1. Default Constructor - ไม่มี Parameter
   2. Parameterized Constructor - มี Parameter
   3. Named Constructor - Constructor ที่ชื่อพิเศษ (ขั้นสูง)

 💡 ประโยชน์ของ Constructor:
   ✓ ตั้งค่า Property เริ่มต้น
   ✓ ตรวจสอบค่าก่อนเก็บ (Validation)
   ✓ เตรียมทรัพยากร
   ✓ ทำให้สร้าง Instance ง่ายขึ้น

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                     🏗️ ตัวอย่าง: ประเภท Constructor
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Default Constructor (ไม่มี Parameter)
//───────────────────────────────────────────────────────────────────────────────

class Person {
  String name = '';
  int age = 0;

  // Constructor ไม่มี Parameter
  Person() {
    print('✅ สร้าง Person Instance!');
  }
}

/*
💡 อธิบาย:
   • ชื่อ Person() ตรงกับชื่อ Class
   • ไม่มี return type
   • ไม่มี Parameter
   • เรียกอัตโนมัติเมื่อสร้าง Instance
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Parameterized Constructor (มี Parameter)
//───────────────────────────────────────────────────────────────────────────────

class Student {
  String name = '';
  int id = 0;
  double gpa = 0.0;

  // Constructor มี Parameter
  Student(String name, int id, double gpa) {
    this.name = name;
    this.id = id;
    this.gpa = gpa;
  }

  void display() {
    print('ชื่อ: $name, เลขที่: $id, GPA: $gpa');
  }
}

/*
💡 อธิบาย:
   • รับ Parameter 3 ตัว
   • ใช้ this. เพื่ออ้างถึง Property
   • ตั้งค่า Property จากค่าที่ส่งเข้ามา
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Constructor แบบ Shorthand (ย่อ)
//───────────────────────────────────────────────────────────────────────────────

class Product {
  String name;
  double price;
  int quantity;

  // Constructor แบบ Shorthand - Dart จะทำให้โดยอัตโนมัติ
  Product(this.name, this.price, this.quantity);

  void display() {
    print('สินค้า: $name, ราคา: $price บาท, จำนวน: $quantity ชิ้น');
  }
}

/*
💡 อธิบาย:
   • ใช้ this.property โดยตรงใน Parameter
   • ย่อและสะอาดกว่า
   • Dart จะตั้งค่าให้อัตโนมัติ
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Constructor กับ Named Parameters
//───────────────────────────────────────────────────────────────────────────────

class BankAccount {
  String owner = '';
  String accountNumber = '';
  double balance = 0;

  // Constructor กับ Named Parameters (ระบุชื่อ)
  BankAccount({
    required this.owner,
    required this.accountNumber,
    this.balance = 0,
  });

  void display() {
    print('เจ้าของ: $owner');
    print('เลขบัญชี: $accountNumber');
    print('ยอดเงิน: $balance บาท');
  }
}

/*
💡 อธิบาย:
   • ใช้ {} สำหรับ Named Parameters
   • required = บังคับต้องส่ง
   • this.balance = 0 = มีค่า default
   • ระบุชื่อ Parameter เมื่อสร้าง Instance
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 5: Constructor กับ Validation
//───────────────────────────────────────────────────────────────────────────────

class Circle {
  double radius = 0;

  // Constructor กับการตรวจสอบค่า
  Circle(double radius) {
    if (radius > 0) {
      this.radius = radius;
      print('✅ วงกลมถูกสร้างแล้ว');
    } else {
      print('❌ รัศมีต้องมากกว่า 0');
      this.radius = 1; // ตั้งค่า default
    }
  }

  double getArea() => 3.14159 * radius * radius;
  double getCircumference() => 2 * 3.14159 * radius;
}

/*
💡 อธิบาย:
   • ตรวจสอบค่าก่อนเก็บ
   • ถ้ากำหนดค่าไม่ถูก ตั้งค่า default
   • ป้องกันข้อมูลที่ผิด
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═══════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 023: Constructor\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Default Constructor
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Default Constructor (ไม่มี Parameter):');
  print('──────────────────────────────────────\n');

  var person1 = Person();
  person1.name = 'สมชาย';
  person1.age = 25;
  print('ชื่อ: ${person1.name}, อายุ: ${person1.age} ปี\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Parameterized Constructor
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Parameterized Constructor (มี Parameter):');
  print('──────────────────────────────────────────\n');

  var student1 = Student('สมชาย', 101, 3.5);
  student1.display();
  print('');

  var student2 = Student('วิชัย', 102, 3.8);
  student2.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Constructor Shorthand
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Constructor Shorthand (ย่อ):');
  print('─────────────────────────────\n');

  var product = Product('Notebook', 50.0, 100);
  product.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Named Parameters
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Named Parameters (ระบุชื่อ):');
  print('───────────────────────────────\n');

  var account = BankAccount(
    owner: 'สมชาย',
    accountNumber: '123456789',
    balance: 10000,
  );
  account.display();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ Constructor กับ Validation
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Constructor กับ Validation:');
  print('─────────────────────────────\n');

  var circle1 = Circle(5);
  print('📐 วงกลมที่ 1:');
  print('   พื้นที่: ${circle1.getArea().toStringAsFixed(2)} ตร.หน่วย');
  print(
    '   เส้นรอบวง: ${circle1.getCircumference().toStringAsFixed(2)} หน่วย\n',
  );

  var circle2 = Circle(-3); // ตรวจสอบค่า
  print('📐 วงกลมที่ 2 (ค่าผิด):');
  print('   พื้นที่: ${circle2.getArea().toStringAsFixed(2)} ตร.หน่วย\n');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ CONSTRUCTOR (ตัวสร้าง)
   - Method พิเศษ ชื่อตรงกับ Class
   - ไม่มี return type
   - เรียกอัตโนมัติเมื่อสร้าง Instance

2️⃣ DEFAULT CONSTRUCTOR
   - ไม่มี Parameter
   - ClassName() { }

3️⃣ PARAMETERIZED CONSTRUCTOR
   - มี Parameter
   - ClassName(Type param1, Type param2) { }
   - ตั้งค่า Property จาก Parameter

4️⃣ SHORTHAND CONSTRUCTOR
   - ใช้ this.property ในลายเซ็น
   - ClassName(this.property1, this.property2);
   - Dart จะทำให้อัตโนมัติ

5️⃣ NAMED PARAMETERS
   - ใช้ {} สำหรับ Named Parameters
   - ClassName({required this.prop1, this.prop2 = default})
   - เรียกใช้ด้วยชื่อ Parameter

6️⃣ REQUIRED KEYWORD
   - บังคับให้ส่ง Parameter
   - required this.name; (ต้องส่งค่า)
   - ป้องกันค่า null ที่ไม่ต้องการ

7️⃣ VALIDATION IN CONSTRUCTOR
   - ตรวจสอบค่าก่อนเก็บ
   - หยุดสร้าง Instance ถ้าค่าผิด
   - ตั้งค่า default ถ้าไม่ถูก

✨ ประเภท Constructor ที่ใช้บ่อย:
   ┌──────────────────────────────────────────┐
   │ 1. Default: ClassName() { }              │
   │ 2. Simple: ClassName(Type param) { }     │
   │ 3. Shorthand: ClassName(this.prop);      │
   │ 4. Named: ClassName({required this.x})   │
   │ 5. Mixed: ClassName(param1, {req this.x})│
   └──────────────────────────────────────────┘
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Default Constructor
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Book" ที่มี:
  • Property: title, author, pages
  • Constructor ที่ไม่มี Parameter (Default)
    - ตั้งค่า default: title='Unknown', author='Unknown', pages=0
  • Method: display()

จากนั้น:
  1. สร้าง Instance book1
  2. เปลี่ยนค่า title, author, pages
  3. เรียก display()

📌 แบบฝึกหัดที่ 2: Parameterized Constructor
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Laptop" ที่มี:
  • Property: brand, price, ram
  • Constructor ที่มี 3 Parameter: brand, price, ram
  • Method: display()
  • Method: getInfo() -> คืนค่า String

จากนั้น:
  1. สร้าง 2 Instance ด้วย Constructor
  2. เรียก display() ของทั้งสอง

📌 แบบฝึกหัดที่ 3: Shorthand Constructor
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Animal" ที่มี:
  • Property: name, species, age
  • Constructor แบบ Shorthand
  • Method: makeSound() - แสดงเสียง
  • Method: display()

จากนั้น:
  1. สร้าง 3 Instance ของสัตว์ต่างกัน
  2. เรียก makeSound() และ display()

📌 แบบฝึกหัดที่ 4: Challenge - Rectangle
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Rectangle" ที่มี:
  • Property: width, height
  • Constructor ที่มี Named Parameters + Validation:
    - ถ้า width หรือ height <= 0 → ตั้งค่า = 1
  • Method: getArea()
  • Method: getPerimeter()
  • Method: display()

จากนั้น:
  1. สร้าง 3 Instance:
     - rect1(10, 5)
     - rect2({width: 8, height: 6})
     - rect3({width: -5, height: 3}) - ค่าผิด
  2. แสดง Area, Perimeter ของทั้งสาม

💡 เคล็ดลับ:
   ✓ Constructor ต้องมีชื่อตรงกับ Class
   ✓ ไม่มี return type
   ✓ ใช้ this. เพื่ออ้างถึง Property
   ✓ สามารถ Validate ค่าใน Constructor
   ✓ Shorthand ทำให้โค้ดสั้นลง
   ✓ Named Parameters ทำให้ชัดเจน
*/
