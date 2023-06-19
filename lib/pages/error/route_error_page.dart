import 'package:flutter/material.dart';

class RouteErrorPage extends StatefulWidget {
  final String errorMsg;
  const RouteErrorPage({required this.errorMsg, Key? key}) : super(key: key);

  @override
  State<RouteErrorPage> createState() => _RouteErrorPageState();
}

class _RouteErrorPageState extends State<RouteErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [Text(widget.errorMsg)],
        ),
      ),
    );
  }
}
