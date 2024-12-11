// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import '../models/trip_model.dart';
// import '../models/expenses_model.dart';
// import '../providers/expenses_provider.dart';
// import 'ai_analysis_screen.dart'; // Import AIAnalysisScreen

// class ExpensesPage extends StatelessWidget {
//   final Trip trip;

//   ExpensesPage({required this.trip});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expenses for ${trip.destination}'),
//       ),
//       body: FutureBuilder<List<Expense>>(
//         future: Provider.of<ExpensesProvider>(context, listen: false)
//             .fetchExpenses(trip.id),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No expenses found.'));
//           } else {
//             final expenses = snapshot.data!;
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: expenses.length,
//                     itemBuilder: (context, index) {
//                       final expense = expenses[index];
//                       return Card(
//                         margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                         elevation: 5, // Optional: you can add an elevation to give the card a shadow
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12), // Rounded corners
//                         ),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.all(16.0),
//                           title: Text(
//                             expense.category,
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           trailing: Text(
//                             '${expense.amount} KWD',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.blue,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       context.push('/ai-analysis', extra: trip.id.toString());
//                     },
//                     child: Text('AI Analysis'),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Expenses for ${trip.destination}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(width: 8),
            Transform.rotate(
              angle: 11.14 / 2,
              child: Icon(
                Icons.airplanemode_active,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),  // Added padding to create space between AppBar and expenses cards
        child: FutureBuilder<List<Expense>>(
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
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          elevation: 5, // Optional: you can add an elevation to give the card a shadow
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Rounded corners
                          ),
                          color: Color.fromRGBO(255, 140, 0, 0.7),  // Light shadow orange background
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              expense.category,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                            trailing: Text(
                              '${expense.amount} KWD',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Set font color to white
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/ai-analysis', extra: trip.id.toString());
        },
        child: Icon(Icons.help_outline_sharp),  // Help icon
        backgroundColor: Colors.blue,  // Button color
        tooltip: 'AI Analysis',  // Tooltip text
      ),
    );
  }
}

