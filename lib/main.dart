import 'package:flutter/material.dart';
import 'package:homdic/common/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:homdic/common/widgets/main_wrapper.dart';
import 'package:homdic/config/my_theme.dart';
import 'package:homdic/features/feature_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:homdic/features/feature_auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:homdic/features/feature_auth/presentation/screens/mobile_signup_screen.dart';
import 'package:homdic/features/feature_intro/presentation/bloc/intro_cubit/intro_cubit.dart';
import 'package:homdic/features/feature_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:homdic/features/feature_intro/presentation/screens/intro_main_wrapper.dart';
import 'package:homdic/features/feature_intro/presentation/screens/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homdic/features/feature_product/presentation/screens/all_products_screen.dart';
import 'package:homdic/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => locator<SignupBloc>()),
        BlocProvider(create: (_) => locator<LoginBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: "/",
      locale: const Locale("fa", ""),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("fa", ""),
      ],
      routes: {
        IntroMainWrapper.routeName: (context) => IntroMainWrapper(),
        MainWrapper.routeName: (context) => MainWrapper(),
        MobileSignUpScreen.routeName: (context) => const MobileSignUpScreen(),
        AllProductsScreen.routeName: (context) => const AllProductsScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Homdic',
      home: const SplashScreen(),
    );
  }
}
