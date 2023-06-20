import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../global/app_drawer.dart';

class ProjectPage extends HookConsumerWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(milliseconds: 100), () {
      ref.read(providerNavigationIndex.notifier).state = "projects";
    });
    return Row(
      children: const [
        Expanded(
          child: Center(
            child: Text('Projects'),
          ),
        ),
      ],
    );
  }
}
