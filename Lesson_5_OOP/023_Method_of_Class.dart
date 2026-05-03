//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 022: Method ของ Class (วิธี/พฤติกรรม)
//═══════════════════════════════════════════════════════════════════════════════

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                  📖 Method (วิธี/Behavior) คืออะไร?                          ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: ฟังก์ชันที่ประกาศภายใน Class ซึ่งใช้กำหนดพฤติกรรมของ Object
 Method ใช้ดำเนินการต่าง ๆ กับ Property ของ Object
 หรือส่งคืนผลลัพธ์ตามที่ต้องการ

 🔀 ความแตกต่าง: Function vs Method
 ───────────────────────────────────
 • Function: ประกาศนอก Class
 • Method: ประกาศภายใน Class
 • Method สามารถเข้าถึง Property ได้โดยตรง
 • Method เรียกใช้ผ่าน instance.method()

 🎯 ประเภท Method:
   1. Method ที่ไม่คืนค่า (void)
   2. Method ที่คืนค่า (return type)
   3. Method ที่มีพารามิเตอร์
   4. Method ที่เรียก Method อื่น (this.method())

 📌 การเข้าถึง Property ภายใน Method:
   • ใช้ชื่อ Property โดยตรง: name = 'value'
   • หรือใช้ this: this.name = 'value'
   • ทั้งสองแบบเหมือนกัน this ช่วยให้เห็นชัดเจน

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                     🏗️ ตัวอย่าง: ประเภท Method
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Method ที่ไม่คืนค่า (void)
//───────────────────────────────────────────────────────────────────────────────

class Person {
  String name = '';
  int age = 0;

  // Method ไม่คืนค่า
  void display() {
    print('ชื่อ: $name, อายุ: $age ปี');
  }

  // Method ไม่คืนค่า - ทำการแก้ไข Property
  void setAge(int newAge) {
    if (newAge > 0) {
      age = newAge;
      print('✅ อายุถูกเปลี่ยนเป็น $age ปี');
    } else {
      print('❌ อายุต้องมากกว่า 0');
    }
  }
}

/*
💡 อธิบาย:
   • void = ไม่คืนค่า
   • display() -> แสดงข้อมูล
   • setAge(int newAge) -> ตั้งค่า age ใหม่
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Method ที่คืนค่า
//───────────────────────────────────────────────────────────────────────────────

class Calculator {
  // Method ที่คืนค่า double
  double add(double a, double b) {
    return a + b;
  }

  // Method ที่คืนค่า double - แบบ Arrow Function
  double subtract(double a, double b) => a - b;

  // Method ที่คืนค่า double
  double multiply(double a, double b) {
    return a * b;
  }

  // Method ที่คืนค่า double
  double divide(double a, double b) {
    if (b == 0) {
      print('❌ ไม่สามารถหารด้วย 0 ได้');
      return 0;
    }
    return a / b;
  }
}

/*
💡 อธิบาย:
   • add() คืนค่า double
   • subtract() ใช้ Arrow Function (=>)
   • divide() มี if check ก่อนคืนค่า
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Method เรียก Method อื่น (this.)
//───────────────────────────────────────────────────────────────────────────────

class BudgetCalculator {
  double income = 0;
  double expense = 0;

  // Method 1: คำนวณกำไร
  double calculateProfit() {
    return income - expense;
  }

  // Method 2: คำนวณ Tax (10% ของกำไร)
  double calculateTax() {
    // เรียก Method อื่นโดยใช้ this.
    double profit = this.calculateProfit();
    return profit * 0.10;
  }

  // Method 3: คำนวณกำไรหลังหักภาษี
  double netProfit() {
    double profit = this.calculateProfit();
    double tax = this.calculateTax();
    return profit - tax;
  }

  // Method 4: แสดงรายการบัญชี
  void printStatement() {
    print('💰 รายได้: ${this.income} บาท');
    print('💸 ค่าใช้จ่าย: ${this.expense} บาท');
    print('📊 กำไรรวม: ${this.calculateProfit()} บาท');
    print('🏛️  ภาษี (10%): ${this.calculateTax()} บาท');
    print('✅ กำไรสุทธิ: ${this.netProfit()} บาท');
  }
}

/*
💡 อธิบาย:
   • Method เรียก Method อื่นใน Class เดียวกัน
   • ใช้ this.method() เพื่อความชัดเจน
   • หรือเรียกโดยตรง method() ก็ได้
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Bank Account - Method ที่ดำเนินการกับ Property
//───────────────────────────────────────────────────────────────────────────────

class BankAccount {
  String accountNumber = '';
  double balance = 0;
  String owner = '';

  // Method: ฝากเงิน
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('✅ ฝากเงิน: $amount บาท | ยอดเงินปัจจุบัน: $balance บาท');
    } else {
      print('❌ ฝากเงินต้องมากกว่า 0');
    }
  }

  // Method: ถอนเงิน
  void withdraw(double amount) {
    if (amount <= 0) {
      print('❌ ถอนเงินต้องมากกว่า 0');
    } else if (amount > balance) {
      print('❌ ยอดเงินไม่พอ! (มี $balance บาท ต้องการถอน $amount บาท)');
    } else {
      balance -= amount;
      print('✅ ถอนเงิน: $amount บาท | ยอดเงินปัจจุบัน: $balance บาท');
    }
  }

  // Method: ตรวจสอบยอดเงิน
  double getBalance() {
    return balance;
  }

  // Method: แสดงข้อมูลบัญชี
  void printAccountInfo() {
    print('\n📋 ข้อมูลบัญชี:');
    print('   เจ้าของบัญชี: $owner');
    print('   เลขบัญชี: $accountNumber');
    print('   ยอดเงิน: $balance บาท\n');
  }
}

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═══════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 022: Method ของ Class\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Method ที่ไม่คืนค่า (void)
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Method ที่ไม่คืนค่า (void):');
  print('────────────────────────────\n');

  var person = Person();
  person.name = 'สมชาย';
  person.age = 25;

  print('📝 เรียก display() Method:');
  person.display();
  print('');

  print('📝 เรียก setAge() Method:');
  person.setAge(30);
  person.display();
  print('');

  print('📝 ลองตั้งค่าไม่ถูกต้อง:');
  person.setAge(-5);
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Method ที่คืนค่า
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Method ที่คืนค่า (Return Value):');
  print('────────────────────────────────\n');

  var calc = Calculator();

  double result1 = calc.add(20, 30);
  print('✅ add(20, 30) = $result1');

  double result2 = calc.subtract(100, 40);
  print('✅ subtract(100, 40) = $result2');

  double result3 = calc.multiply(12, 5);
  print('✅ multiply(12, 5) = $result3');

  double result4 = calc.divide(100, 4);
  print('✅ divide(100, 4) = $result4');

  double result5 = calc.divide(100, 0); // ลองหารด้วย 0
  print('✅ divide(100, 0) = $result5\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Method เรียก Method อื่น (this.)
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Method เรียก Method อื่น (this.method()):');
  print('──────────────────────────────────────────\n');

  var budget = BudgetCalculator();
  budget.income = 100000;
  budget.expense = 60000;

  budget.printStatement();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Bank Account - Method ที่ดำเนินการกับ Property
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Bank Account - Method ที่ดำเนินการกับ Property:');
  print('───────────────────────────────────────────────\n');

  var myAccount = BankAccount()
    ..owner = 'สมชาย'
    ..accountNumber = '123456789'
    ..balance = 5000;

  myAccount.printAccountInfo();

  print('📝 ทำรายการต่าง ๆ:');
  myAccount.deposit(10000);
  myAccount.withdraw(3000);
  myAccount.withdraw(20000); // ถอนเกิน
  myAccount.deposit(5000);

  print('📊 ยอดเงินสุดท้าย: ${myAccount.getBalance()} บาท');
  print('');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ METHOD (วิธี)
   - ฟังก์ชันที่ประกาศใน Class
   - ใช้สำหรับดำเนินการต่าง ๆ
   - เรียกใช้ผ่าน instance.method()

2️⃣ VOID METHOD
   - ไม่คืนค่า
   - ใช้สำหรับ แสดงผล หรือ แก้ไข Property
   - void display() { ... }

3️⃣ RETURN METHOD
   - คืนค่าได้
   - ระบุ Type ที่คืนค่า (int, String, double, etc.)
   - double calculate() { return value; }

4️⃣ PARAMETER
   - Method สามารถรับพารามิเตอร์ได้
   - void setAge(int newAge) { ... }
   - double add(double a, double b) { ... }

5️⃣ THIS KEYWORD
   - ใช้เพื่ออ้างอิงใน Class เดียวกัน
   - this.property -> เข้าถึง Property
   - this.method() -> เรียก Method อื่น
   - ทำให้โค้ดชัดเจน (ไม่บังคับต้องใช้)

6️⃣ METHOD TYPES
   ┌─────────────────────────────────────┐
   │ void method() { }                   │ → ไม่คืนค่า
   │ int method() { return value; }      │ → คืนค่า int
   │ String method(String param) { }     │ → คืนค่า String
   │ double calc(int a, double b) { }    │ → หลาย Parameter
   │ double method() => a + b;           │ → Arrow Function
   └─────────────────────────────────────┘

✨ เคล็ดลับ:
   ✓ Method ต้องมี () แม้ไม่มี Parameter
   ✓ ใช้ this. เมื่ออ้างอิง Property/Method ใน Class
   ✓ Return type ต้องตรงกับค่าที่คืนออกมา
   ✓ ใช้ if check ก่อนทำการแก้ไข Property
   ✓ Method สามารถเรียก Method อื่นได้
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Void Method
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Dog" ที่มี:
  • Property: name, age
  • Method: bark() - แสดง "ฮั่วฮั่ว!"
  • Method: eat(String food) - แสดง "eat ${food}"
  • Method: sleep() - แสดง "Zzzzz..."
  • Method: display() - แสดงข้อมูล

จากนั้น:
  1. สร้าง Instance dog
  2. ตั้งชื่อและอายุ
  3. เรียก method ต่าง ๆ

📌 แบบฝึกหัดที่ 2: Return Method
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "StudentGrade" ที่มี:
  • Property: name, midterm, final
  • Method: average() - คืนค่า (midterm + final) / 2
  • Method: grade() - คืนค่า "A", "B", "C", "D", "F"
    (average >= 80 -> A, >= 70 -> B, >= 60 -> C, >= 50 -> D, < 50 -> F)
  • Method: display() - แสดงชื่อ และ เกรด

จากนั้น:
  1. สร้าง 2 Student
  2. เรียก average() และ grade()
  3. เรียก display()

📌 แบบฝึกหัดที่ 3: Method เรียก Method (this.)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Rectangle" ที่มี:
  • Property: width, height
  • Method: getArea() - คืนค่า width * height
  • Method: getPerimeter() - คืนค่า 2 * (width + height)
  • Method: getDoubleArea() - เรียก getArea() แล้วคูณ 2
  • Method: display() - แสดงพื้นที่ เส้นรอบวง

จากนั้น:
  1. สร้าง Instance width=10, height=5
  2. แสดง Area, Perimeter, Double Area

📌 แบบฝึกหัดที่ 4: Challenge - Smartphone
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class ชื่อ "Smartphone" ที่มี:
  • Property: brand, model, battery (0-100), isOn (true/false)
  • Method: turnOn() - เปิดเครื่อง (isOn = true)
  • Method: turnOff() - ปิดเครื่อง (isOn = false)
  • Method: charge(int percent) - เพิ่ม battery (แต่ max 100)
  • Method: useBattery(int percent) - ใช้ battery (ต้องเปิดเครื่องก่อน)
  • Method: getStatus() - คืนข้อมูลเครื่อง (แบบ String)
  • Method: display() - แสดงข้อมูลทั้งหมด

จากนั้น:
  1. สร้าง Instance phone
  2. ตั้งชื่อและรุ่น
  3. charge(50) -> battery = 50
  4. turnOn()
  5. useBattery(20) -> battery = 30
  6. display()

💡 เคล็ดลับ:
   ✓ ใช้ if check เพื่อตรวจสอบเงื่อนไข
   ✓ ใช้ this. เมื่อเรียก Method/Property อื่น
   ✓ Return type ต้องถูกต้อง
   ✓ ทดสอบทั้ง Case ปกติและ Case ข้อผิดพลาด
*/
