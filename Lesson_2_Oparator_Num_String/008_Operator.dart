/*
Oparator เครื่องหมายทางคณิตศาสตร์
= เท่ากับ หรือกำหนดค่า (Assignment) x = 10
+ บวก บวก (Addition) x + y
- ลบ ลบ (Subtraction) x - y
* คูณ คูณ (Multiplication) x * y
/ หาร หาร (Division) x / y
% หารเอาเศษ หารเอาเศษ (Modulus) x % y


~/ หารปัดเศษ หารปัดเศษ (Integer Division) x ~/ y
+= บวกและกำหนดค่า บวกและกำหนดค่า (Addition Assignment) x += 5 (เท่ากับ x = x + 5)
-= ลบและกำหนดค่า ลบและกำหนดค่า (Subtraction Assignment) x -= 3 (เท่ากับ x = x - 3)
*= คูณและกำหนดค่า คูณและกำหนดค่า (Multiplication Assignment) x *= 2 (เท่ากับ x = x * 2)
/= หารและกำหนดค่า หารและกำหนดค่า (Division Assignment) x /= 4 (เท่ากับ x = x / 4)
%= หารเอาเศษและกำหนดค่า หารเอาเศษและกำหนดค่า (Modulus Assignment) x %= 3 (เท่ากับ x = x % 3)
~/= หารปัดเศษและกำหนดค่า หารปัดเศษและกำหนดค่า (Integer Division Assignment) x ~/= 2 (เท่ากับ x = x ~/ 2)
++ เพิ่มค่า 1 เพิ่มค่า 1 (Increment) x++ (เท่ากับ x = x + 1)
-- ลดค่า 1 ลดค่า 1 (Decrement) x-- (เท่ากับ x = x - 1)

*/

void main() {
  int x = 10;
  int y = 3;
  double z = 2.5;

  print("x + y = ${x + y}"); // บวก
  print("x - y = ${x - y}"); // ลบ
  print("x * y = ${x * y}"); // คูณ
  print("x / y = ${x / y}"); // หาร
  print("x % y = ${x % y}"); // หารเอาเศษ
  print("x ~/ y = ${x ~/ y}"); // หารปัดเศษ

  x += 5; // x = x + 5
  print("หลังจาก x += 5, x = $x");

  x -= 3; // x = x - 3
  print("หลังจาก x -= 3, x = $x");

  x *= 2; // x = x * 2
  print("หลังจาก x *= 2, x = $x");

  z /= 4; // x = x / 4
  print("หลังจาก x /= 4, x = $x");

  z %= 3; // x = x % 3
  print("หลังจาก x %= 3, x = $x");

  z ~/= 3; // x = x ~/ 2
  print("หลังจาก x ~/= 2, x = $x");

  x++; // เพิ่มค่า1
  print("หลังจาก x++, x = $x");

  x--; // ลดค่า1
  print("หลังจาก x--, x = $x");
}
