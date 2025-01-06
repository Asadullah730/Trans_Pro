import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              const Center(
                child: Text(
                  'Trans_Pro',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We are committed to providing a seamless connection between customers, drivers, and administrators to simplify cargo management. "
                "Whether you're a business needing reliable shipping solutions or an individual looking to move goods safely, Trans_Pro is here to help.",
              ),
              const SizedBox(height: 16),
              // Description
              const Text(
                'Our platform is designed with a user-first approach, ensuring ease of use, real-time tracking, and efficient communication. '
                'With features tailored to meet the needs of customers, drivers, and administrators, we aim to make cargo services smarter, faster, and more reliable.',
              ),
              const SizedBox(height: 16),
              // Mission Section
              const Center(
                child: Text(
                  'Our Mission',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'To revolutionize the cargo service industry by offering an efficient, user-friendly, and transparent platform that caters to the needs of all stakeholders.',
              ),
              const SizedBox(height: 8),
              // Vision Section
              const Center(
                child: Text(
                  'Our Vision',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'To become the go-to platform for cargo services by leveraging technology to simplify operations and improve customer experience.',
              ),
              const SizedBox(height: 16),
              // Contact Us Section
              const Center(
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                  'We’d love to hear from you! Feel free to reach out for inquiries, feedback, or support:'),
              const SizedBox(height: 16),
              // Contact Details
              ContactCard(
                  name: "Asad Ullah",
                  phone: "0332-4145420",
                  email: "asadbrohi025@gamil.com"),
              ContactCard(
                  name: "Tania Qayyum",
                  phone: "0334-2672890",
                  email: "tania@gmail.com"),
              ContactCard(
                  name: "Qurat ul Ain",
                  phone: "0334-5672345",
                  email: "annie@gmail.com"),
              const SizedBox(height: 8),
              const Text(
                  'We are here to make your cargo service experience as smooth as possible. Thank you for choosing Trans_Pro!'),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;

  ContactCard({required this.name, required this.phone, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Name: $name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('Phone: $phone'),
              SizedBox(height: 4),
              Text('Email: $email'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutUsPage(),
  ));
}
