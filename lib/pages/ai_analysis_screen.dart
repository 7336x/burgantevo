// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fl_chart/fl_chart.dart';

// class AIAnalysisScreen extends StatelessWidget {
//   final String tripId;

//   AIAnalysisScreen({required this.tripId});

//   Future<Map<String, dynamic>> fetchAnalysis() async {
//     final response = await http.get(
//       Uri.parse('http://localhost:8000/trip/$tripId/ai-analysis'),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return {
//         'budgetManagement': '1. ' + data['analysis'].split("\n\n")[0],
//         'optimization': '2. ' + data['analysis'].split("\n\n")[1],
//         'recommendations': '3. ' + data['analysis'].split("\n\n")[2],
//         'categorySpending': Map<String, double>.from(data['categorySpending']),
//       };
//     } else {
//       throw Exception("Failed to fetch analysis");
//     }
//   }

//   Widget styledText(String title, String content, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: Colors.blueAccent, size: 28),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueAccent,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   content,
//                   style: TextStyle(fontSize: 16, height: 1.5),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget spendingChart(Map<String, double> categorySpending) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Spending by Category',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: PieChart(
//                   PieChartData(
//                     sections: categorySpending.entries.map((entry) {
//                       return PieChartSectionData(
//                         title:
//                             '${entry.key}\n\$${entry.value.toStringAsFixed(2)}',
//                         value: entry.value,
//                         color: Colors.primaries[
//                             categorySpending.keys.toList().indexOf(entry.key) %
//                                 Colors.primaries.length],
//                         radius: 60,
//                         titleStyle: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       );
//                     }).toList(),
//                     sectionsSpace: 2,
//                     centerSpaceRadius: 40,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("AI Trip Analysis")),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: fetchAnalysis(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (snapshot.hasData) {
//             final data = snapshot.data!;
//             final categorySpending = data['categorySpending'];
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     spendingChart(Map<String, double>.from(categorySpending)),
//                     const SizedBox(height: 20),
//                     styledText(
//                       "Budget Management Insights",
//                       data['budgetManagement']!,
//                       Icons.account_balance_wallet_outlined,
//                     ),
//                     styledText(
//                       "Expense Optimization Tips",
//                       data['optimization']!,
//                       Icons.lightbulb_outline,
//                     ),
//                     styledText(
//                       "Recommendations",
//                       data['recommendations']!,
//                       Icons.location_on_outlined,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return Center(child: Text("No analysis available"));
//           }
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class AIAnalysisScreen extends StatelessWidget {
  final String tripId;

  AIAnalysisScreen({required this.tripId});

  Future<Map<String, dynamic>> fetchAnalysis() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/trip/$tripId/ai-analysis'),
    );
    print("ID$tripId");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'budgetManagement': '1. ' + data['analysis'].split("\n\n")[0],
        'optimization': '2. ' + data['analysis'].split("\n\n")[1],
        'recommendations': '3. ' + data['analysis'].split("\n\n")[2],
        'categorySpending': Map<String, int>.from(data['categorySpending']),
      };
    } else {
      throw Exception("Failed to fetch analysis: ${response.statusCode}");
    }
  }

  Widget styledText(String title, String content, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  content,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget spendingChart(Map<String, int> categorySpending) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Spending by Category',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PieChart(
                  PieChartData(
                    sections: categorySpending.entries.map((entry) {
                      return PieChartSectionData(
                        title:
                            '${entry.key}\n\$${entry.value.toStringAsFixed(2)}',
                        value: entry.value.toDouble(),
                        color: Colors.primaries[
                            categorySpending.keys.toList().indexOf(entry.key) %
                                Colors.primaries.length],
                        radius: 60,
                        titleStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Trip Analysis")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchAnalysis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            final categorySpending = data['categorySpending'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spendingChart(Map<String, int>.from(categorySpending)),
                    const SizedBox(height: 20),
                    styledText(
                      "Budget Management Insights",
                      data['budgetManagement']!,
                      Icons.account_balance_wallet_outlined,
                    ),
                    styledText(
                      "Expense Optimization Tips",
                      data['optimization']!,
                      Icons.lightbulb_outline,
                    ),
                    styledText(
                      "Recommendations",
                      data['recommendations']!,
                      Icons.location_on_outlined,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("No analysis available"));
          }
        },
      ),
    );
  }
}
