import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? _currentAddress;
  Position? _currentPosition;
  bool _isDateSelected = false;
  bool _isTimeSelected = false;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const SnackBar(content: Text('Location permissions are denied'));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details"), actions: [
        ElevatedButton(
            // if both Date and Time switches are toggled on, then we can add a new alar
            onPressed: _isDateSelected && _isTimeSelected
                ? null
                : () => {
                      // TODO: add task to DB
                    },
            child: const Text("Add")),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            // TODO: implement Date selection row
            // Structure:
            // Icon.calendar Date    Toggle
            // when toggled on show Date picker dialog

            // TODO: implement Time selection row
            // Structure:
            // Icon.alarm Time    Toggle
            // when toggled on show Time picker dialog,
            // date should automatically toggle on as well and set itself to tomorrow as default
            Row(
              children: [
                const Column(
                    children: [Icon(Icons.calendar_month), Text("Date")]),
                Column(children: [
                  Switch(
                      value: _isDateSelected,
                      onChanged: (_) =>
                          setState(() => _isDateSelected = !_isDateSelected)),
                ])
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _getCurrentPosition,
              child: const Text("Get Current Location"),
            )
          ],
        ),
      ),
    );
  }
}
