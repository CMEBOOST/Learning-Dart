import 'dart:math';

void main() {
  var rand = Random();

  print(rand.nextInt(1000)); // <- สุ่ม int 0 - (max - 1)
  print(rand.nextDouble() * 256);
}
