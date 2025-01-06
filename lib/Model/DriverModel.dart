import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Drivermodel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Drivermodel(
      name: data?['name'],
      email: data?['email'],
      phone: data?['phone'],
      address: data?['address'],
      licenseNumber: data?['licenseNumber'],
      cnic: data?['cnic'],
      licenseexpiry: data?['licenseexpiry'],
      age: data?['age'],
      vhecialNumber: data?['vhecialNumber'],
      weightCapiacity: data?['weightCapiacity'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (licenseNumber != null) 'licenseNumber': licenseNumber,
      if (cnic != null) 'cnic': cnic,
      if (licenseexpiry != null) 'licenseexpiry': licenseexpiry,
      if (age != null) 'age': age,
      if (vhecialNumber != null) 'vhecialNumber': vhecialNumber,
      if (weightCapiacity != null) 'weightCapiacity': weightCapiacity,
    };
  }
}
