import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "explore": "اكتشف",
          "arabic": "العربية",
          "english": "الإنجليزية"
        },
        "en": {"explore": "Explore", "arabic": "Arabic", "english": "English"}
      };
}
