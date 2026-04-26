import 'dart:math';
//การป้อมการข้อผิดพลาดจาก Null safety
//คำว่า null คือ ค่าว่าง หรือไม่มีค่า

//เราไม่สามารถกำหนด null ให้กำตัวแปลตรงๆได้ เช่น

// int number = null; // Error
// var name = null; // Error

//ใช้ null ในกรณีที่คาดเดาไม่ได้ว่าตัวแปลจะเก็บค่าไว้หรือไม่
//ถ้าตัวแปลมีค่าใดๆ ก็จัดการได้ปรกติ
//แต่ถ้าไม่มีค่าใดๆ เลย จะต้องใช้ null
//ภาษา Dart เรียกหลักการนี้ว่า "(Sound) Null Safety"
//เป็นการป้องกันว่า กรณีที่อาจะเกิด Null ขึ้น

//ชนิดข้อมูลแบบ Nullable Type
//โดยการกำหนด เครื่องหมาย ? ต่อท้ายชนิดข้อมูล int?, string?

void main() {
  int? score;
  score = 12;
  score = null;

  String? name;
  name = 'Suracher';
  name = null;

  double? height = null;
  // double age = null; // Error

  //การใช้ null-aware oparator
  //การใช้ function อะไรต่างๆ ที่เกี่ยวกับ null อาจเกิดข้อผิดพลาด
  //Dart จึงมีวิธีจัดการกับพวกค่า null พวกนี้

  // ?? if-null กำหนด default หากตัวที่เชี่ยมโยงมีค่าเป็น Null
  int? a = null;
  int? b = a ?? 0; //ถ้า a เป็น null b จะมีค่าเป็น 0
  //เทียบเท่ากับ
  int? d, e;
  if( d == null;){
    e == 0;
  }

  // ??= null-aware assignment กำหนดค่า default หากตัวแปลนั้นมีค่า null ด้วยตัวของมันเอง
  int? x ;
  x = x ?? 0; // ถ้า x มีค่าเป็น null x จะมีค่าเป็น 0

  // ! null-aware assertion สำหรับยืนยันว่าตัวแปลนั้นไม่มีค่าเป็น null แล้ว
  //มักใช้กับ ฟังก์ชั่น
  int? my = get_x();
  my += 1;

  int? my2 = get_x()!; // <-- assert
  //เป็นการยืนยันว่าค่าที่ได้กลับมาจะไม่ null

  // ?. null-aware access (method vocation)
  //    จะเรียก method ก็ต่อเมื่อ object นั้นไม่เป็น null แล้ว
  String str;
  String? substr = str?.substring(5);
  //ถ้าตัวแปล str ไม่เป็น null
  //จึงจะเรียน method substring();
  //ไม่อย่างนั้นก็เป็น null
  //
}

get_x(){
  var rand = Random();
  int x = rand.nextInt(100);
  return x;
}

/*
═══════════════════════════════════════════════════════════════
                    📝 สรุป Null Safety
═══════════════════════════════════════════════════════════════

❓ Null คืออะไร?
  - ค่าว่าง / ไม่มีค่า
  - ใช้เมื่อตัวแปรไม่แน่ใจว่าจะมีค่าหรือไม่

🛡️ Null Safety (Sound Null Safety)
  - Dart ป้องกันปัญหา null โดยอัตโนมัติ
  - ตรวจสอบ null ตั้งแต่เขียนโค้ด ไม่รอถึง runtime
  - ช่วยหลีกเลี่ยง "Null Pointer Exception" บัคที่ส่วนใหญ่หา

🎯 Nullable Type - ใช้ ?
  ─────────────────────────────
  String? name;        // ✅ อนุญาต null
  String name;         // ❌ ห้าม null
  
  int? score = null;   // ✅ OK
  int age = null;      // ❌ ERROR!

🔧 Null-Aware Operators (5 ตัว)
  ─────────────────────────────
  1. ? → ประกาศ nullable type
     int? score;
  
  2. ?? → if-null (ให้ค่า default)
     int b = a ?? 0;  // ถ้า a เป็น null ใช้ 0
  
  3. ??= → null-aware assignment
     x ??= 10;  // ถ้า x เป็น null ให้ = 10
  
  4. ?. → safe navigation (ปลอดภัย!)
     name?.length  // ถ้า null ไม่ crash
  
  5. ! → null assertion (บังคับ - เสี่ยง!)
     int x = my!;  // "ฉันแน่ใจ ไม่เป็น null"

📊 ตารางเปรียบเทียบ
  ──────────────────────────────
  Operator | ใช้ทำไร          | ปลอดภัย  | ตัวอย่าง
  ─────────┼──────────────────┼─────────┼──────────
     ?     | ประกาศ nullable  | ✅✅✅  | String?
     ??    | ค่า default      | ✅✅    | a ?? 0
    ??=    | ตั้งค่าถ้า null  | ✅✅    | x ??= 10
     ?.    | เรียกปลอดภัย    | ✅✅✅  | str?.length
     !     | บังคับ (เสี่ยง)  | ⚠️      | x!

💡 เคล็ดลับ
  ──────────────────────────────
  ✅ ใช้ ?. บ่อยที่สุด (ปลอดภัย)
  ✅ ใช้ ?? สำหรับ default
  ⚠️  อย่า ! นอกจำเป็น (อันตราย)

🎓 สรุปกฎเบื้องต้น
  ──────────────────────────────
  1. ตัวแปรปกติ = ห้ามเป็น null
  2. ตัวแปรที่มี ? = อนุญาต null
  3. ต้องจัดการ null ก่อนใช้งาน
  4. ใช้ operators เหล่านี้เพื่อจัดการ null
═══════════════════════════════════════════════════════════════
*/