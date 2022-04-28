class UserModel{
  String? uid;
  String? email;
  String? name;
  String? phone;
  UserModel({this.uid,this.name,this.email,this.phone});

  //data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      phone: map['phone']
    );
  }
  //sending data to server
  Map<String,dynamic> toMap(){
   return {
     'uid':uid,
     'name':name,
     'email':email,
     'phone':phone
   };
  }
}
