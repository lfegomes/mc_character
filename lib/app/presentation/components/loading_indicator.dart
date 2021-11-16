import 'package:flutter/material.dart';

import '../../../core/core_packages.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 30.0,
        height: 30.0,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            KColors.mainColor,
          ),
        ),
      ),
    );
  }
}
