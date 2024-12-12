
import 'package:flutter/material.dart';

import '../constant/color.dart';

class Buttons1 extends StatelessWidget {
  const Buttons1({super.key, required this.lable,
    this.textColor = Colors.white});
  final String lable;
final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        children: [
          Row(
            children: [
              Material(
                elevation: 3,
                color: AppColors.secondary2Color,
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.secondary2Color,
                  child: Text(
                    lable,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
