import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

customReplacementNavigation(String path, BuildContext context) {
  GoRouter.of(context).pushReplacement(path);
}

customPushNavigation(String path, BuildContext context, Object? extra) {
  GoRouter.of(context).push(path, extra: extra);
}
