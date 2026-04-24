# Introduction to Dart Programming Language

เอกสารนี้สรุปภาพรวมภาษา Dart แบบอ่านง่าย ตั้งแต่แนวคิดหลักไปจนถึงแนวทางต่อยอดใช้งานจริง

## สารบัญ

1. Dart คืออะไร?
2. TL;DR
3. Dart มีมาเพื่ออะไร?
4. จุดเด่นที่ทำให้ Dart น่าเรียน
5. Dart ทำงานอย่างไร
6. เวอร์ชันและพัฒนาการสำคัญ
7. สิ่งที่ควรรู้ในภาษา Dart (Core Language)
8. ฟีเจอร์สมัยใหม่ใน Dart 3
9. ใช้ Dart ทำอะไรได้บ้าง?
10. ข้อดีและข้อจำกัด
11. ตัวอย่างโปรแกรม Dart แบบสั้น
12. โครงสร้างโปรเจกต์ Dart
13. แนวทางเรียน Dart ให้ไปเร็ว
14. Resources แนะนำ
15. เป้าหมายของหลักสูตรนี้

---

## Dart คืออะไร?

**Dart** เป็นภาษาโปรแกรมที่พัฒนาโดย Google เน้นความเร็ว, ความชัดเจนของโค้ด และรองรับการพัฒนาแบบข้ามแพลตฟอร์ม โดยนิยมมากที่สุดเมื่อนำไปใช้คู่กับ Flutter

แนวคิดสั้นๆ:

```text
Dart = Productive + Type-safe + Multi-platform
```

---

## TL;DR

- Dart คือภาษาโปรแกรมจาก Google ที่เด่นเรื่องความเร็วและความปลอดภัยของโค้ด
- จุดแข็งหลักคือ Type Safety + Null Safety ช่วยลดบั๊กตั้งแต่ก่อนรัน
- ใช้ทำแอปได้หลายแพลตฟอร์ม: Mobile, Web, Desktop และ Backend
- ทำงานร่วมกับ Flutter ได้ดีมาก เหมาะกับงาน UI ที่ต้องพัฒนาไว
- มีทั้ง JIT (ช่วงพัฒนา) และ AOT (ช่วง production) จึงได้ทั้งความเร็วตอนเขียนและตอนใช้งานจริง

---

## Dart มีมาเพื่ออะไร?

Dart ถูกสร้างมาเพื่อแก้ปัญหาหลักของการพัฒนาแอปยุคใหม่: เขียนแอปได้เร็วขึ้น, ปลอดภัยขึ้น, และนำโค้ดไปใช้ได้หลายแพลตฟอร์มโดยยังคงประสิทธิภาพที่ดี

เหตุผลสำคัญที่ Dart ถูกพัฒนาขึ้น:

1. **ลดภาระการทำหลายโค้ดเบส**: เขียนโค้ดชุดเดียวแล้วต่อยอดไป Mobile, Web, Desktop ได้ง่ายขึ้น
2. **เพิ่มความเร็วในการพัฒนา**: รองรับ workflow ที่ iterate เร็ว ทำให้ทีมพัฒนาแก้ไขและทดสอบฟีเจอร์ได้ไว
3. **เน้นประสิทธิภาพตอนใช้งานจริง**: คอมไพล์เป็นโค้ดที่เหมาะกับ production เพื่อให้แอปเปิดไวและลื่น
4. **ลดบั๊กตั้งแต่ต้นทาง**: Type system และ Null Safety ช่วยจับข้อผิดพลาดได้ตั้งแต่ขั้นพัฒนา
5. **รองรับงาน UI ที่ซับซ้อน**: เมื่อใช้ร่วมกับ Flutter จะได้โครงสร้างที่เหมาะกับงาน UI และ state ที่เปลี่ยนบ่อย

สรุปสั้นๆ:

**Dart มีมาเพื่อให้การสร้างแอปสมัยใหม่ "เร็วขึ้น เสถียรขึ้น และขยายสเกลได้ง่ายขึ้น"**

---

## จุดเด่นที่ทำให้ Dart น่าเรียน

| จุดเด่น | อธิบาย |
|---|---|
| Type-safe | ลดข้อผิดพลาดจากชนิดข้อมูลผิดพลาดตั้งแต่ก่อนรัน |
| Null Safety | ลดบั๊ก null reference อย่างมีนัยสำคัญ |
| อ่านง่าย | ไวยากรณ์ทันสมัย ใกล้เคียง Java, C#, JavaScript |
| เขียนเร็ว | มี type inference (`var`) และเครื่องมือช่วยดี |
| ทำงานหลายแพลตฟอร์ม | Mobile, Web, Desktop, Backend |
| Concurrency ดี | มี `Future`, `Stream`, และ `Isolate` |
| Ecosystem พร้อมใช้ | ใช้งานแพ็กเกจผ่าน `pub.dev` |

---

## Dart ทำงานอย่างไร (แบบเข้าใจง่าย)

แนวคิดสำคัญมี 2 โหมด:

1. **JIT (Just-In-Time)**
ใช้ระหว่างพัฒนา เพื่อให้แก้โค้ดแล้วทดสอบได้เร็ว (เช่น Hot Reload ใน Flutter)

2. **AOT (Ahead-Of-Time)**
ใช้ตอน build สำหรับ production เพื่อให้แอปเริ่มไวและทำงานมีประสิทธิภาพ

สรุปคือ: พัฒนาเร็วด้วย JIT และปล่อยใช้งานจริงเร็วด้วย AOT

---

## เวอร์ชันและพัฒนาการสำคัญ

- **2011**: Google เปิดตัว Dart
- **2018 (Dart 2)**: Type system แข็งแรงขึ้น
- **2021 (Dart 2.12)**: Null Safety
- **2023+ (Dart 3)**: เพิ่ม modern features เช่น Records, Patterns, Sealed classes

---

## สิ่งที่ควรรู้ในภาษา Dart (Core Language)

### 1) Variables และ Types

```dart
int age = 25;
double score = 99.5;
String name = "Dart";
bool isActive = true;
var city = "Bangkok"; // Dart อนุมานชนิดให้
```

### 2) Null Safety

```dart
String title = "Learn Dart"; // ห้ามเป็น null
String? subtitle; // อนุญาต null
subtitle = "Beginner";
```

### 3) Functions

```dart
int add(int a, int b) {
  return a + b;
}

String greet(String name, {String prefix = "Hello"}) {
  return "$prefix, $name";
}
```

### 4) Collections

```dart
List<int> numbers = [1, 2, 3];
Set<String> tags = {"dart", "flutter"};
Map<String, int> scores = {"math": 90, "eng": 85};
```

### 5) OOP

```dart
class User {
   final String name;
   User(this.name);

   void sayHi() => print("Hi, I am $name");
}
```

### 6) Async/Await

```dart
Future<String> fetchData() async {
   await Future.delayed(Duration(seconds: 1));
   return "done";
}
```

---

## ฟีเจอร์สมัยใหม่ใน Dart 3

- **Records**: กลุ่มข้อมูลแบบ lightweight
- **Pattern Matching**: แตกโครงสร้างข้อมูลได้สะดวก
- **Sealed Classes**: ควบคุม inheritance ให้ปลอดภัยขึ้น
- **Enhanced switch**: เขียนเงื่อนไขอ่านง่ายและครอบคลุมขึ้น

ตัวอย่างสั้น:

```dart
String describe((int, int) point) {
   return switch (point) {
      (0, 0) => "origin",
      (var x, var y) => "x=$x y=$y",
   };
}
```

---

## ใช้ Dart ทำอะไรได้บ้าง?

1. **Mobile Apps**: ผ่าน Flutter (iOS/Android)
2. **Web Apps**: Flutter Web หรือ Dart ฝั่งเว็บ
3. **Desktop Apps**: Windows/macOS/Linux ผ่าน Flutter
4. **Backend/API**: เขียน REST API, service, automation
5. **CLI Tools**: สร้าง command-line tools ได้ดี

---

## ข้อดีและข้อจำกัด (มุมใช้งานจริง)

### ข้อดี

- พัฒนาเร็วมาก โดยเฉพาะเมื่อใช้ Flutter
- โค้ดอ่านง่ายและดูแลง่าย
- Type safety + null safety ช่วยลด bug ตอนรันจริง
- โครงสร้างภาษาเหมาะกับทั้งผู้เริ่มต้นและงาน production

### ข้อจำกัด

- ตลาดงาน Dart โดยตรงยังน้อยกว่าภาษา mainstream บางตัว
- ถ้าไม่ทำ Flutter อาจไม่เห็น ecosystem เด่นเท่า JavaScript/Python
- บาง library เฉพาะทางอาจยังไม่หลากหลายเท่า ecosystem ที่เก่ากว่า

---

## ตัวอย่างโปรแกรม Dart แบบสั้น

```dart
void main() {
   const course = "Dart";
   final year = DateTime.now().year;
   print("Learning $course in $year");
}
```

---

## โครงสร้างโปรเจกต์ Dart ที่ควรรู้

- `bin/` จุดเริ่มรันโปรแกรม
- `lib/` โค้ดหลักที่ import ใช้ซ้ำ
- `test/` ชุดทดสอบ
- `pubspec.yaml` รายการ dependency และ metadata ของโปรเจกต์

---

## แนวทางเรียน Dart ให้ไปเร็ว

1. เริ่มจาก syntax พื้นฐาน: ตัวแปร, เงื่อนไข, loop, function
2. ฝึก collections: List, Map, Set และการแปลงข้อมูล
3. ทำความเข้าใจ class, constructor, encapsulation
4. ฝึก async/await และ Future/Stream
5. เริ่ม project เล็กๆ เช่น To-do CLI หรือ mini API
6. ถ้าจะทำแอป ให้ต่อยอดด้วย Flutter ทันที

---

## Resources แนะนำ

- Official Docs: https://dart.dev
- Language Tour: https://dart.dev/language
- Package Hub: https://pub.dev
- Online Playground: https://dartpad.dev
- Flutter Docs: https://flutter.dev

---

## เป้าหมายของหลักสูตรนี้

1. เข้าใจพื้นฐานภาษา Dart อย่างเป็นระบบ
2. เขียนโปรแกรมเชิงโครงสร้างและเชิงวัตถุได้
3. ใช้ async programming ได้ถูกต้อง
4. ต่อยอดสู่การพัฒนา Flutter ได้อย่างมั่นใจ

---

Happy Coding
