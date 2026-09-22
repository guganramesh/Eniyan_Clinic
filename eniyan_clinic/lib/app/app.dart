import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/splash/presentation/pages/splash_page.dart';

class EniyanClinicApp extends StatelessWidget {
  const EniyanClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eniyan Clinic',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashPage(),
    );
  }
}
