import 'package:expensetracker/features/account_setup_screen/add_new_account.dart';
import 'package:expensetracker/features/account_setup_screen/setup_account_screen.dart';
import 'package:expensetracker/global/authentication/confirm_screen/confrim_screen.dart';
import 'package:expensetracker/global/authentication/forgot_pass/forgot_password.dart';
import 'package:expensetracker/global/authentication/login_screen/login_sceen.dart';
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
        }),
    GoRoute(
        name: RouteConstants.login,
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        }),
    GoRoute(
        name: RouteConstants.forgotpassword,
        path: '/forgotpassword',
        builder: (context, state) {
          return const ForgotPasswordScreen();
        }),
    GoRoute(
        name: RouteConstants.confirmScreen,
        path: '/confirmScreen',
        builder: (context, state) {
          return const ConfirmScreen();
        }),
    GoRoute(
        name: RouteConstants.accountSetup,
        path: '/accountSetup',
        builder: (context, state) {
          return const AccountSetUp();
        }),
    GoRoute(
        name: RouteConstants.addnewaccount,
        path: '/addnewaccount',
        builder: (context, state) {
          return const AddNewAccount();
        }),
  ],
);
