import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/showroom/bindings/showroom_binding.dart';
import '../modules/splash/view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/';

  static final routes = [
    GetPage(
      name: '/',
      page: () => SplashUI(),
      preventDuplicates: true,
      participatesInRootNavigator: true,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      bindings: [
        HomeBinding(),
        ShowroomBinding(),
        ProfileBinding(),
      ],
      //   children: [
      //     GetPage(
      //       name: _Paths.SHOWROOM,
      //       page: () => ShowroomView(),
      //       binding: ShowroomBinding(),
      //     ),
      //     GetPage(
      //       name: _Paths.PROFILE,
      //       page: () => ProfileView(),
      //       binding: ProfileBinding(),
      //     ),
      //     GetPage(
      //       name: _Paths.MAPS,
      //       page: () => MapsView(),
      //       binding: MapsBinding(),
      //     ),
      //   ],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
