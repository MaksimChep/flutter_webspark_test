import 'package:flutter_webspark_test/data/models/task_response_entity.dart';

/// TaskResponseRepository is an abstract class that has a method called getTaskResponse that returns a
/// Future of type TaskResponse
abstract class TaskResponseRepository {
  Future<TaskResponse> getTaskResponse();
}
