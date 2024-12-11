import 'package:burgantevo/providers/tripsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTripPage extends StatefulWidget {
  @override
  CreateTripPageState createState() => CreateTripPageState();
}

class CreateTripPageState extends State<CreateTripPage> {
  final destinationController = TextEditingController();
  final budgetController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  //String? selectedDestination;

  @override
  // void initState() {
  //   super.initState();
  //   // Fetch destinations when the page is first loaded
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Provider.of<TripsProvider>(context, listen: false).fetchDestinations();
  //   });
  // }

  void saveTrip() async {
    final double? budget = double.tryParse(budgetController.text);

    // if (selectedDestination == null ||
    //     budget == null ||
    //     startDateController.text.isEmpty ||
    //     endDateController.text.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("Please fill in all fields"),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    //   return;
    // }
    // // Create the trip using the TripsProvider and API
    await Provider.of<TripsProvider>(context, listen: false).createTrip(
      destination: destinationController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
      budget: double.parse(budgetController.text),
    );

    // After saving the trip, go back to the home page or show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Trip created successfully!"),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final tripsProvider = Provider.of<TripsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Trip',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(width: 8),
            Transform.rotate(
              angle: 11.14 / 2,
              child:
                  Icon(Icons.airplanemode_active, color: Colors.blue, size: 40),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/designlogo.png',
                width: 400,
                height: 400,
              ),
              // Destination Input as a TextField
              TextField(
                controller: destinationController,
                decoration: InputDecoration(
                  labelText: 'Destination',
                  hintText: 'Enter your destination',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Budget Input
              TextField(
                controller: budgetController,
                decoration: InputDecoration(
                  labelText: 'Trip Budget',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // Start Date Input
              TextField(
                controller: startDateController,
                decoration: InputDecoration(
                  labelText: 'From',
                  hintText: 'Enter start date (e.g. 12 May 2025)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // End Date Input
              TextField(
                controller: endDateController,
                decoration: InputDecoration(
                  labelText: 'Until',
                  hintText: 'Enter end date (e.g. 15 May 2025)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: saveTrip,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
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
