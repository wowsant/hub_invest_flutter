class StockModel {
  final String id;
  final String symbol;
  final int quantity;
  final double averagePrice;
  final double currentValue;
  final double percentageVariation;

  StockModel({
    required this.id,
    required this.symbol,
    required this.quantity,
    required this.averagePrice,
    required this.currentValue,
    required this.percentageVariation,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'],
      symbol: json['symbol'],
      quantity: json['quantity'],
      averagePrice: (json['averagePrice'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      percentageVariation: (json['percentageVariation'] as num).toDouble(),
    );
  }
}
