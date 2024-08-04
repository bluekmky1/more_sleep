import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'env/env.dart';
import 'routes/app_router.dart';
import 'theme/color_palette.dart';
import 'theme/color_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NaverMapSdk.instance.initialize(clientId: 'jk38qcvkgl');

  await Supabase.initialize(
    url: 'https://dnqgzcinhivjlehmcsqr.supabase.co',
    anonKey: Env.supabaseAnonKey,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: ref.watch(appRouterProvider).router,
        title: '좀만 더 잘래',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          colorSchemeSeed: ColorPalette.lightBlue300,
          fontFamily: 'Pretendard',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: ColorPalette.white,
          ),
          splashColor: ColorPalette.lightGray200,
          extensions: const <ThemeExtension<dynamic>>[
            ColorTheme.light,
          ],
        ),
      );
}
