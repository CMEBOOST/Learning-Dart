

# 📚 Introduction to Dart Programming Language

## 🎯 Dart คืออะไร?

**Dart** เป็นภาษาโปรแกรมแบบ Object-Oriented ที่ออกแบบโดย **Google** เพื่อสร้างแอปพลิเคชันที่รวดเร็ว สำหรับหลากหลายแพลตฟอร์ม

```
Dart = Fast + Multi-platform + Easy to learn
```

---

## ⚡ ลักษณะเฉพาะของ Dart

| ลักษณะ | อธิบาย |
|--------|---------|
| 🚀 **รวดเร็ว** | Compile ได้เร็วและรันได้อย่างมีประสิทธิภาพ |
| 🌐 **Multi-platform** | ใช้สำหรับ Web, Mobile (Flutter), Desktop, Server |
| 📱 **Flutter** | Framework ตัวอย่างที่ใช้ Dart (แอป Android/iOS) |
| 🔒 **Type-safe** | รองรับ Type checking (static & dynamic) |
| 🎓 **ง่ายเรียนรู้** | ไวยากรณ์คล้าย Java, JavaScript, Python |
| ♻️ **Garbage Collection** | บริหารจัดการหน่วยความจำโดยอัตโนมัติ |
| 🔄 **Hot Reload** | เปลี่ยนแปลงโค้ดและเห็นผลลัพธ์ทันที (ใน Flutter) |

---

## 📖 ประวัติ Dart

- **2011**: Google ประกาศเปิดตัว Dart
- **2015**: Dart 1.0 - Stable Release
- **2018**: Dart 2.0 - Strong Type System
- **2021**: Dart 2.12 - Null Safety
- **ปัจจุบัน**: Dart 3.0+ - ใช้งานอย่างแพร่หลาย

---

## 🛠️ การใช้งาน Dart

### 1. **Flutter Apps** (นิยมมากที่สุด)
   - แอปพลิเคชัน iOS และ Android
   - Cross-platform development
   - ตัวอย่าง: Google Ads, Alibaba, BMW

### 2. **Web Development**
   - ทำเป็น JavaScript ได้
   - ใช้กับ Framework เช่น Aqueduct, Shelf

### 3. **Backend Server**
   - RESTful APIs
   - Microservices
   - IoT Applications

### 4. **Desktop Apps**
   - Windows, macOS, Linux
   - ใช้กับ Flutter Desktop

---

## ✅ ข้อดี

- ✓ ภาษาง่าย มีไวยากรณ์ชัดเจน
- ✓ Null Safety ช่วยลดจำนวนบัก
- ✓ Hot Reload ประหยัดเวลา Development
- ✓ Performance ดี เหมาะสำหรับ Production
- ✓ Community ใหญ่ มี Package มากมาย

---

## ❌ ข้อเสีย

- ✗ Community เล็กกว่า Java, Python, JavaScript
- ✗ Job opportunity น้อยกว่า Mainstream languages
- ✗ Mostly ใช้กับ Flutter (ไม่ยืดหยุ่นนัก)

---

## 🔧 วิธีติดตั้ง

### ขั้นตอน 1: ติดตั้ง VS Code
- ดาวน์โหลดจาก https://code.visualstudio.com/

### ขั้นตอน 2: ติดตั้ง Dart SDK
- ดาวน์โหลดจาก https://dart.dev/get-dart
- เลือกตามระบบปฏิบัติการของคุณ (Windows, macOS, Linux)

**Windows (PowerShell):**
```powershell
choco install dart-sdk
```

**macOS (Homebrew):**
```bash
brew tap dart-lang/dart
brew install dart
```

### ขั้นตอน 3: ติดตั้ง Dart Extension
- เปิด VS Code
- ไปที่ Extensions (Ctrl+Shift+X)
- ค้นหา "Dart" และติดตั้ง Official extension จาก **Dart Code**

### ขั้นตอน 4: ติดตั้ง Flutter (Optional - สำหรับ Mobile)
- ดาวน์โหลดจาก https://flutter.dev/docs/get-started/install
- ติดตั้ง Flutter Extension ใน VS Code

---

## ✔️ ตรวจสอบการติดตั้ง

เปิด Terminal/PowerShell และพิมพ์:

```bash
dart --version
```

ถ้ามีผลลัพธ์ก็แสดงว่าติดตั้งสำเร็จแล้ว ✅

---

## 🚀 Program Dart แรก

สร้างไฟล์ `hello.dart`:

```dart
void main() {
  print("Hello, Dart! 👋");
}
```

รันด้วยคำสั่ง:

```bash
dart hello.dart
```

Output:
```
Hello, Dart! 👋
```

---

## 📚 Resources เพิ่มเติม

- 📖 Official Documentation: https://dart.dev
- 📖 Flutter Documentation: https://flutter.dev
- 🎓 DartPad (Online Editor): https://dartpad.dev
- 💬 Dart Community: https://www.reddit.com/r/dartlang/
- 📦 Pub.dev (Package Manager): https://pub.dev

---

## 🎯 เป้าหมายของหลักสูตรนี้

1. เรียนรู้พื้นฐาน Dart
2. เข้าใจ OOP Concepts
3. ฝึกฝน Control Flow และ Functions
4. เตรียมตัวสำหรับ Flutter Development

---

**Happy Coding! 🎉**