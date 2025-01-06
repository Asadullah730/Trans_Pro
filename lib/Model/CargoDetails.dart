import 'package:cloud_firestore/cloud_firestore.dart';

class CargoDetailsModel {
  double? weight;
  String? lodgeType;
  String phoneNumber;
  String source;
  String destination;
  double? offerPrice;
  int? labour;
  String? paymentMethod;

  CargoDetailsModel({
    this.weight,
    this.lodgeType,
    required this.phoneNumber,
    required this.source,
    required this.destination,
    this.offerPrice,
    this.labour,
    this.paymentMethod,
  });
  factory CargoDetailsModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CargoDetailsModel(
      source: data?['source'],
      destination: data?['destination'],
      labour: data?['labour'],
      lodgeType: data?['lodgeType'],
      offerPrice: data?['offerPrice'],
      paymentMethod: data?['paymentMethod'],
      weight: data?['weight'],
      phoneNumber: data?['phone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (source != null) 'source': source,
      if (destination != null) 'destination': destination,
      if (labour != null) 'labour': labour,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (offerPrice != null) 'offerPrice': offerPrice,
      if (paymentMethod != null) 'paymentMethod': paymentMethod,
      if (weight != null) 'weight': weight,
      if (lodgeType != null) 'lodgeType': lodgeType,
    };
  }
}
