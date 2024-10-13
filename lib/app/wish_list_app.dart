import 'package:flutter/material.dart';

import 'app.dart';

class WishListApp extends StatelessWidget {
  const WishListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Products',
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
