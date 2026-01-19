import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class MoodFlowAppBar extends StatelessWidget {
  const MoodFlowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        windowManager.startDragging();
      },
      child: Container(
        width: double.infinity,
        height: 40,
        color: Colors.yellow[300],
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MoodFlow',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.brown[800],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
