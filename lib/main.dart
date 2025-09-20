import 'package:flutter/material.dart';
import 'package:smart_ahwa/config/cash/cash_helper.dart';
import 'package:smart_ahwa/view/splash_view.dart';
import 'package:smart_ahwa/widget/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await CashHelper.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          home: SplashView(),
        );
      },
    );
  }
}
