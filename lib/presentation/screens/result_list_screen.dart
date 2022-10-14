import 'package:flutter/material.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/presentation/screens/preview_screen.dart';

class ResultListScreen extends StatelessWidget {
  const ResultListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Result list screen')),
        body: ListView.separated(
            itemBuilder: ((context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PreviewScreen(mainIndex: index)),
                  );
                },
                child: Text(
                  StaticValues.results[index].result.path,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, height: 2),
                ))),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: StaticValues.results.length));
  }
}
