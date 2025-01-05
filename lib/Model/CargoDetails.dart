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

  factory CargoDetailsModel.fromJson(Map<String, dynamic> json) {
    return CargoDetailsModel(
      weight: json['weight'],
      lodgeType: json['cargoType'],
      phoneNumber: json['phoneNumber'],
      source: json['source'],
      destination: json['destination'],
      offerPrice: json['offerPrice'],
      labour: json['labour'],
      paymentMethod: json['paymentMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'cargoType': lodgeType,
      'phoneNumber': phoneNumber,
      'source': source,
      'destination': destination,
      'offerPrice': offerPrice,
      'labour': labour,
      'paymentMethod': paymentMethod,
    };
  }
}
