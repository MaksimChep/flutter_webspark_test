import 'package:flutter_webspark_test/data/models/task_response_entity.dart';

/// A FullResult has an id and a Result. A Result has a list of Points and a path. A Point has x
/// and y. Class created to save and send results of calculations
class FullResult {
  final String id;
  final Result result;

  FullResult({required this.id, required this.result});
  Map<String, dynamic> toJson() => {
        "id": id,
        "result": result.toJson(),
      };
}

class Result {
  final List<Point> steps;
  final String path;

  Result({required this.steps, required this.path});
  Map<String, dynamic> toJson() => {
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
        "path": path,
      };
}
