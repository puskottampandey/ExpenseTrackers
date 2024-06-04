import 'package:expensetracker/global/authentication/signup_screen/signup_screen.dart';
import 'package:expensetracker/global/onboarding/onboarding_screen.dart';
import 'package:expensetracker/global/splash_screen.dart';
import 'package:expensetracker/routes/route_constants.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        name: RouteConstants.splashScreen,
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        }),
    GoRoute(
        name: RouteConstants.onboarding,
        path: '/onboarding',
        builder: (context, state) {
          return OnboardingScreen();
        }),
    GoRoute(
        name: RouteConstants.signup,
        path: '/signup',
        builder: (context, state) {
          return const SignupScreen();
        })
  ],
);
