import 'dart:io';
import 'package:delivery/provider/dishes_provider.dart';
import 'package:delivery/repositories/category_repositories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                DishesProvider(categoryRepository: CategoryRepository())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme,
      home: FlutterBasicApp(),
    );
  }
}
