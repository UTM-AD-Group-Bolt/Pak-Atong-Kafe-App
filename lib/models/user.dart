class MyUser {
  final String? uid;
  final String? firstname;
  final String? lastname;
  final String? email;

  MyUser({this.uid, this.firstname, this.lastname, this.email});

  String toString(){
    return "UID: " + uid.toString() + " | Name: " + firstname.toString() + " " + lastname.toString() + " | Email: " + email.toString();
  }
}
