import 'dart:io';

void main(){
  int number= int.parse(stdin.readLineSync()!);
  int sum=0;
  for(int i=0;i<=number;i++){
    sum=sum+i;
  }
  print(sum);
}