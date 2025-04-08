void main() {
  List<A> list = [];
 final A a = A(b: "Hello");
  list.add(a);
  print(list[0].b);  // In ra "Hello"
  
a.addMessage('12345');  // Gán đối tượng mới vào a
  print(list[0].b);  // In ra "Hello12345"
}

class A {
  String b;

  A({required this.b});

   addMessage(String message) {
    b+=message;
  }
}
