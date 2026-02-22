import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'src/features/mood/presentation/screens/mood_flow_screen.dart';
import 'package:system_tray/system_tray.dart';
import 'package:launch_at_startup/launch_at_startup.dart';

// The main function runs the app and initializes the window manager.
void main() async {
  // We wait for the flutter binding to be initialized.
  WidgetsFlutterBinding.ensureInitialized();
  // We initialize the window manager.
  await windowManager.ensureInitialized();

  // Setup Launch at Startup
  launchAtStartup.setup(
    appName: 'MoodFlow',
    appPath: Platform.resolvedExecutable,
  );
  await launchAtStartup.enable();

  // Setup System Tray
  final SystemTray systemTray = SystemTray();
  await systemTray.initSystemTray(
    iconPath: Platform.isWindows ? 'assets/icons/tray_ph.ico' : 'assets/icons/tray_ph.png',
    title: 'MoodFlow',
  );

  // We set the window options.
  WindowOptions windowOptions = WindowOptions(
    size: Size(450, 380),
    minimumSize: Size(450, 380),
    maximumSize: Size(450, 380),
    skipTaskbar: false, // allows minimize to taskbar/dock
    titleBarStyle: TitleBarStyle.hidden,
  );

  // We apply the window options.
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    Size screenSize = await screenRetriever.getPrimaryDisplay().then(
          (display) => display.size,
        );
    Size windowSize = await windowManager.getSize();
    double x = (screenSize.width - windowSize.width);
    double y;

    if (Platform.isMacOS) {
      // Top-right on macOS
      y = 0;
    } else {
      // Bottom-right on Windows (and other platforms)
      y = (screenSize.height - windowSize.height);
    }

    await windowManager.setPosition(Offset(x, y));
    // Don't show window yet - wait for Flutter to render first frame
  });

  // Finally, we run the app.
  runApp(const ProviderScope(child: MoodFlowApp()));
  
  // Show window only after first frame is rendered
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    // Small delay to ensure rendering is complete
    await Future.delayed(Duration(milliseconds: 100));
    await windowManager.setOpacity(1.0);
    await windowManager.show();
    await windowManager.focus();
  });
}

class MoodFlowApp extends StatelessWidget {
  const MoodFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow[100],
      home: const MoodFlowScreen(),
    );
  }
}
