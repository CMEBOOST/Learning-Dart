//ใช้ Dynamic ก็ต่อเมื่อไม่รู้ว่าตัวแปรนั้นจะเก็บข้อมูลประเภทไหน
void main() {
  dynamic variable = "Hello";
  print(variable); // Output: Hello

  variable = 123;
  print(variable); // Output: 123

  variable = [1, 2, 3];
  print(variable); // Output: [1, 2, 3]
}

//ใช้ var เมื่อเรารู้ว่าตัวแปรนั้นจะเก็บข้อมูลประเภทไหน แต่ไม่ต้องการระบุชนิดข้อมูลอย่างชัดเจน

void main_var_no_defalut() {
  var a; // a เทียบเท่ากับ dynamic แต่จะไม่สามารถเปลี่ยนประเภทข้อมูลได้หลังจากกำหนดค่าแล้ว
  a = 123; // a เป็น int
  a = 0.99; // a เป็น double
}

void main_var_with_defalut() {
  var a = 123; // a ถูกกำหนดเป็น int โดยอัตโนมัติ
  // a = "Hello"; // จะเกิดข้อผิดพลาดเพราะ a ถูกกำหนดเป็น int แล้ว
}

/*
ความแตกต่าง:
- dynamic:  สามารถเปลี่ยนชนิดข้อมูลได้ตลอดเวลา
- var:      ชนิดถูกกำหนดตั้งแต่การกำหนดค่าเริ่มต้น ไม่สามารถเปลี่ยนได้
*/
