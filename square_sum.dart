int squareSum(List<int> numbers) {
  int sum = 0;
  for(int i=0;i<numbers.length;i++){
    sum += numbers[i] * numbers[i] ;
  }
  return sum;
  // your code here
}
void main(){
  List<int> numbers = [1,2,2];
  print(squareSum(numbers));

}