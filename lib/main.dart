import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:track_my_expenses/components/middle_layer.dart';
import 'package:track_my_expenses/screens/home_screen.dart';
import 'package:track_my_expenses/utils/colors.dart';

import 'components/splash.dart';

void main() => runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("he", "IL"), // OR Locale('ar', 'AE') OR Other RTL locales
        Locale('he', ''), // Hebrew
      ],
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: main_color,
        primaryColor: main_color,
        appBarTheme: AppBarTheme(
          color: main_color,
          elevation: 0,
        ),
      ),
      home:
          Directionality(textDirection: TextDirection.rtl, child: MiddleLayer()),
    );
  }
}
