import 'package:flutter/material.dart';

class PackageOption extends StatelessWidget {
  final double price;
  final int pellets;
  final bool isSelected;

  const PackageOption({
    super.key,
    required this.price,
    required this.pellets,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Color(0xFFFFA41B) : Colors.grey.shade300,
        ),
        color: isSelected ? Colors.orange.shade50 : Color(0xFFF5F5F5),
      ),
      child: Column(
        children: [
          Text(
            "Rs.$price",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.black,
            ),
          ),
          Text(
            "$pellets pellets",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
