import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_effect/Pages/main_page.dart';
import 'package:soda_effect/Providers/animation_provider.dart';
import 'package:soda_effect/Utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AnimationProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: "/",
        theme: TAppTheme.theme,
        routes: {
          '/': (context) => const MainPage(),
        },
      ),
    ),
  );
}
