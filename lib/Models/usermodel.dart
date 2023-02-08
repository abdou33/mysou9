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

class boutiqueModel {
  String? name;
  String? uid;
  String? wilaya;
  String? daira;
  String? email;
  String? phonenumber;
  String? instagram;
  String? facebook;


  boutiqueModel({this.name, this.uid, this.wilaya, this.daira, this.email, this.phonenumber, this.instagram, this.facebook});

  //data from the server
  factory boutiqueModel.fromMap(map) {
    return boutiqueModel(
      uid: map['uid'],
      name: map['name'],
      wilaya: map['wilaya'],
      daira: map['daira'],
      email: map['email'],
      phonenumber: map['phonenumber'],
      instagram: map['instagram'],
      facebook: map['facebook'],
    );
  }

  //send data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'wilaya': wilaya,
      'daira': daira,
      'email': email,
      'phonenumber': phonenumber,
      'instagram': instagram,
      'facebook': facebook,
    };
  }
}

