import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/locale/locale.dart';
import 'package:my_trip/locale/locale_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(MyLocaleController());
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return GetMaterialApp(
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            title: "my trip",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xFF6F35A5),
                secondary: const Color(0xFFF1E6FF),
              ),
              textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30.sp)),
            ),
            // locale: controller.initialLang,
            // translations: MyLocale(),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        });
  }
}
