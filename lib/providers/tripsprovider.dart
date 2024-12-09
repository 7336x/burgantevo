// import 'package:burgantevo/services/trip_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:burgantevo/models/trip_model.dart';
// import 'package:burgantevo/services/client.dart'; // Assuming you already have a Dio client configured

// class TripsProvider extends ChangeNotifier {
//   List<Trip> destinations = [];
//   bool isLoading = false;

//   // Fetch destinations from the API
//   // Future<void> fetchDestinations() async {
//   //   try {
//   //     isLoading = true;
//   //     notifyListeners();

//   //     final response = await dio.get('/destinations'); // Example endpoint

//   //     if (response.statusCode == 200) {
//   //       destinations = List<String>.from(response.data['destinations']);
//   //     }
//   //   } catch (e) {
//   //     print("Error fetching destinations: $e");
//   //   } finally {
//   //     isLoading = false;
//   //     notifyListeners();
//   //   }
//   // }

//   // Create a new trip via the API
//   Future<void> createTrip({
//     required String destination,
//     required String startDate,
//     required String endDate,
//     required double budget,
//   }) async {
//     try {
//       var response = await TripService().createTrip(
//           destination: destination,
//           startDate: startDate,
//           endDate: endDate,
//           budget: budget);
//       destinations.add(Trip.fromMap(response));
//     } catch (e) {
//       print("Error creating trip: $e");
//     }
//   }

//   Future<List<Trip>> getTrip() async {
//     destinations = await getTrip();
//     // notifyListeners();
//     return destinations;
//   }
//   //  Future<List<Trip>> getTrip() async {
//   //   // print("getting cards");
//   //   try {
//   //     destinations = await Dio().getTrip();
//   //   } on Exception catch (_) {
//   //     rethrow;
//   //   }
//   //   if (cards.isEmpty) throw("No Cards");
//   //   return cards;
//   // }
// }
import 'package:burgantevo/models/trip_model.dart';
import 'package:burgantevo/services/trip_service.dart';
import 'package:flutter/material.dart';

class TripsProvider extends ChangeNotifier {
  List<Trip> destinations = [];
  bool isLoading = false;

  // Fetch trips from the API
  Future<void> getTrips() async {
    try {
      isLoading = true;
      notifyListeners();

      // Call the TripService to fetch trips
      final response = await TripService().getTrip();

      // Assuming response.data contains a list of trips
      if (response.statusCode == 200 && response.data != null) {
        destinations = (response.data as List)
            .map((tripData) => Trip.fromMap(tripData))
            .toList();

        print("Trips fetched successfully: ${destinations.length}");
      }
    } catch (e) {
      print("Error fetching trips: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Create a new trip via the API
  Future<void> createTrip({
    required String destination,
    required String startDate,
    required String endDate,
    required double budget,
  }) async {
    try {
      final response = await TripService().createTrip(
        destination: destination,
        startDate: startDate,
        endDate: endDate,
        budget: budget,
      );

      // Add the newly created trip to the list
      destinations.add(Trip.fromMap(response));
      notifyListeners();

      print("Trip created and added successfully");
    } catch (e) {
      print("Error creating trip: $e");
    }
  }
}
