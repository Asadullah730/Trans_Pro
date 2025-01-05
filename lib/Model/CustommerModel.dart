class ClientModel {
  String? name;
  String? fatherName;
  String? nationality;
  String? cnic;
  String? email;
  String? phoneNumber;
  String? address;
  String? gender;

  ClientModel({
    this.name,
    this.fatherName,
    this.nationality,
    this.cnic,
    this.email,
    this.phoneNumber,
    this.address,
    this.gender,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      name: json['name'],
      fatherName: json['fatherName'],
      nationality: json['nationality'],
      cnic: json['cnic'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fatherName': fatherName,
      'nationality': nationality,
      'cnic': cnic,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'gender': gender,
    };
  }
}
