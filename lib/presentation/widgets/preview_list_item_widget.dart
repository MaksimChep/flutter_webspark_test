import 'package:flutter/material.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/data/models/task_response_entity.dart';

class PreviewListItem extends StatelessWidget {
  const PreviewListItem(
      {Key? key, required this.index, required this.mainIndex})
      : super(key: key);
  final int index;
  final int mainIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getColor(),
      child: Center(
        child: Text(
            '(${index % StaticValues.grids[mainIndex].length},${index ~/ StaticValues.grids[mainIndex].length})',
            style: TextStyle(
                color: _getColor() == const Color(0xFF000000)
                    ? Colors.white
                    : Colors.black)),
      ),
    );
  }

  Color _getColor() {
    Point point = Point(
        x: index % StaticValues.grids[mainIndex].length,
        y: index ~/ StaticValues.grids[mainIndex].length);
    List<Point> steps = StaticValues.results[mainIndex].result.steps;
    for (int i = 0; i < steps.length; i++) {
      if (steps[i].x == point.x && steps[i].y == point.y) {
        if (steps[0].x == point.x && steps[0].y == point.y) {
          return const Color(0xFF64FFDA);
        }
        if (steps[steps.length - 1].x == point.x &&
            steps[steps.length - 1].y == point.y) {
          return const Color(0xFF009688);
        }
        return const Color(0xFF4CAF50);
      }
    }

    if (StaticValues.grids[mainIndex][point.y][point.x] == 'X') {
      return const Color(0xFF000000);
    }
    return const Color(0xFFFFFFFF);
  }
}
