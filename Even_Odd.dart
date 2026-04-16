import 'dart:io';
bool isEven(n) => n%2==0;  // 4%2==0
bool isEvenBitwise(n) => (n&1)==0; //4=100 &=AND
void main() {
  int n = int.parse(stdin.readLineSync()!);
  if(isEven(n)){
    print("Even");
  }else{
    print("Odd");
  }if(isEvenBitwise(n)){
    print("Even");
  }else{
    print("Odd");
  }

}

// 4=0100 ; 8=1000 ;7=0101

// 4