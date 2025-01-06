import 'package:flutter/material.dart';
import 'package:transpro/Model/CargoDetails.dart';

class OrderHistory extends StatelessWidget {
  List<CargoDetailsModel> acceptedCargo = [];
  OrderHistory({required this.acceptedCargo, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "History",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: acceptedCargo.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shadowColor: Colors.orange[200],
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: ListTile(
                title: const Text(
                  "Details: Complete Cargo Details ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Locations : ${acceptedCargo[index].source} to ${acceptedCargo[index].destination}"),
                    Text("Labour: ${acceptedCargo[index].labour}"),
                    Text("Lodge Type: ${acceptedCargo[index].lodgeType}"),
                    Text("Weight: ${acceptedCargo[index].weight} Ton"),
                    Text("Offer Price: ${acceptedCargo[index].offerPrice}"),
                    Text("Phone Number :${acceptedCargo[index].phoneNumber}"),
                    Text(
                        "Payment Method: ${acceptedCargo[index].paymentMethod}"),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
