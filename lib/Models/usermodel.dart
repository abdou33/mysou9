class UserModel {
  String? uid;
  String? firstname;
  String? lastname;
  String? email;
  String? phonenum;


  UserModel({this.uid, this.firstname, this.lastname, this.email, this.phonenum});

  //data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email'],
      phonenum: map['phonenum'],
    );
  }

  //send data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firtsname': firstname,
      'lastname': lastname,
      'email': email,
      'phonenum': phonenum,
    };
  }
}
