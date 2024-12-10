class Trip {
  final String destination;
  final String from;
  final String to;
  final String startDate;
  final String endDate;
  final String amount;
  final String totalAmount;
  final String imagePath;
  final double opacity;
  final String status;

  // Constructor to initialize the Trip object
  Trip({
    required this.destination,
    required this.from,
    required this.to,
    required this.startDate,
    required this.endDate,
    required this.amount,
    required this.totalAmount,
    required this.imagePath,
    required this.opacity,
    required this.status,
  });

  // constructor to create a Trip from a map
  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      destination: map['destination'],
      from: map['from'],
      to: map['to'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      amount: map['amount'],
      totalAmount: map['totalAmount'],
      imagePath: map['imagePath'],
      opacity: map['opacity'],
      status: map['status'],
    );
  }

 
  Map<String, dynamic> toMap() {
    return {
      'destination': destination,
      'from': from,
      'to': to,
      'startDate': startDate,
      'endDate': endDate,
      'amount': amount,
      'totalAmount': totalAmount,
      'imagePath': imagePath,
      'opacity': opacity,
      'status': status,
    };
  }
}
