import 'package:flutter/material.dart';
import '../../data/models/stock.model.dart';

class StockCard extends StatelessWidget {
  final StockModel item;
  const StockCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isUp = item.percentageVariation >= 0;
    final changeText = '${isUp ? '+' : ''}${item.percentageVariation.toStringAsFixed(2)}%';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.symbol,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xFF6B7280))),
          const SizedBox(height: 8),
          Text('R\$ ${item.averagePrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const Spacer(),
          Text(
            changeText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isUp ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
