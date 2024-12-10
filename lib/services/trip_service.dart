import 'package:burgantevo/models/trip_model.dart';
import 'package:dio/dio.dart';
import 'client.dart'; // Import your global Dio client

class TripService {
  Future<Map<String, dynamic>> createTrip({
    required String destination,
    required String startDate, // Now expecting string from the backend
    required String endDate, // Now expecting string from the backend
    required double budget,
  }) async {
    try {
      final response = await dio.post(
        '/trip', // Relative path, as the base URL is already set
        data: {
          "destination": destination,
          "start_date": startDate,
          "end_date": endDate,
          "budget": budget,
        },
      );

      // Check for successful response
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Trip created successfully: ${response.data}");
        return response.data;
      } else {
        throw Exception(
            "Failed to create trip. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error creating trip: $e");
      rethrow; // Forward the error to the caller
    }
  }

  Future<Response> getTrip() async {
    final response = await dio.get('/trip');
    return response;
  }

  Future<Response> getExpenses() async {
    final response = await dio.get('/trip/expenses');
    return response;
  }
}
