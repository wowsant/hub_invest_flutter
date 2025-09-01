import 'package:flutter/material.dart';

class FilterTabs extends StatelessWidget {
  final List<String> tabs;
  final int current;
  final ValueChanged<int> onChange;

  const FilterTabs({
    super.key,
    required this.tabs,
    required this.current,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(tabs.length, (i) {
        final selected = i == current;
        return ChoiceChip(
          label: Text(tabs[i]),
          selected: selected,
          onSelected: (_) => onChange(i),
          selectedColor: Colors.black87,
          labelStyle: TextStyle(color: selected ? Colors.white : Colors.black87),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
        );
      }),
    );
  }
}
