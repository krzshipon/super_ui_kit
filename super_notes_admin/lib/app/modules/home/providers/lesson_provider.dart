import 'package:get/get.dart';

import '../lesson_model.dart';

class LessonProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Lesson.fromJson(map);
      if (map is List) return map.map((item) => Lesson.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Lesson?> getLesson(int id) async {
    final response = await get('lesson/$id');
    return response.body;
  }

  Future<Response<Lesson>> postLesson(Lesson lesson) async =>
      await post('lesson', lesson);
  Future<Response> deleteLesson(int id) async => await delete('lesson/$id');
}
