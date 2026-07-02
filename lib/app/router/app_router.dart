import 'package:go_router/go_router.dart';

import 'app_routes.dart';

import '../../features/auth/presentation/pages/otp_page.dart';
import '../../features/auth/presentation/pages/phone_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/profile_setup_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/welcome/presentation/pages/welcome_page.dart';

// Uncomment later after onboarding is completed
// import '../../features/home/presentation/pages/home_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,

  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomePage(),
    ),

    GoRoute(
      path: AppRoutes.phone,
      builder: (context, state) => const PhonePage(),
    ),

    GoRoute(
      path: AppRoutes.otp,
      builder: (context, state) {
        final phone = state.extra as String? ?? '';

        return OtpPage(
          phoneNumber: phone,
        );
      },
    ),

    GoRoute(
      path: AppRoutes.profileSetup,
      builder: (context, state) => const ProfileSetupPage(),
    ),

    /*
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
    */
  ],
);