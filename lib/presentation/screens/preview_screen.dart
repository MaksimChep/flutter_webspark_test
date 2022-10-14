import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/presentation/widgets/preview_list_item_widget.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key? key, required this.mainIndex}) : super(key: key);
  final int mainIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Result list screen')),
        body: Column(children: [
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: StaticValues.grids[mainIndex].length),
              shrinkWrap: true,
              itemCount: pow(StaticValues.grids[mainIndex].length, 2).toInt(),
              itemBuilder: (context, index) => PreviewListItem(
                    index: index,
                    mainIndex: mainIndex,
                  )),
          Text(StaticValues.results[mainIndex].result.path,
              style: const TextStyle(fontSize: 20))
        ]));
  }
}
