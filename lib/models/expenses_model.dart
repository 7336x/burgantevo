class Expense {
  final double amount;
  final String category;

  Expense({
    required this.amount,
    required this.category,
  });

  // Factory method to create an Expense from JSON
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      amount: (json['amount'] as num).toDouble(),
      category: json['category'],
    );
  }
}
