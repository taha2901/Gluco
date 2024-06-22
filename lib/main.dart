import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/core/widgets/onboarding.dart';
// import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gluco/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:gluco/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/auth/presentation/view/login.dart';
import 'package:gluco/features/home/presentation/manager/dooctor_cubit/doctor_cubit.dart';
import 'package:gluco/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart';
import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final savedThemeMode = await AdaptiveTheme.getThemeMode();
  DioHelper.init();
  await ChachHelper.init();

  userToken = ChachHelper.getData(key: 'token');
  debugPrint('Token in main is $userToken');

  Widget widget;
  bool? onBoarding = ChachHelper.getData(key: 'onBoarding');

  if (onBoarding != null) {
    if (userToken != null) {
      Auth auth = Auth(/* Initialize Auth object with required parameters */);
      widget = GlucoLayout(
        auth: auth,
      );
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(
    Gluco(
      startWidget: widget,
      token: userToken,
      // savedThemeMode: savedThemeMode,
    ),
  );
}

class Gluco extends StatelessWidget {
  // final AdaptiveThemeMode? savedThemeMode;
  final Widget startWidget;
  final String? token;

  const Gluco({
    Key? key,
    // this.savedThemeMode,
    required this.startWidget,
    this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorCubit()..getDoctors(),
        ),
        BlocProvider(
          create: (context) => SocialCubit()..getPosts(),
        ),
        BlocProvider(
          create: (context) => GetMedicineCubit()..getMedicines(),
        ),
        BlocProvider(
          create: (context) => AddMedicineCubit(),
        ),
        BlocProvider<ReservationCubit>(
          create: (context) => ReservationCubit(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
