import 'package:burgantevo/providers/tripsprovider.dart';
import 'package:flutter/material.dart';
import 'package:burgantevo/widgets/drawer.dart';
import 'package:burgantevo/pages/trip_card.dart';
import 'create_trip_page.dart';
import '../models/trip_model.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tripsProvider = Provider.of<TripsProvider>(context); 

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
            Text(
              'Burgan Tevo',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(width: 8),
            Transform.rotate(
              angle: 11.14 / 2,
              child: Icon(Icons.airplanemode_active, color: Colors.blue, size: 40),
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
                    onPressed: () async {
                      final newTrip = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateTripPage()),
                      );

                      if (newTrip != null) {
                        tripsProvider.addTrip(newTrip); 
                      }
                    },
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
                itemCount: tripsProvider.trips.length,
                itemBuilder: (context, index) {
                  return TripCard(
                    trip: tripsProvider.trips[index],  
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
