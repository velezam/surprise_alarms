import 'package:flutter/material.dart';

import '../../settings/settings_view.dart';
import 'new_alarm_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';


  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Surprise Alarms'),
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.restorablePushNamed(
                      context, SettingsView.routeName);
                })
          ],
        ),
        body: const SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: TodayAlarmsWidget()),
                  SizedBox(width: 200),

                  Expanded(child: UpcomingAlarmsWidget())
                ],
              ),
            ),
            AllAlarmsWidget(),
            NewAlarmWidget()
          ],
        )));
  }
}

class NavigationWidgets extends StatelessWidget {
  const NavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [TodayAlarmsWidget(), UpcomingAlarmsWidget()],
    );
  }
}

class TodayAlarmsWidget extends StatelessWidget {
  const TodayAlarmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.today), Text("Count")]),
        Row(
          children: [Text("Today")],
        )
      ],
    );
  }
}

class UpcomingAlarmsWidget extends StatelessWidget {
  const UpcomingAlarmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.calendar_month), Text("Count")]),
        Row(
          children: [Text("Upcoming")],
        )
      ],
    );
  }
}

class AllAlarmsWidget extends StatelessWidget {
  const AllAlarmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.inbox), Text("Count")]),
        Row(
          children: [Text("All")],
        )
      ],
    );
  }
}

class NewAlarmWidget extends StatelessWidget {
  const NewAlarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewAlarmPage()),
          );
        },
        child:
            const Row(children: [Icon(Icons.add_circle), Text("New Alarm")]));
  }
}
