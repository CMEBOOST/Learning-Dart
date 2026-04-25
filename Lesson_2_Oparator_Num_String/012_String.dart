// การแทรก ข้อมูลลงใน String และการดำเนินการกับ String

void main() {
  String name = "Surachet";
  int age = 12;

  // การแทรกข้อมูลลงใน String
  print("My name is $name and I am $age years old.");

  // การใช้เครื่องหมาย {} เพื่อแทรก expression ลงใน String
  print("Next year, I will be ${age + 1} years old.");

  // การใช้เครื่องหมาย \$ เพื่อแสดงเครื่องหมาย $ ใน String
  print("The price is \$100.");
  stringMethods();
  cast_string_number();
}

// String Methods
void stringMethods() {
  // length ความยาวของ String
  var name = "Surachet";
  print("ชื่อของ $name มีความอยากทั้งหมด :${name.length}");

  // contains() มี String ที่ระบุไว้ไหม จะคืน True / False
  print("ภายใน $name ที 'S' อยู่ไหม ${name.contains("S")}");

  // indexOf() ตำแหน่งของ String ที่เจอเป็นครั้งแรง
  print("ตำแหน่งของ 'e' ใน $name คือ ${name.indexOf("e")}");

  // lastindexOf() ตำแหน่งของ String ที่เจอครั้งสุดท้าย
  var fruit = "Banana";
  print("ตำแหน่งสุดท้ายของ 'a' คือ ${fruit.lastIndexOf("a")}");

  // endWith() ลงท้ายด้วย String ที่ระบุ หรือไม่ จะคืน T/F
  print("ตำแหน่งสุดท้ายของ $fruit ลงท้ายด้วย o หรือไม่ ${fruit.endsWith("o")}");

  // startsWith() เริ่มต้นด้วย String ที่ระบุหรือไม่ คืน T/F
  print(
      "ตำแหน่งแรกของ $fruit ขึ้นต้นด้วย 'B' หรือไม่ ${fruit.startsWith("B")}");

  // padLeft(จำนวน, สตริงที่จะเติม) เติม String ทางด้านซ้าย
  var agent = '7';
  print(agent.padLeft(3, "0"));

  // padRight(จำนวน, สตริงที่จะเติม) เติม String ทางด้านขวา
  print(agent.padRight(4, "0"));

  // toLowerCase() แปลง String เป็น พิมพ์เล็กทั้งหมด
  var city = "Bangkok";
  print("เปลี่ยนให้เป็นพิมพ์เล็ก จาก $city ไปเป็น ${city.toLowerCase()}");

  // ToUpperCase() แปลง String เป็น พิมพ์ใหญ่ทั้งหมด
  print(
      "เปลี่ยนให้เป็นพิมพ์ใหญ่ทั้งหมด จาก $city ไปเป็น ${city.toUpperCase()}");

  // substring(start, [end]) นับจำนวนสตริงจากจุดเริ่มต้น ไปจนที่จำนวน end ที่ระบุ
  var qoute = "This is a part of me";
  print(
      "นับจำนวนสตริง จาก a ของ $qoute นับได้ ${qoute.substring(7, qoute.length)}");

  // replaceFirst(สตริงเดิม, สตริงไหม่) แทนที่ String เดิมครั้งแรกที่พบ
  var word = 'nonothisisnono';
  print(
      "เปลี่ยนจาก no ตัวแรกที่พบเป็น yes : ${word.replaceFirst("no", "yes")}");

  // replaceAll(สตริงเดิม, สตริงไหม่) แทนที่ String ทั้งหมด
  print("เปลี่ยน no เป็น Yes ทั้งหมด ${word.replaceAll("no", "yes")}");

  // split() ใช้สตริงที่ระบบเป็นตัวคัดแยกคำออกเป็นย่อยๆ ได้ผลลัพเป็น list
  var words = 'you/can/do/what/you/want';
  print("ยากคำด้วย '/' : ${words.split('/')}");

  // trim() ตัดช่องว่างและอักขระที่ไม่มีรูปร่าง เช่น \n ที่อยู่ก่อน หรือท้าย String
  print("ตัดออกตัวที่มีรูปร่างออก ${words.trim()}");

  // trimLeft() ตัดช่องว่างที่อยู่ก่อนสตริง
  var country = ' Labanono ';
  print(country.trimLeft());
  // trimRight() ตัดช่องว่างที่อยู่ท้ายสตริง
  print(country.trimRight());
}

//แปลง String Number parse()
void cast_string_number() {
  String s1 = '123'; //String
  int a = int.parse(s1); // a = 123 (int)

  int b = int.parse(123.12); // error เพราะ 123.12 เป็น double

  String s2 = '3.1415'; //String
  double d = double.parse(s2); // 3.1415 (double)

  String s3 = '167'; //String
  String s4 = '69.99'; //String

  num f = num.parse(s3); // 167 (num)
  num g = num.parse(s4); // 69.99 (num)

  //-----------------------------------------------
  // ในกรณีอยากเปลี่ยนข้ามชนิด จาก String เป็น ตัวเลข ใช้ to.String();

  int i1 = 192;
  double d1 = 192.168;

  String tos1 = i1.toString(); // '192' (string)
  String tos2 = d1.toString(); // '192.168'
}
