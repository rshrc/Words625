// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:words625/routing/routing.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: LangChoiceRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LessonRoute.page),
        AutoRoute(page: VowelAndConsonantLearningRoute.page),
        AutoRoute(page: MatchWordsRoute.page),
      ];
}
