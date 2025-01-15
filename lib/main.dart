import 'package:coinpay/screens/home%20page/home_page.dart';
import 'package:coinpay/screens/onboarding/onboarding.dart';
import 'package:coinpay/screens/registration/create_account.dart';
import 'package:coinpay/screens/registration/number_authentication.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/registration/account_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true)
          .copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
      initialRoute: '/registration',
      routes: {
        '/home': (context) => const HomePage(),
        '/onboarding': (context) => Onboarding(),
        '/create_account': (context) => CreateAccount(),
        '/registration': (context) => Registration(),
        '/number_auth': (context) => NumberAuthentication()
      },
    );
  }
}
