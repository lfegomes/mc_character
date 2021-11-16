import 'package:flutter/material.dart';

import '../app/presentation/view/home_page.dart';
import 'shared/colors.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MC Characters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColors.mainColor,
        colorScheme:
            ThemeData().colorScheme.copyWith(secondary: KColors.mainColor),
        scaffoldBackgroundColor: KColors.scaffoldColor,
      ),
      home: const HomePage(),
    );
  }
}
