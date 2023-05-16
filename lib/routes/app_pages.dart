import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/load_screen/load_screen.dart';
import 'app_routes.dart';

class AppPages {
  final AuthBloc loginAuth;

  AppPages(
    this.loginAuth,
  );

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: PathsRoute.loadScreen,
    redirect: (context, state) {
      // final bool isLogin = loginAuth.state.isLogin == false;
      // log(" loginBloc.status $isLogin");

      // if (isLogin) {
      //   return PathsRoute.homeScreen;
      // }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        name: PathsRoute.loadScreen,
        path: PathsRoute.loadScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoadScreen();
        },
      ),
      GoRoute(
        name: PathsRoute.homeScreen,
        path: PathsRoute.homeScreen,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const HomePage(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: const [],
      ),
    ],
  );
  // static GoRouter get router => _router;
}
