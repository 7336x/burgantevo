import 'package:burgantevo/models/expenses_model.dart';
import 'package:burgantevo/services/expenses_service.dart';
import 'package:flutter/material.dart';
import '../services/client.dart';

// class ExpensesProvider extends ChangeNotifier {
//   List<Expense> expenses = [];
//   bool isLoading = false;

//   final ExpenseService _expenseService = ExpenseService(dio: dio);

  // Fetch expenses for a given trip ID
  // Future<void> fetchExpenses(int tripId) async {
  //   try {
  //     isLoading = true;
  //     notifyListeners();

  //     expenses = await _expenseService.getExpenses(tripId);
  //   } catch (e) {
  //     print("Error in ExpensesProvider: $e");
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }
class ExpensesProvider extends ChangeNotifier {
  List<Expense> expenses = [];
  bool isLoading = false;

  final ExpenseService _expenseService = ExpenseService(dio: dio);

  // Fetch expenses for a given trip ID and return a Future
  Future<List<Expense>> fetchExpenses(int tripId) async {
    try {
      isLoading = true;
      notifyListeners();

      // Fetch the expenses
      expenses = await _expenseService.getExpenses(tripId);
      return expenses; // Return the fetched list of expenses
    } catch (e) {
      print("Error in ExpensesProvider: $e");
      return []; // Return an empty list in case of error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
