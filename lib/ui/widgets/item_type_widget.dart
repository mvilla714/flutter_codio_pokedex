import 'package:flutter/material.dart';

class ItemTypeWindget extends StatelessWidget {
  String typeText;
  ItemTypeWindget({required this.typeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.28),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: Offset(4, 4),
              blurRadius: 12.0)
        ],
      ),
      child: Text(
        typeText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
