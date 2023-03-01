import 'package:test/expect.dart';

void main() {
  // Future myFuture = Future(() {
  //   print('Going back to the future');
  //   return 7;
  // }).then((value) => print("The value is: $value"));
  //
  // Future.delayed(Duration(seconds: 3));
  //
  // Future<int> myFutureFunc()async {
  //   print('I have a function in the Future');
  //   await Future.delayed(Duration(seconds: 3));
  //   return 12;
  // }
  // myFutureFunc().then((value) => print("My function value is: $value"));

  Future<int> myFutureErrorFunc(int a, int b)async {
    try {
      if(a > b) {
        throw Exception();
      }
      print("I have a function Function");
      await Future.delayed(Duration(seconds: 3));
      return 77;
    }catch(e) {
      print("An error occurred: $e");
      return 77;
    }finally {
      print("The Future is finally over");
    }
  }
  myFutureErrorFunc(2, 1).then((value) => print("The value is: $value"));
  print('Done with main');
}