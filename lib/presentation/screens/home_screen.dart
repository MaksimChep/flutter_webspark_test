import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home screen')),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Set valid API base URL in order to continue')),
          Row(
            children: const [
              Expanded(flex: 5, child: Icon(Icons.compare_arrows)),
              Expanded(flex: 15, child: TextField()),
              Spacer(flex: 1)
            ],
          )
        ]),
        floatingActionButton: InkWell(
            onTap: () {},
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
