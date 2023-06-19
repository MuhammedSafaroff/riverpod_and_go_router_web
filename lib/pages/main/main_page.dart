import 'package:flutter/material.dart';
import 'package:riverpod_and_go_router_web/pages/global/app_drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
            child: const AppDrawer(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
