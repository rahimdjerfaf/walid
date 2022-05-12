import 'package:car_rental/app/data/constatns/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/data/local.dart/localization.dart';
import 'app/modules/widgets/loading.dart';
import 'app/routes/app_pages.dart';
import 'app/services/services.dart';
import 'firebase_options.dart';
import 'init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
      builder: (languageController) {
        return Loading(
          child: GetMaterialApp(
            title: '', //todo
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            themeMode: ThemeMode.system,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            initialRoute: AppPages.INITIAL,
            translations: Localization(),
            locale: languageController.getLocale,
          ),
        );
      },
    );
  }
}
