import 'package:burgantevo/models/expenses_model.dart';
import 'package:dio/dio.dart';
import 'client.dart'; // Your global Dio client configuration

class ExpenseService {
  final Dio dio;

  ExpenseService({required this.dio});

  // Fetch expenses for a specific trip
  Future<List<Expense>> getExpenses(int tripId) async {
    try {
      final response = await dio.get('/trip/$tripId/expenses');

      if (response.statusCode == 200) {
        // Map JSON to a List of Expense objects
        List<dynamic> data = response.data;
        return data.map((expense) => Expense.fromJson(expense)).toList();
      } else {
        throw Exception("Failed to fetch expenses: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching expenses: $e");
      rethrow;
    }
  }



}
