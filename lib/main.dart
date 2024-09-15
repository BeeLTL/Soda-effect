import 'package:flutter/material.dart';
import 'package:soda_effect/Pages/main_page.dart';
import 'package:soda_effect/Utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      initialRoute: "/",
      theme: TAppTheme.theme,
      routes: {
        '/': (context) => MainPage(),
      },
    ),
  );
}
