  import 'package:flutter/material.dart';
  import 'package:go_router/go_router.dart';
  import 'package:pertemuan_lima/modul/news_detail/news_detail.dart';
  import 'package:pertemuan_lima/modul/splash_screen/splash_screen.dart';

  import '../models/user.dart';
  import '../modul/home_screen/home_screen.dart';

  class AppRoutes {
    static const String splash = "splash";
    static const String home = "home";
    static const String profile = "profile";
    static const String newsDetail = "news-detail";

    static Page _splashScreenRouteBuilder(
      BuildContext context,
      GoRouterState state,
    ) {
      return MaterialPage(
        key: state.pageKey,
        child: const SplashScreen(),
      );
    }

    static Page _homeScreenRoutePageBuilder(
      BuildContext context,
      GoRouterState state,
    ) {
      late User user;
      if (state.extra != null && state.extra is User) {
        user = state.extra as User;
      } else {
        user = User(
          id: 002,
          name: "Ridzky Guntur Nuriawan",
          userName: "Ridzky",
          email: "2006024@itg.ac.id",
          profileImage:
              "https://pbs.twimg.com/ext_tw_video_thumb/1213167959146815489/pu/img/lxmfCJGP7FfDSkTk.jpg",
          phoneNumber: "0888888888888",
        );
      }
      return CustomTransitionPage(
        child: HomeScreen(
          key: state.pageKey,
          user: user,
        ),
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    }

    static Page _newsDetailScreenRouteBuilder(
      BuildContext context,
      GoRouterState state,
    ) {
      if (state.params["id"] != null) {
        return MaterialPage(
          key: state.pageKey,
          child: NewsDetailScreen(
            newsId: state.params["id"]!,
          ),
        );
      } else {
        return const MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text("Data Not Found"),
            ),
          ),
        );
      }
    }

    static final GoRouter goRouter = GoRouter(
      routerNeglect: true,
      routes: [
        GoRoute(
          name: splash,
          path: "/splash",
          pageBuilder: _splashScreenRouteBuilder,
        ),
        GoRoute(
          name: home,
          path: "/home",
          pageBuilder: _homeScreenRoutePageBuilder,
          routes: [
            GoRoute(
              name: newsDetail,
              path: "news-detail/:id",
              pageBuilder: _newsDetailScreenRouteBuilder,
            ),
          ],
        ),
      ],
      initialLocation: "/splash",
    );
  }
