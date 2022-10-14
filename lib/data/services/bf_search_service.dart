import 'dart:collection';

import 'package:flutter_webspark_test/data/models/static_values.dart';
import 'package:flutter_webspark_test/data/models/task_response_entity.dart';

class BFSearch {
  /// It takes a 2D array of strings and returns a hashmap of strings to lists of strings
  ///
  /// Args:
  ///   grid (List<List<String>>): a 2D array of strings, each string is either '.' or 'X'
  ///
  /// Returns:
  ///   A HashMap of String keys and List values.
  HashMap<String, List<String>> _getNeighbour(List<List<String>> grid) {
    HashMap<String, List<String>> gridMap = HashMap();
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid.length; j++) {
        if (grid[i][j] == '.') {
          List<String> neighbours = List.empty(growable: true);
          String buff;
          if (i > 0) {
            if (grid[i - 1][j] == '.') {
              buff = '${i - 1},$j';
              neighbours.add(buff);
            }
            if (j > 0 && grid[i - 1][j - 1] == '.') {
              buff = '${i - 1},${j - 1}';
              neighbours.add(buff);
            }
            if (j < grid.length - 1 && grid[i - 1][j + 1] == '.') {
              buff = '${i - 1},${j + 1}';
              neighbours.add(buff);
            }
          }
          if (i < grid.length - 1) {
            if (grid[i + 1][j] == '.') {
              buff = '${i + 1},$j';
              neighbours.add(buff);
            }
            if (j > 0 && grid[i + 1][j - 1] == '.') {
              buff = '${i + 1},${j - 1}';
              neighbours.add(buff);
            }
            if (j < grid.length - 1 && grid[i + 1][j + 1] == '.') {
              buff = '${i + 1},${j + 1}';
              neighbours.add(buff);
            }
          }
          if (j > 0 && grid[i][j - 1] == '.') {
            buff = '$i,${j - 1}';
            neighbours.add(buff);
          }
          if (j < grid.length - 1 && grid[i][j + 1] == '.') {
            buff = '$i,${j + 1}';
            neighbours.add(buff);
          }
          gridMap["$i,$j"] = neighbours;
        }
      }
    }
    return gridMap;
  }

  /// _search() takes a HashMap, a start and end point, and returns a list of the points in the path
  /// from start to end._
  ///
  /// The function starts by checking if the start and end points are the same. If they are, it returns
  /// a list with just the start point. If no, function continue checking neighbours of this point to find
  /// the end.
  ///
  /// Args:
  ///   gridMap (HashMap): A HashMap that contains the grid.
  ///   start (String): The starting point of the search
  ///   end (String): The end point of the path
  ///
  /// Returns:
  ///   A list of strings.
  List<String> _search(HashMap gridMap, String start, String end) {
    if (start == end) {
      return List.filled(1, start);
    }
    Queue searchQueue = Queue();
    searchQueue.addAll(gridMap[start]);
    List<String> searched = List.empty(growable: true);
    searched.add(start);
    while (searchQueue.isNotEmpty) {
      String removed = searchQueue.removeFirst();
      if (!searched.contains(removed)) {
        if (removed == end) {
          searched.add(end);
          return searched;
        } else {
          searchQueue.addAll(gridMap[removed]);
          searched.add(removed);
        }
      }
    }
    return List.empty();
  }

  /// _getRoads() takes a list of searched nodes and a hashmap of the grid and returns a list of roads
  ///
  /// Args:
  ///   searched (List<String>): A list of strings that are the cities that have been searched.
  ///   gridMap (HashMap<String, List<String>>): A map of the grid. The key is the name of the node, and
  /// the value is a list of the nodes that are connected to it.
  ///
  /// Returns:
  ///   A list of lists of strings.
  List<List<String>> _getRoads(
      List<String> searched, HashMap<String, List<String>> gridMap) {
    List<List<String>> roads = List.empty(growable: true);
    for (int i = 0; i < searched.length; i++) {
      for (int j = i; j < searched.length; j++) {
        if (gridMap[searched[i]]!.contains(searched[j])) {
          List<String> road = List.empty(growable: true);
          road.add(searched[i]);
          road.add(searched[j]);
          roads.add(road);
        }
      }
    }
    return roads;
  }

  /// It takes a list of strings and returns a list of lists of strings
  ///
  /// Args:
  ///   field (List<String>): The field as a list of strings.
  ///
  /// Returns:
  ///   A list of lists of strings.
  List<List<String>> _getGrid(List<String> field) {
    List<List<String>> grid = List.empty(growable: true);
    for (int i = 0; i < field.length; i++) {
      List<String> row = List.empty(growable: true);
      for (int j = 0; j < field.length; j++) {
        row.add(field[i][j]);
      }
      grid.add(row);
    }
    return grid;
  }

  /// It takes a list of lists of strings, and returns a list of strings
  ///
  /// Args:
  ///   responseData (ResponseData): This is the data that is received from the server.
  ///
  /// Returns:
  ///   A list of strings.
  List<String> getRoad(ResponseData responseData) {
    String start = '${responseData.start.y},${responseData.start.x}';
    String end = '${responseData.end.y},${responseData.end.x}';
    List<List<String>> grid = _getGrid(responseData.field);
    StaticValues.grids.add(grid);
    HashMap<String, List<String>> gridMap = _getNeighbour(grid);
    List<String> searched = _search(gridMap, start, end);
    List<List<String>> roads = _getRoads(searched, gridMap);
    String searchedValue = end;
    List<String> roadReverse = List.empty(growable: true);
    roadReverse.add(end);
    for (int i = 0; i < roads.length; i++) {
      for (int j = 0; j < roads.length; j++) {
        if (roads[j][1] == searchedValue) {
          roadReverse.add(roads[j][0]);
          searchedValue = roads[j][0];
        }
      }
    }
    List<String> road = List.from(roadReverse.reversed);
    return road;
  }
}
