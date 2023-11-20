import 'package:dio/dio.dart';
import 'package:flutter_application_danabot/data/models/page.dart';
import 'package:flutter_application_danabot/data/api/retdio.dart';

final dio = Dio();
final apiService = Controlapi(dio);

Future<List<Comment>> fetchComments() async {
  return apiService.fetchComments();
}
