import 'package:get/get.dart';
import 'package:hamza/Views/home_view.dart';
import 'package:hamza/Views/upload_image_view.dart';

import '../Views/authentication_view.dart';

class AppRoutes {
  static const String initial = '/';
  static const String homeScreen = '/home';
  static const String uploadImageScreen = '/uploadImageScreen';

  static final routes = [
    GetPage(name: initial, page: () => AuthenticationScreen()),
    GetPage(name: homeScreen, page: () => const Home()),
    GetPage(name: uploadImageScreen, page: () => UploadImage()),
  ];
}
