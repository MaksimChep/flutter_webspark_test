import 'package:flutter_webspark_test/data/models/result_entity.dart';

/// The ResultRepository class is an abstract class that defines the methods that will be used to get
/// and send results
abstract class ResultRepository {
  Future<List<FullResult>> getResults();
  Future<int> sendResults();
}
