import 'package:flutter/material.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/presentation/screens/progress_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textValue = 'https://flutter.webspark.dev/flutter/api';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home screen')),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Set valid API base URL in order to continue')),
          Row(
            children: [
              const Expanded(flex: 5, child: Icon(Icons.compare_arrows)),
              Expanded(
                  flex: 15,
                  child: TextField(
                    controller: TextEditingController(text: textValue),
                    onChanged: (value) {
                      textValue = value;
                    },
                  )),
              const Spacer(flex: 1)
            ],
          )
        ]),
        floatingActionButton: InkWell(
            onTap: () {
              StaticValues.url = textValue;
              if (!Uri.parse(textValue).isAbsolute) {
                showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          title: Text('Not valid url!'),
                        ));
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProgressScreen()),
                );
              }
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Start counting process',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )))));
  }
}
