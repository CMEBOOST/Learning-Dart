//คำสั่ง if คำสั่งควบคุมการทำงาน
/*

if ( เงื่อนไข ) {
  คำสั่งต่างๆ เมื่อเงื่อนไขเป็นจริง Statement 
}

*/

// การกำหนดเงื่อนไขต้องกำหนด ภายใน () เสมอ
// สิ่งที่นำมาเป็นเงื่อนไขต้องให้ผลลัพธ์ผล true หรือ false เท่านั้น

void main() {
  String password = "abc123";

  if (password == "abc123") {
    print("Password Correct !");
  }
  int n1 = 100;
  int n2 = 300;

  if (n1 < n2) {
    print("n1 Greater than n2");
  }
  //----------------------------------
  //คำสั่ง else ใช้สำหรับกำหนดทิศทางอื่น หาก if ไม่ตรงตามเงื่อนไข

  /**
   * if (เงื่อนไข){
   *    คำสั่งต่างๆ หากเงื่อนไขเป็นจริง;
   * } else {
   *    คำสั่งต่างๆ หากเงื่อนไขเป็นเท็จ
   * }
   */

  int remaining = 5;
  if (remaining > 0) {
    print("remaining in stock : $remaining ");
  } else {
    print("Out of Stock !");
  }

  int num = 220;
  if (num % 2 == 0) {
    print("number is even"); //คู่
  } else {
    print("number is odd"); //คี่
  }

  //----------------------------------
  // คำสั่ง else if มีหลายเงื่อนไข

  /*
  if (เงื่อนไข 1){
    คำสั่งต่างๆ ถ้าตรงกับเงื่อนไข 1;
    } else if (เงื่อนไข 2){
        คำสั่งต่างๆ ถ้าตรงกับเงื่อนไข 2;
    } else if (เงื่อนไข 3){
        คำสั่งต่างๆ ถ้าตรงกับเงื่อนไข 3;
    } else { จะมี หรือไม่มีก็ได้
        คำสั่งต่างๆ ถ้าไม่ตรงกับเงื่อนไขอะไรเลย
    }
  */
  var balance = 30000;
  var withdraw = 2500;

  if (balance < withdraw) {
    print('ยอดเงินคงเหลือไม่พอ');
  } else if (withdraw > 20000) {
    print("ถอนได้ไม่เกิน 20000");
  } else if (withdraw % 100 != 0) {
    print("ต้องถอนจำนวนเต็มร้อยเท่านั้น");
  } else {
    balance -= withdraw;
    print("ยอดเงินคงเหลือ $balance บาท");
  }

  //----------------------------------

  //การกำหนดหลายเงื่อนไขด้วยเครื่องหมายทางตรรกะ && ||
  /*
  if ((เงื่อนไข 1)__(เงื่อนไข 1__(เงื่อนไข 1)__(เงื่อนไข n)){
    คำสั่ง เมื่อเปรียบเทียบเงื่อนไขรวมแล้วเป็นจริง};
  */
  var name = 'Surachet';
  var passwords = 'abc123';

  if ((name.toLowerCase() == "surachet") && (passwords == 'abc123')) {
    print('Login Sucessesful!');
  } else {
    print('Login filed');
  }

  if ((name.isEmpty) || (passwords.isEmpty)) {
    print("Please identify something !");
  } else {
    print("Let's go");
  }
  Ternary();
  swich_();
}
//----------------------------------

// Ternary เป็นการเปรียบเทียบเงี่อนไขที่ไม่ซับซ้อน และกระชับ

// (เงื่อนไข) ? การณีเงื่อนไขเป็นจริง : กรณีเงื่อนไขเท็จ

void Ternary() {
  var status = "";
  var age = 20;

  (age >= 18) ? status = "adult" : status = "kid";
  print(status);

  int a = 3;
  int b = 5;
  int max = (a > b) ? a : b;
  print(max);

  //เงื่อนในรูปแบบ if-else
  if (a > b) {
    max = a;
  } else {
    max = b;
  }
  print(max);

  int price = 2000;
  int tax = (price > 1000) ? 100 : 0;
  print("จำนวณที่ต้องจ่ายทั้งหมด ${price + tax} บาท");
}

//----------------------------------
//กำหนดเงื่อนไขด้วย Swich-case
//Swich-case แยกเงื่อนไขมาเป็นกรณีต่างๆ หากตรงกับกรณีใด ให้ทำคำสั่งใต้เงื่อนไขนั้น`
// ค่าที่นำมาใช้กับ switch จะต้องเป็น int and string

/*
switch (สิ่งที่ต้องการตรวจสอบ){
  case กรณีที่ 1 :
    คำสั่ง;
    break;
  case กรณที่ 2 :
    คำสั่ง;
    brake;
  case กรณีที่ n :
    คำสั่ง;
    break;
  default :
    คำสั่งเมื่อไม่ตรงกับกรณีใดเลย คล้าย else}
*/

void swich_() {
  int num = -1;
  switch (num) {
    case 1:
      print("positive");
    case -1:
      print("negative");
    default:
      print("Unknow");
  }
}

//ในกรณีคำสั่งรูปแบบเดียวกัน
void manySwitch() {
  String brand = "iphone";
  switch (brand) {
    case "samsung":
    case "Oppo":
    case "pixel":
      print("Android");
    case "iphone":
    case "ipad":
      print("IOS");
    default:
      print("Unknow Brand");
  }
}
