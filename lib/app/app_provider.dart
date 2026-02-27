import 'package:antripe_task/features/splash/presentation/screens/screen_splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/navigation/app_router.dart';
import '../core/navigation/services/navigation_service.dart';
import '../core/themes/app_theme.dart';
import '../features/home/data/providers/home_providers.dart';
import '../features/home/data/repositories/home_repository.dart';
import '../features/home/presentation/bloc/home_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              homeRepository: HomeRepository(
                 contactProvider: HomeContactProvider(dio: Dio()),
              ),
            ),
          ),
      ],
      child:
        MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              debugShowCheckedModeBanner: false,
              //theme: AppTheme().theme,
              home: SplashScreen(),
              onGenerateRoute: AppRouter.generateRoute,
            ),

    );


  }
}
