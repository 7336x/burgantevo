import 'package:burgantevo/services/trip_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:burgantevo/models/trip_model.dart';
import 'package:burgantevo/services/client.dart'; // Assuming you already have a Dio client configured

class TripsProvider extends ChangeNotifier {
  List<String> destinations = [];
  bool isLoading = false;

  // Fetch destinations from the API
  // Future<void> fetchDestinations() async {
  //   try {
  //     isLoading = true;
  //     notifyListeners();

  //     final response = await dio.get('/destinations'); // Example endpoint

  //     if (response.statusCode == 200) {
  //       destinations = List<String>.from(response.data['destinations']);
  //     }
  //   } catch (e) {
  //     print("Error fetching destinations: $e");
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  // Create a new trip via the API
  Future<void> createTrip({
    required String destination,
    required String startDate,
    required String endDate,
    required double budget,
  }) async {
    try {
      await TripService().createTrip(
          destination: destination,
          startDate: startDate,
          endDate: endDate,
          budget: budget);
    } catch (e) {
      print("Error creating trip: $e");
    }
  }
}
