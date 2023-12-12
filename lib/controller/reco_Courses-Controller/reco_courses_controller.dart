import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:scipro_application/view/core/core.dart';

class RecordedCourseController extends GetxController {
  Future fetchRecCategoryCourses() async {
    final server = dataserver.collection("recorded_course");
    try {
      server.doc().snapshots();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
