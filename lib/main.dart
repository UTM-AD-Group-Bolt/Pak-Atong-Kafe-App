import 'package:flutter/material.dart';
import 'package:myapp/pages//HomePage.dart';
import 'package:myapp/pages/favoritePage.dart';
import 'package:myapp/pages/LoadingScreen.dart';
import 'package:myapp/pages/MenuDetailsPage.dart';
import 'package:myapp/pages/registerPage.dart';
import 'package:myapp/pages/signInPage.dart';
import 'package:myapp/pages/wrapper.dart';
import 'package:myapp/pages/authenticate.dart';
import 'package:myapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/pages/cartPage.dart';
// import 'ReviewPage.dart';
 import 'package:myapp/pages/faqPage.dart';
// import 'CustomerSupportPage.dart';
// import 'OrderHistoryPage.dart';
// import 'CheckoutPage.dart';
// import 'PaymentMethodPage.dart';
// import 'PaymentSuccessPage.dart';
// import 'ProfilePage.dart';

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
            selectionColor: Color(0xff624840),
            selectionHandleColor: Color(0xffcd5f2a),
          ),
        ),
        home: Wrapper(),
        routes: {
          '/signin':  (context) => SignInPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => HomePage(),
          '/favorites': (context) => FavoritePage(),
          '/loading': (context) => LoadingScreen(),
          '/menudetails': (context) => MenuDetailsPage(),
          '/cart':  (context) => cartPage(),

          // '/review':  (context) => ReviewPage(),
          '/faq':  (context) => faqPage(),
          // '/customersupport':  (context) => CustomerSupportPage(),
          // '/orderhistory':  (context) => OrderHistoryPage(),
          // '/checkout':  (context) => CheckoutPage(),
          // '/paymentmethod':  (context) => PaymentMethodPage(),
          // '/paymentsuccess':  (context) => PaymentSuccessPage(),
          // '/profile':  (context) => ProfilePage(),
        },
      ),
    ),
  );
}
