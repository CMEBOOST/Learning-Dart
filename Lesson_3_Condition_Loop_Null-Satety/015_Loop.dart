import 'dart:io';
import 'dart:math';

//loop การทำงานแบบวนรอบ หรือ ทำซ้ำ

//การวนลูปแบบ for
//จากค่าเริ่มต้น จนถึงค่าสุดท้ายที่เป็นจำนวณนับ

// for (ตัวแปล = ค่าเริ่มต้น ; เงื่อนไขการวนลูป; i++){
//      คำสั่งต่างๆ
//  }

void main() {
  int sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += i;
    print("$sum");
  }
  count();
  dbcount();
  my_while();
  guess_number();
  gess_number_do_while();
  mybreak();
  my_continue();
}
// เริ่มเปรียบเทียบกับตัวนับว่า ตรงตามเงื่อนไขหรือไม่
// หากยังอยู่ในเงื่อนไข ก็ทำงานลูปถัดไป
// แค่ถ้าไม่ตรงตามเงื่อนไข ก็จะออกจากลูป

// สามารถเพิ่มค่าทีละ 1 ++ , หรือ ลดค่าทีละ 1-- ก็ได้
void count() {
  for (int i = 10; i > 0; i--) {
    print("$i"); //9 8 7 6 5 4 3 2 1
  }
  // i = 10 -> i มากกว่า 0 ไหม ใช่ ทำคำสั่งใน scope จากนั้น i-- ลดค่า i ลง 1
}

// for สามารถใช้ กับ double ได้

void dbcount() {
  int count = 0;
  for (double i = 1.9; i < 10.1; i += 0.1) {
    count++;
  }
  print("จาก 1.9 จนถึง 10.1 ทำไปทั้งหมด $count รอบ");
}

//while loop
//เราจะใช้ for ในกรณีรู้ค่าเริ่มต้น และค่าสุดท้าย
//หากไม่ทราบการเลือกใช้ while ลูป ดีกว่า
//โดย while loop จะทำการตรวจสอบเงื่อนไขก่อนทำการวนรอบ
//หากเงื่อนไขเป็นจริง จะทำคำสั่งภายใน หากเป็นเท็จจะจบการทำงาน

// while (เงื่อนไข) {
//    คำสั่ง;
//  }

void my_while() {
  int number = 0;
  while (number <= 10) {
    number++;
    print('$number');
  }
}

//สุ่มกี่ครั้งถึงจะได้
void guess_number() {
  int count = 0;
  var rand = Random();
  int answer = 0;
  while (answer != 9) {
    answer = rand.nextInt(15);
    count++;
    print("$answer");
  }
  print("$count รอบ");
}

// do-while
//จะเป็นการตรวจสอบ เงื่อนไขท้ายลูป
//โดยจะทำคำสั่งภายใน do {} อย่างน้อย 1 ครั้ง
//จากนั้นตรวจสอบค่า ตรวจสอบเงื่อนไข ถ้าจริง ทำอีก 1 รอบ

void gess_number_do_while() {
  double mynumber = 0;
  int count = 0;
  var rand = Random();
  do {
    mynumber = (rand.nextDouble() * 20);
    print('this is my number $mynumber');
    count++;
  } while (mynumber <= 11);
  print("จำนวน $count รอบ");
}

// while ตรวจสอบเงื่อนไขก่อนทำงาน หากเป็นเท็จจะหยุดทำงาน
// do-while ตรวจสอบเงื่อนไขท้ายท้ายลูป และ ทำ do ก่อน 1 รอบ

//คำสั่ง break
//ระบุไว้เพื่อต้องการออกจากลูป

void mybreak() {
  for (int i = 0; i < 10; i++) {
    print("$i");
    if (i == 5) {
      // ถ้า i เป็น 5 ให้อยุดการทำงาน
      break;
    }
  }
}

//คำสั่ง continue
//วนลูปถัดไปโดยไม่ทำคำสั่งถัดจาก continue

void my_continue() {
  int number = 0;
  while (number < 10) {
    number++;
    if (number == 7) {
      continue; //ข้าม ลูปนี้ และไม่ print("7") ใน console
    }
    print("$number");
  }
}
