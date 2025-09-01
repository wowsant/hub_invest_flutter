import 'package:flutter/material.dart';

class MenuItemModel {
  final String label;
  final String? route;
  final IconData icon;
  final VoidCallback? onTap;

  MenuItemModel({
    required this.label,
    this.route,
    required this.icon,
    this.onTap,
  });
}
