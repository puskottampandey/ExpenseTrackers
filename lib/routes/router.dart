import 'package:expensetracker/features/account_setup_screen/add_new_account.dart';
import 'package:expensetracker/features/account_setup_screen/setup_account_screen.dart';
import 'package:expensetracker/features/account_setup_screen/success_screen.dart';
import 'package:expensetracker/features/home_screen/home_main_screen.dart';
import 'package:expensetracker/features/home_screen/views/expense/expense_screen.dart';
import 'package:expensetracker/features/home_screen/views/income/income_screen.dart';
import 'package:expensetracker/features/home_screen/views/transaction/transaction_screen.dart';
import 'package:expensetracker/global/authentication/confirm_screen/confrim_screen.dart';
import 'package:expensetracker/global/authentication/forgot_pass/forgot_password.dart';
import 'package:expensetracker/global/authentication/login_screen/login_sceen.dart';
import 'package:expensetracker/global/authentication/signup_screen/signup_screen.dart';
import 'package:expensetracker/global/connection_check/connection_error_screen.dart';
import 'package:expensetracker/global/onboarding/onboarding_screen.dart';
import 'package:expensetracker/global/splash/splash_screen.dart';
import 'package:expensetracker/routes/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
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
          return AddNewAccount();
        }),
    GoRoute(
        name: RouteConstants.connectionscreen,
        path: '/connectionscreen',
        builder: (context, state) {
          return const ConnectionErrorScreen();
        }),
    GoRoute(
        name: RouteConstants.successscreen,
        path: '/successscreen',
        builder: (context, state) {
          return const SuccessScreen();
        }),
    GoRoute(
        name: RouteConstants.homescreen,
        path: '/homescreen',
        builder: (context, state) {
          return const HomeScreenMain();
        }),
    GoRoute(
        name: RouteConstants.expensescreen,
        path: '/expensescreen',
        builder: (context, state) {
          return const ExpenseScreen();
        }),
    GoRoute(
        name: RouteConstants.incomescreen,
        path: '/incomescreen',
        builder: (context, state) {
          return const IncomeScreen();
        }),
    GoRoute(
        name: RouteConstants.transactionscreen,
        path: '/transactionscreen',
        builder: (context, state) {
          return const TransactionScreen();
        }),
  ],
);
