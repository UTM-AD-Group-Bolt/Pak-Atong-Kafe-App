import 'package:flutter/material.dart';
import 'package:myapp/pages/ForgotPasswordPage.dart';
import 'package:myapp/pages/PaymentSuccessPage.dart';
import 'package:myapp/pages/HomePage.dart';
import 'package:myapp/pages/favoritePage.dart';
import 'package:myapp/pages/LoadingScreen.dart';
import 'package:myapp/pages/MenuDetailsPage.dart';
import 'package:myapp/pages/registerPage.dart';
import 'package:myapp/pages/signInPage.dart';
import 'package:myapp/pages/wrapper.dart';
import 'package:myapp/models/authenticate.dart';
import 'package:myapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/pages/cartPage.dart';
import 'package:myapp/pages/FetchingDataPage.dart';
import 'package:myapp/pages/PaymentSuccessPage.dart';
import 'package:myapp/pages/cartpage2.dart';
import 'package:myapp/pages/homepage2.dart';
import 'package:myapp/pages/intropage.dart';
import 'package:myapp/pages/OrdersList.dart';

import 'models/palette.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xfff2ab37),
            selectionColor: Palette.brown,
            selectionHandleColor: Color(0xffcd5f2a),
          ),
        ),
        home: Wrapper(),
        routes: {
          '/signin':  (context) => SignInPage(),
          '/forgotpassword':  (context) => ForgotPassword(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => HomePage(),
          '/favorites': (context) => FavoritePage(),
          '/loading': (context) => LoadingScreen(),
          '/menudetails': (context) => MenuDetailsPage(),
          '/cart':  (context) => cartpage2(),
          '/fetchingdatapage': (context) => FetchingDataPage(),
          '/paymentsuccess':  (context) => PaymentScreen(),
          '/menudetails2':  (context) => homepage2(),
          '/preintro': (context) => preintro(),
          '/orderslist': (context) => OrdersList(),

        },
      ),
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:myapp/models/cartmodel2.dart';
// import 'package:provider/provider.dart';
// import 'package:myapp/pages/intropage.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => cartmodel2(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: IntroScreen(),
//       ),
//     );
//   }
// }