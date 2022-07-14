import 'package:flutter_network_example/api/student.dart';
import 'package:flutter_network_example/api/task.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://3hd50xpvs4.execute-api.us-west-2.amazonaws.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<List<Task>> getTasks();

  @GET("/test/myname")
  Future<List<Student>> getStudent(@Queries() Map<String, dynamic> queries);
}
