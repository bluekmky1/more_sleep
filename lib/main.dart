import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';
import 'routes/app_router.dart';
import 'theme/color_palette.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask(
      (String task, Map<String, dynamic>? inputData) async =>
          Future<bool>.value(true));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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
          colorSchemeSeed: ColorPalette.lightBlue300,
          fontFamily: 'Pretendard',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: ColorPalette.darkBlue300,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
          ),
        ),
      );
}
