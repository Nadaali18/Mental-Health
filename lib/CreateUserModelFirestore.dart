class CreateUserModelFirestore{
  String? uID;
  String? name;
  String? email;

  CreateUserModelFirestore({
    this.uID,
    this.email,
    this.name,
  });

  CreateUserModelFirestore.fromJson(Map<String,dynamic>? json){
    email = json!['email'];
    uID = json['uID'];
    name = json['name'];
  }

  Map<String,dynamic>? ToMap(){
    return {
      'name' : name,
      'uID' : uID,
      'email' : email,
    };
  }
}