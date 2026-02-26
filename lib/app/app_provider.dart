import 'package:antripe_task/features/splash/presentation/screens/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/navigation/app_router.dart';
import '../core/navigation/services/navigation_service.dart';
import '../core/themes/app_theme.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme().theme,
          home: SplashScreen(),
          //onGenerateRoute: AppRouter.generateRoute,
        );


  }
}
