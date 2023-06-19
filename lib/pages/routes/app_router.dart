import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../error/route_error_page.dart';
import '../main/main_page.dart';
import '../project/project_page.dart';
import '../task/tasks_page.dart';
import '../team/team_page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: _rootNavigator,
  initialLocation: '/tasks/1',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) =>
          MainPage(key: state.pageKey, child: child),
      routes: [
        GoRoute(
          path: '/tasks/:id',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: TasksPage(
                key: state.pageKey,
                pathId: state.pathParameters["id"],
              ),
            );
          },
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ProjectPage(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: '/teams',
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: TeamPage(
                key: state.pageKey,
              ),
            );
          },
        ),
      ],
    )
  ],
  errorBuilder: (context, state) => RouteErrorPage(
    errorMsg: state.error.toString(),
    key: state.pageKey,
  ),
);
