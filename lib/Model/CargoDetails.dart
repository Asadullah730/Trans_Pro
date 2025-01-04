class CargoDetails {
  String? weight;
  String? lodgeType;
  String? phoneNumber;
  String? source;
  String? destination;
  String? offerPrice;
  String? labour;
  String? paymentMethod;

  CargoDetails({
    this.weight,
    this.lodgeType,
    this.phoneNumber,
    this.source,
    this.destination,
    this.offerPrice,
    this.labour,
    this.paymentMethod,
  });

  factory CargoDetails.fromJson(Map<String, dynamic> json) {
    return CargoDetails(
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
