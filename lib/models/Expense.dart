class Expense {
  final String tripId;
  final double amount;
  final String description;
  final String category;
 

  Expense({
    required this.tripId,
    required this.amount,
    required this.description,
    required this.category,
    
  });

  
  // factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

  
  // Map<String, dynamic> toJson() => _$ExpenseToJson(this);

 }
