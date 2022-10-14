import 'package:flutter_webspark_test/data/models/task_response_entity.dart';
import 'package:flutter_webspark_test/data/repository/task_response_repository.dart';
import 'package:flutter_webspark_test/data/services/http_service.dart';

/// The TaskResponseRepositoryImpl class is a concrete implementation of the TaskResponseRepository
/// interface. It uses the HttpService class to make a network request and then converts the response
/// into a TaskResponse object
class TaskResponseRepositoryImpl extends TaskResponseRepository {
  final _httpService = HttpService();

  @override
  Future<TaskResponse> getTaskResponse() async {
    final response = await _httpService.getResponseBody();
    return TaskResponse.fromJson(response);
  }
}
