import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictok_clone/common/widgets/video_config/video_config.dart';
import 'package:tictok_clone/features/notification/notifications_provider.dart';
import 'package:tictok_clone/features/videos/repository/playback_config_repo.dart';
import 'package:tictok_clone/features/videos/viewmodels/playback_config_vm.dart';
import 'package:tictok_clone/firebase_options.dart';
import 'package:tictok_clone/router.dart';
import 'constants/sizes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진 초기화

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Firebase 초기화

  await SystemChrome.setPreferredOrientations(
    // 세로 모드로 고정
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    // 시스템 UI 오버레이 스타일 설정 (와이파이, 배터리, 시계 등)
    SystemUiOverlayStyle.dark,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        playbackConfigProvider.overrideWith(() => PlaybackConfigViewModel(repository)),
      ],
      child: TikTokApp(),
    ),
  );
}

class TikTokApp extends ConsumerWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // S.load(Locale('en')); // 언어 설정 강제
    // S.load(Locale('ko')); // 언어 설정 강제
    

    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'TikTok',
      themeMode: ThemeMode.system,
      localizationsDelegates: [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ko'),
      ],
      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey.shade600,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          elevation: 0.5,
          shadowColor: Colors.grey,
          backgroundColor: Colors.white,
          // foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Color(0xFFE9435A),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          // foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey.shade400,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}

class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width / 2,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Width: ${size.width} / ${constraints.maxWidth}, Height: ${constraints.maxHeight}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
