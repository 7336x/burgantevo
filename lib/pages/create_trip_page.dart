import 'package:burgantevo/providers/tripsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/trip_model.dart';

class CreateTripPage extends StatefulWidget {
  @override
  _CreateTripPageState createState() => _CreateTripPageState();
}

class _CreateTripPageState extends State<CreateTripPage> {
  final _destinationController = TextEditingController();
  final _budgetController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String? _selectedDestination;

  final List<String> destinations = [
    'Qatar',
    'Dubai',
    'London',
    'Paris',
    'New York'
  ];

  void _saveTrip() {
    final String budget = _budgetController.text;

    if (_selectedDestination == null || budget.isEmpty || _startDateController.text.isEmpty || _endDateController.text.isEmpty) {
      return;
    }

    final newTrip = Trip(
      destination: _selectedDestination!,
      from: 'KW',
      to: 'QT',
      startDate: _startDateController.text,
      endDate: _endDateController.text,
      amount: budget,
      totalAmount: budget,
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'new',
      // progress: 0.0,  
    );

    
    Provider.of<TripsProvider>(context, listen: false).addTrip(newTrip);

   
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text(
              'Create Trip',
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedDestination,
              decoration: InputDecoration(
                labelText: 'Choose your Destination',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              items: destinations.map((String destination) {
                return DropdownMenuItem<String>(
                  value: destination,
                  child: Text(destination),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDestination = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _budgetController,
              decoration: InputDecoration(
                labelText: 'Trip Budget',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'From',
                hintText: 'Enter start date (e.g. 12 May 2025)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'Until',
                hintText: 'Enter end date (e.g. 15 May 2025)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 400),
            Center(
              child: ElevatedButton(
                onPressed: _saveTrip,
                child: Text('Create', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
