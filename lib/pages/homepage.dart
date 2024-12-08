import 'package:burgantevo/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:burgantevo/pages/trip_card.dart';
import 'create_trip_page.dart';
import '../models/trip_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Trip> trips = [
    Trip(
      destination: 'Qatar',
      from: 'KW',
      to: 'QT',
      startDate: '1/12/2024',
      endDate: '1/12/2024',
      amount: '400kwd',
      totalAmount: '1000kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'new',
    ),
    Trip(
      destination: 'Dubai',
      from: 'KW',
      to: 'UE',
      startDate: '10/10/2023',
      endDate: '10/10/2023',
      amount: '850kwd',
      totalAmount: '1000kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'finished',
    ),
    Trip(
      destination: 'London',
      from: 'KW',
      to: 'LDN',
      startDate: '15/10/2023',
      endDate: '15/10/2023',
      amount: '550kwd',
      totalAmount: '800kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'finished',
    ),
    Trip(
      destination: 'Paris',
      from: 'KW',
      to: 'PAR',
      startDate: '2/12/2024',
      endDate: '2/12/2024',
      amount: '900kwd',
      totalAmount: '1500kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'new',
    ),
    Trip(
      destination: 'New York',
      from: 'KW',
      to: 'NYC',
      startDate: '20/01/2025',
      endDate: '20/01/2025',
      amount: '2000kwd',
      totalAmount: '2500kwd',
      imagePath: 'assets/images/qatar.jpeg',
      opacity: 0.5,
      status: 'upcoming',
    ),
  ];

  void _navigateToCreateTripPage() async {
    final newTrip = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTripPage()),
    );

    if (newTrip != null) {
      setState(() {
        trips.add(newTrip);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// <<<<<<< abdulwahab
//             const Text(
//               'Burgan Tevo',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             Transform.rotate(
//               angle: 11.14 / 2,
//               child: const Icon(Icons.airplanemode_active, color: Colors.blue),
//             ),
// =======
            Text(
              '  Burgan Tevo',
               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(width: 8),
              Transform.rotate(
                angle: 11.14 / 2, 
                child: Icon(Icons.airplanemode_active, color: Colors.blue, size: 40), // Adjusted size
              ),

          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.headset_mic, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back Reem!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Create Your Trip',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: _navigateToCreateTripPage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Current Trips',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return TripCard(
                    trip: trips[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
