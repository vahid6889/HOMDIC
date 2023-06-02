import 'dart:ui';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homdic/common/utils/custom_snackbar.dart';
import 'package:homdic/common/utils/prefs_operator.dart';
import 'package:homdic/common/widgets/main_wrapper.dart';
import 'package:homdic/features/feature_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:homdic/features/feature_intro/presentation/screens/intro_main_wrapper.dart';
import 'package:homdic/locator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset('assets/rive_assets/blobs.riv'),
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/images/splash/spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset('assets/rive_assets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
              child: const Opacity(opacity: 1),
            ),
          ),
          SafeArea(
            child: Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DelayedWidget(
                      delayDuration: const Duration(milliseconds: 200),
                      animationDuration: const Duration(milliseconds: 1000),
                      animation: DelayedAnimations.SLIDE_FROM_TOP,
                      child: Image.asset(
                        'assets/images/hc_logo.png',
                        width: width * 12,
                      ),
                    ),
                  ),
                  BlocConsumer<SplashCubit, SplashState>(
                    builder: (context, state) {
                      /// if user is online
                      if (state.connectionStatus is ConnectionInitial ||
                          state.connectionStatus is ConnectionOn) {
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: LoadingAnimationWidget.prograssiveDots(
                            color: Colors.red,
                            size: 50,
                          ),
                        );
                      }

                      /// if user is offline
                      if (state.connectionStatus is ConnectionOff) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DelayedWidget(
                              delayDuration: const Duration(milliseconds: 200),
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              animation: DelayedAnimations.SLIDE_FROM_LEFT,
                              child: const Text(
                                'به اینترنت متصل نیستید !',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: "Vazir",
                                ),
                              ),
                            ),
                            DelayedWidget(
                              delayDuration: const Duration(milliseconds: 200),
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                              child: IconButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  /// check that we are online or not
                                  BlocProvider.of<SplashCubit>(context)
                                      .checkConnectionEvent();
                                },
                                icon: const Icon(
                                  Icons.autorenew,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        );
                      }

                      /// default value
                      return Container();
                    },
                    listener: (context, state) {
                      if (state.connectionStatus is ConnectionOn) {
                        goToHome();
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> goToHome() async {
    PrefsOperator prefsOperator = locator<PrefsOperator>();
    var shouldShowIntro = await prefsOperator.getIntroState();
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        if (shouldShowIntro) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            IntroMainWrapper.routeName,
            ModalRoute.withName("intro_main_wrapper"),
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainWrapper.routeName,
            ModalRoute.withName("main_wrapper"),
          );
        }
      },
    );
  }
}
