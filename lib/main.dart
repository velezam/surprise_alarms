import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/android/android_app.dart';
import 'src/ios/ios_app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Load dotenv variables
  // await dotenv.load(fileName: 'assets/.env');

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  // Check for user platform and run corresponding app layout
  if (kIsWeb) {
    return runApp(AndroidApp(settingsController: settingsController));
  }
  switch (Platform.operatingSystem) {
    case 'android':
      return runApp(AndroidApp(settingsController: settingsController));
    case 'ios' || 'macos':
      return runApp(const IosApp());
    default:
      return print('Unsupported platform');
  }
}
