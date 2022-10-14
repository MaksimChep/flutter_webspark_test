import 'dart:convert';

TaskResponse taskResponseFromJson(String str) =>
    TaskResponse.fromJson(json.decode(str));

String taskResponseToJson(TaskResponse data) => json.encode(data.toJson());

/// It converts the JSON response to a Dart object.
class TaskResponse {
  TaskResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  final bool error;
  final String message;
  final List<ResponseData> data;

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
        error: json["error"],
        message: json["message"],
        data: List<ResponseData>.from(
            json["data"].map((x) => ResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ResponseData {
  ResponseData({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  final String id;
  final List<String> field;
  final Point start;
  final Point end;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        id: json["id"],
        field: List<String>.from(json["field"].map((x) => x)),
        start: Point.fromJson(json["start"]),
        end: Point.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field": List<dynamic>.from(field.map((x) => x)),
        "start": start.toJson(),
        "end": end.toJson(),
      };
}

class Point {
  Point({
    required this.x,
    required this.y,
  });

  final int x;
  final int y;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
