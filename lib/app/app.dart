import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '/app/ui/views/home.dart';

const _subThemeData = FlexSubThemesData(
  bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
);

final _colors = FlexSchemeColor.from(primary: const Color(0xFF22309c), brightness: Brightness.light);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod and Flex Color',
      theme: FlexColorScheme.light(colors: _colors, subThemesData: _subThemeData).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: FlexScheme.blue).toTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}
