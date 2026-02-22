import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io';

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
        height: 32,
        color: Colors.yellow[300],
        child: Row(
          children: [
            if (Platform.isMacOS) ...[
              // macOS: native buttons appear automatically, just show title
              Padding(
                padding: EdgeInsets.only(left: 52),
                child: Text(
                  'MoodFlow',
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            if (Platform.isWindows) ...[
              // Windows: title on left with 12px padding
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'MoodFlow',
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              // Windows: full-height buttons on right
              _buildWindowsButton(
                icon: Icons.remove,
                onPressed: () => windowManager.minimize(),
                tooltip: 'Minimize',
              ),
              _buildWindowsButton(
                icon: Icons.close,
                onPressed: () => windowManager.close(),
                tooltip: 'Close',
                isClose: true,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Windows style buttons - full height, rectangular
  Widget _buildWindowsButton({
    required IconData icon,
    required VoidCallback onPressed,
    String? tooltip,
    bool isClose = false,
  }) {
    return Tooltip(
      message: tooltip ?? '',
      child: InkWell(
        onTap: onPressed,
        hoverColor: isClose ? Colors.red[400] : Colors.yellow[500],
        child: Container(
          width: 46,
          height: 32,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 18,
            color: Colors.brown[800],
          ),
        ),
      ),
    );
  }
}
