class MyUser {
  final String? uid;

  MyUser({this.uid});

  String toString(){
    return "User's uid: " + this.uid.toString();
  }
}
