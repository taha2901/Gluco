import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/core/widgets/onboarding.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gluco/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:gluco/features/activities/presentation/manager/weight_cubit/weight_check_cubit.dart';
import 'package:gluco/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:gluco/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/auth/presentation/view/login.dart';
import 'package:gluco/features/home/presentation/manager/dooctor_cubit/doctor_cubit.dart';
import 'package:gluco/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart';
import 'package:gluco/features/settings/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:gluco/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gluco/features/settings/presentation/manager/update_cubit/update_profile_cubit.dart';
import 'package:gluco/features/social/presentation/manager/add_posts_cubit/add_post_cubit.dart';
import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
import 'package:gluco/features/social/presentation/manager/update_cubit/update_posts_cubit.dart';
import 'package:gluco/features/social_media/presentation/manager/provider/user_provider.dart';
import 'package:gluco/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ChachHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  userToken = ChachHelper.getData(key: 'token');
  debugPrint('Token in main is $userToken');


  Widget widget;
  bool? onBoarding = ChachHelper.getData(key: 'onBoarding');

  Auth auth = Auth(/* Initialize Auth object with required parameters */);
  if (onBoarding != null) {
    if (userToken != null) {
      widget = GlucoLayout(
        auth: auth,
      );
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(
    Gluco(
      auth: auth,
      startWidget: widget,
      token: userToken,
    ),
  );
}

class Gluco extends StatelessWidget {
  final Widget startWidget;
  final String? token;
  final Auth auth;

  const Gluco({
    Key? key,
    required this.startWidget,
    this.token,
    required this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
        BlocProvider(
          create: (context) => UpdateProfileCubit(),
        ),
        BlocProvider(
          create: (context) => SugarCheckCubit(),
        ),
        BlocProvider(create: (context) => PresssureCheckCubit()),
        BlocProvider(create: (context) => WeightCheckCubit()),
        BlocProvider(
          create: (context) => UpdatePostsCubit(),
        ),
        BlocProvider(
          create: (context) => FavCubit()..getFavourites(),
        ),
        BlocProvider(
          create: (context) => AddPostCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(auth),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
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
