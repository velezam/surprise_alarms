import 'package:flutter/cupertino.dart';
import 'components/home_screen.dart';

/// The Widget that configures your application.
class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(home: HomeScreen());
  }
}
