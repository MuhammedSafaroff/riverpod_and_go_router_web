import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Center(
            child: Text('Teams'),
          ),
        ),
      ],
    );
  }
}
