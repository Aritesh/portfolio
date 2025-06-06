import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/resource/colors.dart';
import 'package:portfolio/view/root.dart';

void main() {
  runApp(ProviderScope(child: const AppTheme()));
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ritesh Agrawal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors().primaryColor,
        brightness: Brightness.dark,
      ),
      home: const RootScreen(),
    );
  }
}
