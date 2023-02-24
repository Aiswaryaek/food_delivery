import 'package:flutter/material.dart';

import 'features/auth/user_auth.dart';

class FlutterBasicApp extends StatefulWidget {
  @override
  _FlutterBasicAppState createState() => _FlutterBasicAppState();
}

class _FlutterBasicAppState extends State<FlutterBasicApp> {
  @override
  Widget build(BuildContext context) {
    return const UserAuthentication();
  }
}
