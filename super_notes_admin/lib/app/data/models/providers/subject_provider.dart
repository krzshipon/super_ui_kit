import 'package:get/get.dart';

import '../subject_model.dart';

class SubjectProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Subject.fromJson(map);
      if (map is List)
        return map.map((item) => Subject.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Subject?> getSubject(int id) async {
    final response = await get('subject/$id');
    return response.body;
  }

  Future<Response<Subject>> postSubject(Subject subject) async =>
      await post('subject', subject);
  Future<Response> deleteSubject(int id) async => await delete('subject/$id');
}
