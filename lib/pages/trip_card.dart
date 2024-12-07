import 'package:flutter/material.dart';
import '../models/trip_model.dart';  
import '../dashed_line_painter.dart'; 

class TripCard extends StatelessWidget {
  final Trip trip; 

  // constructor to receive a Trip object
  TripCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.orange.withOpacity(0.3),
        border: Border.all(color: Colors.orange.withOpacity(0.5), width: 1),
      ),
      child: Column(
        children: [
          
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: Colors.orange,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: trip.status == 'finished' ? Colors.red : Colors.green),
                    SizedBox(width: 5),
                    Text(trip.destination, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('${trip.from} - ${trip.to}', style: TextStyle(color: Colors.white)),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () {}, 
                    ),
                  ],
                ),
          //       // Dashed Line Under Destination Name
          //       Container(
          //         margin: EdgeInsets.symmetric(vertical: 5),
          //         height: 2,
          //         child: CustomPaint(
          //           painter: DashedLinePainter(),
          //         ),
          //       ),
             ],
           ),
           ),

          // card content with Image, Dates, and Progress
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(trip.imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(trip.opacity), BlendMode.darken),
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('${trip.startDate} - ${trip.endDate}', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(trip.amount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(trip.totalAmount, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),

                // Dashed Line with Airplane
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(double.infinity, 20),
                      painter: DashedLinePainter(),
                    ),
                    Icon(Icons.airplanemode_active, color: Colors.white, size: 20),
                     // Centered airplane icon
                  ],
                ),
                SizedBox(height: 10),

                // Progress Bar
                LinearProgressIndicator(
                  value: trip.status == 'finished' ? 0.8 : (trip.status == 'upcoming' ? 0.0 : 0.5),
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
