import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
