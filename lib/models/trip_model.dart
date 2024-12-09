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
  final double progress;  // Add this line to define progress

  // Constructor
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
    this.progress = 0.0, // Initialize progress to 0.0 by default for new trips
  });
}
