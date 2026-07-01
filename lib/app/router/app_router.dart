import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/welcome/presentation/pages/welcome_page.dart';
import '../../features/auth/presentation/pages/phone_page.dart';
import '../../features/auth/presentation/pages/otp_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),

    GoRoute(
      path: '/phone',
      builder: (context, state) => const PhonePage(),
    ),

    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpPage(),
    ),
  ],
);