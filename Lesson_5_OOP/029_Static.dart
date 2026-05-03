//═══════════════════════════════════════════════════════════════════════════════
// 📚 Lesson 028: Static (สมาชิกของคลาส ไม่ใช่ instance)
//═══════════════════════════════════════════════════════════════════════════════

/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                    📖 Static (ตัวแปร/เมธอดของคลาส) คืออะไร?                 ║
╠═══════════════════════════════════════════════════════════════════════════════╣

 นิยาม: Static คือ keyword ที่ให้ variable/method เป็นของคลาส ไม่ใช่ของ
 instance แต่ละตัว สามารถเข้าถึงได้โดยไม่ต้องสร้าง instance

 📌 ข้อมูลสำคัญ:
   • Instance Variable: แต่ละ instance มีค่าเป็นของตัวเอง
   • Static Variable: ทั้งเรียน share ค่าเดียวกัน
   • Static Method: เรียกผ่าน ClassName.method() ได้เลย
   • Instance ถูก copy ที่ memory ต่างกัน
   • Static ใช้หนึ่งที่เดียวสำหรับทั้งคลาส

 🎯 ประเภท Static:
   1. Static Variable: ตัวแปรของคลาส (shared)
   2. Static Method: method ของคลาส (ไม่ต้อง instance)
   3. Static Getter/Setter: property ของคลาส
   4. Static Const: ค่าคงที่ของคลาส

 💡 Instance vs Static:
   Instance (Non-static):
   - ต่างกันสำหรับแต่ละ instance
   - ต้องสร้าง instance ก่อน
   - obj.property

   Static:
   - เดียวกันสำหรับทั้งคลาส
   - เรียกได้เลยโดยไม่สร้าง instance
   - ClassName.property

 ⚠️ สำคัญ:
   • Instance method สามารถเข้าถึง static ได้
   • Static method ไม่สามารถเข้าถึง instance member ได้
   • Static variable share ค่า ทั้งคลาส

 📌 Syntax:
   class MyClass {
     static int count = 0;        // Static variable
     String name = '';             // Instance variable

     static void staticMethod() {  // Static method
       print(count);               // ✓ เข้าถึง static
       // print(name);              // ❌ ผิด! Instance member
     }

     void instanceMethod() {
       print(count);               // ✓ เข้าถึง static
       print(name);                // ✓ เข้าถึง instance
     }
   }

╚═══════════════════════════════════════════════════════════════════════════════╝

════════════════════════════════════════════════════════════════════════════════
                        🏗️ ตัวอย่าง: Static
════════════════════════════════════════════════════════════════════════════════
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 1: Static Variable - Counter
//───────────────────────────────────────────────────────────────────────────────

class User {
  String name = '';
  static int totalUsers = 0; // Static variable

  User(this.name) {
    totalUsers++; // เพิ่ม counter ทุกครั้งสร้าง instance
  }

  void display() {
    print('👤 ผู้ใช้: $name');
  }

  static void showTotal() {
    print('📊 จำนวนผู้ใช้ทั้งหมด: $totalUsers');
  }
}

/*
💡 อธิบาย:
   • totalUsers เป็น static variable
   • ทุก instance share ค่าเดียวกัน
   • เมื่อสร้าง instance ใหม่ totalUsers เพิ่ม
   • User.showTotal() เรียกโดยไม่สร้าง instance
   • User.totalUsers เข้าถึง static variable ได้โดยตรง
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 2: Static Constant
//───────────────────────────────────────────────────────────────────────────────

class Math {
  static const double PI = 3.14159;
  static const double E = 2.71828;
  static const int MAX_ITERATIONS = 100;

  // Static method
  static double circleArea(double radius) {
    return PI * radius * radius;
  }

  static double circleCircumference(double radius) {
    return 2 * PI * radius;
  }

  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }
}

/*
💡 อธิบาย:
   • Static const เป็นค่าคงที่ของคลาส
   • Math.PI เข้าถึงได้โดยตรง
   • Static method circleArea() ใช้ PI
   • ไม่ต้องสร้าง Math instance ก็ใช้ได้
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 3: Static Configuration
//───────────────────────────────────────────────────────────────────────────────

class AppConfig {
  static String appName = 'MyApp';
  static String version = '1.0.0';
  static bool debugMode = false;
  static String apiUrl = 'https://api.example.com';

  static void setDebugMode(bool debug) {
    debugMode = debug;
    print('🔧 Debug mode: $debug');
  }

  static void printConfig() {
    print('📱 $appName v$version');
    print('🌐 API: $apiUrl');
    print('🐛 Debug: $debugMode');
  }

  static String getFullVersion() {
    return '$appName-$version${debugMode ? "-debug" : ""}';
  }
}

/*
💡 อธิบาย:
   • AppConfig มี static variables สำหรับ configuration
   • เข้าถึง AppConfig.appName ได้โดยตรง
   • Static method printConfig() ใช้ static variables
   • Static method getFullVersion() คืนค่าจาก static
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 4: Instance + Static Mixed
//───────────────────────────────────────────────────────────────────────────────

class BankAccount {
  String accountNumber = '';
  double balance = 0;
  static double interestRate = 2.5; // ดอกเบี้ยร่วมกันทั้งหมด
  static int totalAccounts = 0;

  BankAccount(this.accountNumber, this.balance) {
    totalAccounts++;
  }

  void deposit(double amount) {
    balance += amount;
    print('💰 ฝาก $amount บาท');
  }

  void applyInterest() {
    double interest = balance * (interestRate / 100);
    balance += interest;
    print('📈 เพิ่มดอกเบี้ย ${interest.toStringAsFixed(2)} บาท');
  }

  void display() {
    print('🏦 บัญชี: $accountNumber, ยอด: ${balance.toStringAsFixed(2)} บาท');
  }

  // Instance method เข้าถึง static
  String getInfo() {
    return 'BankAccount: $accountNumber (ดอกเบี้ย: $interestRate%)';
  }

  // Static method เข้าถึง static
  static void changeInterestRate(double newRate) {
    interestRate = newRate;
    print('📊 ปรับดอกเบี้ยเป็น $newRate%');
  }

  // Static method
  static void showStats() {
    print('📈 จำนวนบัญชีทั้งหมด: $totalAccounts');
    print('📊 ดอกเบี้ยปัจจุบัน: $interestRate%');
  }
}

/*
💡 อธิบาย:
   • accountNumber, balance: instance variables (ต่างกัน)
   • interestRate, totalAccounts: static variables (shared)
   • deposit() เขียน balance ของ instance
   • applyInterest() อ่าน static interestRate
   • changeInterestRate() แก้ static interestRate สำหรับทั้งคลาส
   • showStats() static method ใช้ static variables
*/

//───────────────────────────────────────────────────────────────────────────────
// ✨ ตัวอย่างที่ 5: Static Factory Pattern
//───────────────────────────────────────────────────────────────────────────────

class Logger {
  String name = '';
  DateTime createdAt = DateTime.now();

  Logger._(this.name); // Private constructor

  static Logger? _instance; // Singleton

  // Static factory method
  static Logger getInstance(String name) {
    _instance ??= Logger._(name);
    return _instance!;
  }

  void log(String message) {
    print('[$name] $message');
  }

  static void printLoggerInfo() {
    if (_instance != null) {
      print(
        '📝 Logger: ${_instance!.name}, สร้างเมื่อ: ${_instance!.createdAt}',
      );
    } else {
      print('📝 ยังไม่มี Logger instance');
    }
  }
}

/*
💡 อธิบาย:
   • Logger ใช้ static factory pattern
   • _instance: static variable เก็บ singleton
   • getInstance(): static method ที่ return Logger
   • ??=: null coalescing assignment
   • สร้าง Logger instance เพียงครั้งเดียว
*/

//═════════════════════════════════════════════════════════════════════════════════
// 🎯 Main Program - ตัวอย่างสมบูรณ์
//═════════════════════════════════════════════════════════════════════════════════

void main() {
  print('═══════════════════════════════════════════════════\n');
  print('📚 Lesson 028: Static (สมาชิกของคลาส)\n');
  print('═══════════════════════════════════════════════════\n');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 1️⃣ Static Variable - Counter
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('1️⃣ Static Variable - Counter:');
  print('────────────────────────\n');

  User.showTotal();
  print('');

  var user1 = User('สมชาย');
  user1.display();
  User.showTotal();
  print('');

  var user2 = User('วิชัย');
  user2.display();
  User.showTotal();
  print('');

  var user3 = User('อนัน');
  user3.display();
  User.showTotal();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 2️⃣ Static Constant
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('2️⃣ Static Constant (Math):');
  print('────────────────────\n');

  print('π (PI) = ${Math.PI}');
  print('e (E) = ${Math.E}');
  print('');

  double radius = 5;
  print('วงกลมรัศมี $radius:');
  print('พื้นที่: ${Math.circleArea(radius).toStringAsFixed(2)}');
  print('เส้นรอบวง: ${Math.circleCircumference(radius).toStringAsFixed(2)}');
  print('');

  print('factorial(5) = ${Math.factorial(5)}');
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 3️⃣ Static Configuration
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('3️⃣ Static Configuration:');
  print('──────────────────\n');

  AppConfig.printConfig();
  print('');

  AppConfig.setDebugMode(true);
  print('Version string: ${AppConfig.getFullVersion()}');
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 4️⃣ Instance + Static Mixed
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('4️⃣ Instance + Static Mixed:');
  print('──────────────────────\n');

  BankAccount.showStats();
  print('');

  var acc1 = BankAccount('001', 10000);
  var acc2 = BankAccount('002', 20000);

  acc1.display();
  acc2.display();
  print('');

  print('${acc1.getInfo()}');
  print('${acc2.getInfo()}');
  print('');

  acc1.deposit(5000);
  acc1.applyInterest();
  acc1.display();
  print('');

  acc2.applyInterest();
  acc2.display();
  print('');

  BankAccount.changeInterestRate(3.5);
  print('');

  BankAccount.showStats();
  print('');

  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // 5️⃣ Static Factory Pattern
  //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  print('5️⃣ Static Factory Pattern (Singleton):');
  print('─────────────────────────────────\n');

  Logger.printLoggerInfo();
  print('');

  var logger1 = Logger.getInstance('MyLogger');
  logger1.log('App started');
  print('');

  Logger.printLoggerInfo();
  print('');

  var logger2 = Logger.getInstance('AnotherLogger');
  logger2.log('Processing data');
  print('');

  print('logger1 === logger2: ${identical(logger1, logger2)}');
  print('');

  print('═══════════════════════════════════════════════════\n');
  print('✅ เสร็จสิ้น!\n');
}

//═══════════════════════════════════════════════════════════════════════════════
// 📖 SUMMARY (สรุปบทเรียน)
//═══════════════════════════════════════════════════════════════════════════════
/*
✅ สิ่งที่สำคัญ:

1️⃣ INSTANCE VARIABLE
   - ต่างกันสำหรับแต่ละ instance
   - obj.property
   - แต่ละ instance มี memory ต่างกัน

2️⃣ STATIC VARIABLE
   - เดียวกันสำหรับทั้งคลาส
   - ClassName.property
   - Share ค่าเดียวกัน
   - เรียก static ได้เลยโดยไม่สร้าง instance

3️⃣ STATIC METHOD
   - เป็นของคลาส ไม่ใช่ instance
   - ClassName.method()
   - ไม่สามารถเข้าถึง instance member ได้
   - ใช้ static variable ได้

4️⃣ INSTANCE METHOD
   - ต้องสร้าง instance ก่อน
   - obj.method()
   - สามารถเข้าถึง static ได้
   - สามารถเข้าถึง instance member ได้

5️⃣ STATIC CONSTANT
   - static const double PI = 3.14159;
   - ค่าคงที่ของคลาส
   - เข้าถึง ClassName.PI ได้

6️⃣ USE CASES ของ STATIC
   ✓ Counter (User.totalCount)
   ✓ Configuration (AppConfig)
   ✓ Utility methods (Math.circleArea())
   ✓ Shared resource (Logger singleton)
   ✓ Constants (Math.PI, Colors.RED)

7️⃣ RULES เขตข้อมูล
   • Instance method: ✓ instance, ✓ static
   • Static method: ✗ instance, ✓ static

✨ ตัวอย่างการเข้าถึง:
   ┌─────────────────────────────────┐
   │ Instance Variable:              │
   │ obj.property                    │
   │                                 │
   │ Static Variable:                │
   │ ClassName.property              │
   │                                 │
   │ Instance Method:                │
   │ obj.method()                    │
   │                                 │
   │ Static Method:                  │
   │ ClassName.method()              │
   └─────────────────────────────────┘

✨ Static Scope:
   class MyClass {
     int instance = 0;           // Instance variable
     static int static = 0;      // Static variable

     void instanceMethod() {
       print(instance);          // ✓ OK
       print(static);            // ✓ OK (ทั้งคลาสใช้)
       print(this.instance);     // ✓ OK
     }

     static void staticMethod() {
       print(static);            // ✓ OK
       // print(instance);        // ❌ Error!
       // print(this);            // ❌ Error! (ไม่มี this)
     }
   }
*/

//═══════════════════════════════════════════════════════════════════════════════
// 🎯 EXERCISES (แบบฝึกหัด)
//═══════════════════════════════════════════════════════════════════════════════
/*
📌 แบบฝึกหัดที่ 1: Counter
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • Product (name, price)
  • Static counter: totalProducts
  • Instance method: display()
  • Static method: showTotal()

จากนั้น:
  1. สร้าง 3 products
  2. ดู totalProducts เพิ่มขึ้น
  3. แต่ละ instance มี name, price ต่างกัน

📌 แบบฝึกหัดที่ 2: Utility Class
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Utility class:
  • StringUtils
    - static String toUpperCase(String str)
    - static String toLowerCase(String str)
    - static int length(String str)
    - static String reverse(String str)

จากนั้น:
  1. เรียก StringUtils.toUpperCase('hello')
  2. เรียก StringUtils.reverse('dart')
  3. ไม่ต้องสร้าง instance

📌 แบบฝึกหัดที่ 3: Application Configuration
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Config class:
  • Static const: APP_NAME, VERSION, DATABASE_URL
  • Static variable: isLoggedIn, currentUser
  • Static method: login(user), logout(), getStatus()

จากนั้น:
  1. สร้าง login/logout system
  2. ทุก instance ใช้ currentUser เดียวกัน
  3. ทดสอบ getStatus()

📌 แบบฝึกหัดที่ 4: Challenge - E-Commerce with Discount
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
สร้าง Class:
  • ShoppingCart (itemCount)
  • Static discount: globalDiscount (ใช้ได้ทั้งหมด)
  • Static method: applyGlobalDiscount(value)
  • Instance method: calculateTotal(price)

จากนั้น:
  1. สร้าง 2 shopping carts
  2. ปรับ globalDiscount
  3. ดูว่าทั้ง 2 carts ได้ discount เดียวกัน
  4. สร้าง static method showStatistics()

💡 เคล็ดลับ:
   ✓ Static ไม่ต้องสร้าง instance
   ✓ Static variable share ค่าทั้งคลาส
   ✓ Instance method เข้าถึง static ได้
   ✓ Static method เข้าถึง instance ไม่ได้
   ✓ ใช้ static สำหรับค่าที่ทั้งคลาสใช้ร่วม
*/
