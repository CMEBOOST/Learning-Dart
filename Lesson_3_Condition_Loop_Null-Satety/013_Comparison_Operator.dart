// การเปรียบเทียบ Comparoson Oparator
// ใช้เปรียบเทียบระหว่าง 2 ข้อมูล

void main() {
  bool a, b, c;

  // == เท่ากันกับ (Equality or Equal to) a == b
  print(a = (1 == 2)); //false
  print(b = (2 == 2)); //true

  // != ไม่เท่ากับ (Ineuqlity or Not Equal to) a != b
  print(a = (1 != 2)); //true
  print(b = (2 != 2)); //false

  // > มากกว่า (Greater than) a > b
  print(a = (5 > 1)); //true
  print(b = (1 > 7)); //false

  // < น้อยกว่า (Less than) a < b
  print(a = (2 < 5)); //true
  print(b = (5 < 2)); //false

  // >= มากกว่าหรือเท่ากับ (Greater than or Equal to)
  print(a = (10 >= 2)); //true
  print(b = (2 >= 5)); //false
  print(c = (10 >= 10)); //true

  // <= น้อยกว่าหรือเท่ากับ (Less than or Equal to)
  print(a = (2 <= 5)); //true
  print(b = (10 <= 2)); //false
  print(c = (5 <= 5)); //true

  //-------------------------------------------------
  // การเปรียบเทียบ String
  //เป็นการเปรียบเทียบ String ด้านในว่าเป็นค่าเดียวกันไหม คือค่าเป็น true / false

  // String_1 == String__2;

  bool w = ('Hello' == 'Hello'); //true
  bool x = ("hello" == "hi"); // false
  bool y = ("Hello" == "hello"); //false Case sensitivity
  bool z = ("Hello" == 'Hello'); // true

  print('$w, $x, $y, $z');
  //-------------------------------------------------
  //เครื่องหมายทาง ตรรศาสตร์
  //เป็นการเปรียบเทียบระหว่าง 2 เงื่อนไข

  bool l;

  // && และ (Logical And) ถ้าทั้งสองเป็นจริงทั้งคู่ ผลก็จะได้จริง นอกนั้นเท็จหมด
  l = (1 < 2) && (3 < 4); // true && true = true
  l = (1 < 2) && (2 == 1); // true && false = false
  l = (1 > 3) && (1 != 1); // false && false = false

  // || หรือ (Logical Or) ถ้าเท็จทั้งคู่ ก็จะได้เท็จ นอกนั้นจริงหมด
  l = (1 < 2) || (3 < 4); // true || true = true
  l = (1 == 2) || (3 < 4); // false || true = true
  l = (1 > 3) || (10 < 1); // false || false = false

  // ! ไม่ (Logical Not) เป็นค่าตรงข้ามที่กำหนด
  l = !(1 == 2); // !false = true
  l = !(10 >= 1); // !true = false
  l = !(1 > 3) && !(2 > 4); // !false && !false => true && true = true
  l = !((1 > 3) && (2 > 4)); // (false && fales) = !(false) = true
}
