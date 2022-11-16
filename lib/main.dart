import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'favoritePage.dart';
import 'LoadingScreen.dart';
// import 'MenuDetailsPage.dart';
// import 'ReviewPage.dart';
// import 'FaqPage.dart';
// import 'CustomerSupportPage.dart';
// import 'OrderHistoryPage.dart';
// import 'LogInPage.dart';
// import 'CheckoutPage.dart';
// import 'PaymentMethodPage.dart';
// import 'PaymentSuccessPage.dart';
// import 'ProfilePage.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomePage(),
      '/favorites': (context) => FavoritePage(),
      '/loading': (context) => LoadingScreen(),
      // '/menudetails':  (context) => MenuDetailsPage(),
      // '/review':  (context) => ReviewPage(),
      // '/faq':  (context) => FaqPage(),
      // '/customersupport':  (context) => CustomerSupportPage(),
      // '/orderhistory':  (context) => OrderHistoryPage(),
      // '/login':  (context) => LogInPage(),
      // '/checkout':  (context) => CheckoutPage(),
      // '/paymentmethod':  (context) => PaymentMethodPage(),
      // '/paymentsuccess':  (context) => PaymentSuccessPage(),
      // '/profile':  (context) => ProfilePage(),


    },
  ));
}