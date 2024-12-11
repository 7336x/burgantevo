// class Trip {
//   final String destination;
//   String? from;
//   String? to;
//   final String startDate;
//   final String endDate;
//   final double budget;
//   String? totalAmount;
//   String? imagePath;
//   double? opacity;
//   String? status;

//   // Constructor to initialize the Trip object
//   Trip({
//     required this.destination,
//     this.from,
//     this.to,
//     required this.startDate,
//     required this.endDate,
//     required this.budget,
//     this.totalAmount,
//     this.imagePath,
//     this.opacity,
//     this.status,
//   });

//   // constructor to create a Trip from a map
//   factory Trip.fromMap(Map<String, dynamic> map) {
//     return Trip(
//       destination: map['destination'],
//       from: map['from'],
//       to: map['to'],
//       startDate: map['startDate'],
//       endDate: map['endDate'],
//       budget: map['budget'],
//       totalAmount: map['totalAmount'],
//       imagePath: map['imagePath'],
//       opacity: map['opacity'],
//       status: map['status'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'destination': destination,
//       'from': from,
//       'to': to,
//       'startDate': startDate,
//       'endDate': endDate,
//       'budget': budget,
//       'totalAmount': totalAmount,
//       'imagePath': imagePath,
//       'opacity': opacity,
//       'status': status,
//     };
//   }
// }
class Trip {
  final String id; // Add the id field
  final String destination;
  final String startDate;
  final String endDate;
  final double budget;

  Trip({
    required this.id, // Add the id field to the constructor
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.budget,
  });

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      id: map['_id'], // Add the id field to the factory constructor
      destination: map['destination'],
      startDate: map['start_date'],
      endDate: map['end_date'],
      budget: map['budget'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add the id field to the toMap method
      'destination': destination,
      'start_date': startDate,
      'end_date': endDate,
      'budget': budget,
    };
  }
}
