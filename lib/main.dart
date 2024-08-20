import 'package:etos_driver/contants/colors.dart';
import 'package:etos_driver/provider/user_provider.dart';
import 'package:etos_driver/screens/auth/login_page.dart';
import 'package:etos_driver/screens/auth/register_page.dart';
import 'package:etos_driver/screens/main_page.dart';
import 'package:etos_driver/screens/map/map_page.dart';
import 'package:etos_driver/screens/notification/notification_page.dart';
import 'package:etos_driver/screens/otp/otp_page.dart';
import 'package:etos_driver/screens/profile/profile_detail_page.dart';
import 'package:etos_driver/screens/profile/profile_page.dart';
import 'package:etos_driver/screens/shipment/shipment_detail_page.dart';
import 'package:etos_driver/screens/shipment/shipment_page.dart';
import 'package:etos_driver/screens/sos/sos_page.dart';
import 'package:etos_driver/screens/splash/splash_page.dart';
import 'package:etos_driver/services/dialog.dart';
import 'package:etos_driver/services/dialog_manager/dialog_manager.dart';
import 'package:etos_driver/services/navigation.dart';
// import 'package:etos_driver/services/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService().initNotification();
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  runApp(const MyApp());
}

GetIt locator = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return MaterialApp(
            theme: ThemeData(),
            title: 'T-Wallet',
            debugShowCheckedModeBanner: false,
            initialRoute: SplashPage.routeName,
            builder: (context, widget) => Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) =>
                    DialogManager(child: loading(context, widget)),
              ),
            ),
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case MainPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  });
                case SplashPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const SplashPage();
                  });
                case LoginPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  });
                case ProfileDetailpage.routeName:
                  ProfileDetailpageArguments arguments =
                      settings.arguments as ProfileDetailpageArguments;
                  return MaterialPageRoute(builder: (context) {
                    return ProfileDetailpage(
                      user: arguments.user,
                    );
                  });
                case NotificationPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const NotificationPage();
                  });
                case ProfilePage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const ProfilePage();
                  });
                case ShipmentPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const ShipmentPage();
                  });
                case MapPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const MapPage();
                  });
                case SosPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const SosPage();
                  });
                case RegisterPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const RegisterPage();
                  });
                case OtpVerifyPage.routeName:
                  OtpVerifyPageArguments arguments =
                      settings.arguments as OtpVerifyPageArguments;
                  return MaterialPageRoute(builder: (context) {
                    return OtpVerifyPage(
                      email: arguments.email,
                    );
                  });
                case DetailPage.routeName:
                  DetailPageArguments arguments =
                      settings.arguments as DetailPageArguments;
                  return MaterialPageRoute(builder: (context) {
                    return DetailPage(
                      data: arguments.data,
                    );
                  });
                default:
                  return MaterialPageRoute(
                    builder: (_) => const MainPage(),
                  );
              }
            },
          );
        },
      ),
    );
  }
}

Widget loading(BuildContext context, widget) {
  bool shouldPop = false;

  // ignore: deprecated_member_use
  return WillPopScope(
    child: Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          bottom: false,
          top: false,
          child: Stack(
            children: [
              Opacity(
                opacity: 1,
                child: Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      widget,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    onWillPop: () async {
      return shouldPop;
    },
  );
}
