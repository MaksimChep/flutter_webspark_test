import 'package:flutter_webspark_test/data/models/result_entity.dart';
import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/data/models/task_response_entity.dart';
import 'package:flutter_webspark_test/data/repository/result_repository.dart';
import 'package:flutter_webspark_test/data/repository/task_response_repository.dart';
import 'package:flutter_webspark_test/data/repository/task_response_repository_impl.dart';
import 'package:flutter_webspark_test/data/services/bf_search_service.dart';
import 'package:flutter_webspark_test/data/services/http_service.dart';

/// This class is responsible for getting the results of the task and sending them to the server
class ResultRepositoryImpl extends ResultRepository {
  final TaskResponseRepository _taskResponseRepository =
      TaskResponseRepositoryImpl();
  final _bfSearch = BFSearch();
  final _httpService = HttpService();

  @override
  Future<List<FullResult>> getResults() async {
    TaskResponse taskResponse = await _taskResponseRepository.getTaskResponse();
    List<FullResult> results = List.empty(growable: true);
    for (int i = 0; i < taskResponse.data.length; i++) {
      List<String> road = _bfSearch.getRoad(taskResponse.data[i]);
      List<Point> steps = List.empty(growable: true);
      for (int j = 0; j < road.length; j++) {
        List<String> splitedPoint = road[j].split(',');
        Point point =
            Point(x: int.parse(splitedPoint[1]), y: int.parse(splitedPoint[0]));
        steps.add(point);
      }
      String path = '';
      for (int j = 0; j < steps.length - 1; j++) {
        path += '(${steps[j].x},${steps[j].y})->';
      }
      path += '(${steps[steps.length - 1].x},${steps[steps.length - 1].y})';
      FullResult fullResult = FullResult(
          id: taskResponse.data[i].id,
          result: Result(steps: steps, path: path));
      results.add(fullResult);
    }
    return results;
  }

  @override
  Future<int> sendResults() async {
    List<FullResult> results = StaticValues.results;
    return await _httpService.postResponse(results);
  }
}
