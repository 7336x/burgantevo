import 'package:flutter/material.dart';
import '../models/trip_model.dart';

class TripDetailsPage extends StatelessWidget {
  final Trip trip;

  TripDetailsPage({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.arrow_back),
            SizedBox(width: 10),
            Text(
              'Trip Deatils',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(width: 8),
            Transform.rotate(
              angle: 11.14 / 2,
              child: Icon(Icons.airplanemode_active, color: Colors.blue, size: 40),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  trip.imagePath,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),

              
              Text(
                'Destination: ${trip.destination}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'From: ${trip.startDate} - Until: ${trip.endDate}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              
              Text('Amount Spent: ${trip.amount}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text('Total Amount: ${trip.totalAmount}', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              LinearProgressIndicator(
                value: double.parse(trip.amount.replaceAll('kwd', '')) /
                    double.parse(trip.totalAmount.replaceAll('kwd', '')),
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              SizedBox(height: 20),

              
              Text('Expenses', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10),

              
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orange.withOpacity(0.1),
                  border: Border.all(color: Colors.orange.withOpacity(0.5), width: 1),
                ),
                height: 370, 
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.airplanemode_active),
                        title: Text("Flight Expenses"),
                        subtitle: Text("400 KWD"),
                      ),
                      ListTile(
                        leading: Icon(Icons.local_taxi),
                        title: Text("Transport Expenses"),
                        subtitle: Text("100 KWD"),
                      ),
                      ListTile(
                        leading: Icon(Icons.hotel),
                        title: Text("Accommodation"),
                        subtitle: Text("200 KWD"),
                      ),
                      ListTile(
                        leading: Icon(Icons.food_bank),
                        title: Text("Food"),
                        subtitle: Text("150 KWD"),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_cart),
                        title: Text("Shopping"),
                        subtitle: Text("50 KWD"),
                      ),
                      ListTile(
                        leading: Icon(Icons.local_offer),
                        title: Text("Entertainment"),
                        subtitle: Text("75 KWD"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
