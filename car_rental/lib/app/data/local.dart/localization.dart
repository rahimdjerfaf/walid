import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "Hey there": "Hey there",
        },
        'ar': {
          "Hey there": "مرحبا",
        },
        'fr': {
          "Hey there": "Bonjour",
        },
      };
}
