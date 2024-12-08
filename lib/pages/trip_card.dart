import 'package:flutter/material.dart';
import '../models/trip_model.dart';  
import '../dashed_line_painter.dart'; 

class TripCard extends StatelessWidget {
  final Trip trip;

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
                    Text(
                      trip.destination, 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${trip.from} - ${trip.to}', 
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () {}, 
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trip.startDate, 
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      trip.endDate, 
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(double.infinity, 30),
                      painter: DashedLinePainter(),
                    ),
                    Transform.rotate(
                      angle: 3.14 / 2, 
                      child: Icon(Icons.airplanemode_active, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Image Container
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

          // Content Below Image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      trip.amount,
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Increased font size for the amounts
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      trip.totalAmount,
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Increased font size for the amounts
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Progress Bar with Rounded Corners
                Container(
                  height: 10,  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),  // Rounded corners for the progress bar
                    color: Colors.white,
                  ),
                  child: LinearProgressIndicator(
                    value: trip.status == 'finished' ? 0.8 : (trip.status == 'upcoming' ? 0.0 : 0.5),
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
