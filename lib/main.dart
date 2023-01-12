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
import 'package:myapp/models/user.dart';
import 'package:myapp/pages/cartPage.dart';
import 'package:myapp/pages/faqPage.dart';
import 'package:myapp/testing2/catalog_screen.dart';
import 'package:myapp/testing2/cart_screen.dart';
import 'package:myapp/aaaatest/FetchingDataPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';
import 'package:myapp/testing2/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartController2());
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
          '/testcatalog':  (context) => TestCatalogScreen(),
          '/testcart':  (context) => TestCartScreen(),
          '/faq':  (context) => faqPage(),
          '/fetchingdatapage': (context) => FetchingDataPage(),
        },
      ),
    ),
  );
}