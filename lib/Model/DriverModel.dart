class Drivermodel {
  String? name;
  String? email;
  String? phone;
  String? address;
  int? age;
  String? licenseNumber;
  String? cnic;
  String? licenseexpiry;
  String? vhecialNumber;
  int? weightCapiacity;

  Drivermodel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.licenseNumber,
    this.cnic,
    this.licenseexpiry,
    this.age,
    this.vhecialNumber,
    this.weightCapiacity,
  });

  factory Drivermodel.fromJson(Map<String, dynamic> json) {
    return Drivermodel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      licenseNumber: json['licenseNumber'],
      cnic: json['cnic'],
      licenseexpiry: json['licenseexpiry'],
      age: json['age'],
      vhecialNumber: json['vhecialNumber'],
      weightCapiacity: json['weightCapiacity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'licenseNumber': licenseNumber,
      'cnic': cnic,
      'licenseexpiry': licenseexpiry,
      'age': age,
      'vhecialNumber': vhecialNumber,
      'weightCapiacity': weightCapiacity,
    };
  }
}
