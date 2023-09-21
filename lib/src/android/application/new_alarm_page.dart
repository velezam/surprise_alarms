import 'package:flutter/material.dart';
import 'details_page.dart';

class NewAlarmPage extends StatelessWidget {
  const NewAlarmPage({super.key});

  static const routeName = '/new_alarm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Title"),
            ),
            const TextField(
              decoration: InputDecoration(hintText: "Notes"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailsPage()),
                  );
                },
                child: const Text("Details"))
          ],
        ));
  }
}
