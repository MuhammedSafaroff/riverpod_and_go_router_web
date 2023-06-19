import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_and_go_router_web/pages/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
