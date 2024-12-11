import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/trip_model.dart';
import '../models/expenses_model.dart';
import '../providers/expenses_provider.dart';
import 'ai_analysis_screen.dart'; // Import AIAnalysisScreen

class ExpensesPage extends StatelessWidget {
  final Trip trip;

  ExpensesPage({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses for ${trip.destination}'),
      ),
      body: FutureBuilder<List<Expense>>(
        future: Provider.of<ExpensesProvider>(context, listen: false)
            .fetchExpenses(trip.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No expenses found.'));
          } else {
            final expenses = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      final expense = expenses[index];
                      return ListTile(
                        title: Text(expense.category),
                        trailing: Text('${expense.amount} KWD'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/ai-analysis', extra: trip.id.toString());
                    },
                    child: Text('AI Analysis'),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
