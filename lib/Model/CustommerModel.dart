import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory ClientModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ClientModel(
        name: data?['name'],
        fatherName: data?['fatherName'],
        email: data?['email'],
        phoneNumber: data?['phone'],
        address: data?['address'],
        cnic: data?['cnic'],
        gender: data?['gender'],
        nationality: data?['nationality']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) 'name': name,
      if (fatherName != null) 'fatherName': email,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (address != null) 'address': address,
      if (cnic != null) 'cnic': cnic,
      if (gender != null) 'gender': gender,
      if (nationality != null) 'nationality': nationality,
    };
  }
}
