import 'package:auto_route/auto_route.dart';
import 'package:calendar_for_alif/presentation/pages/main_home_screen.dart';

import '../presentation/pages/event_add_page.dart';
import '../presentation/pages/todo_detailed.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  // MaterialRoute(
  //   page: AuthenticationScreen,
  //   fullscreenDialog: true,
  //   path: AuthenticationScreen.routeName,
  // ),
  CustomRoute(
    path: EventAddPage.routeName,
    page: EventAddPage,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),
  CustomRoute(
    path: TodoDetailed.routeName,
    page: TodoDetailed,
    transitionsBuilder: TransitionsBuilders.slideLeft,
  ),

  MaterialRoute(
    fullscreenDialog: true,
    initial: true,
    page: MainHScreen,
    path: MainHScreen.routeName,
  ),
])
class $AppRouter {}
