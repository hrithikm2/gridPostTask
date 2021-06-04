import 'package:get/get.dart';
import 'package:gridPost/pages/grid/grid_controller.dart';
import 'package:gridPost/pages/posts/posts_controller.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<GridController>(() => GridController());
    Get.lazyPut<PostsController>(() => PostsController());
  }
}
