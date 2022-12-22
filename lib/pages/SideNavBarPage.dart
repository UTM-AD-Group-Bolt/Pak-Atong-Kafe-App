import 'package:flutter/material.dart';
import 'package:myapp/models/palette.dart';
import '../services/auth.dart';

class SideNavBar extends StatelessWidget {
  SideNavBar({Key? key}) : super(key: key);

  Widget _sideNavListTile({required IconData? icon, required String title, required bool disabled, Function()? onTap, Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: ListTile(
        leading: Icon(
          icon,
          color: (disabled) ? Palette.black[400] : Palette.yellow,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'DMSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: (disabled) ? Palette.black[400] : Palette.yellow,
          ),
        ),
        onTap: (disabled) ? null : onTap,
        trailing: trailing,
      ),
    );
  }

  Function() alertBoxSignOut(BuildContext context){
    return (){
      // set up the buttons
      Widget signOutButton = SizedBox(
        width: double.infinity,
        height: 50.0,
        child: TextButton(
          child: Text("Sign out"),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            foregroundColor: Palette.orange,
            backgroundColor: Palette.beige[300],
            textStyle: TextStyle(
              fontFamily: 'DMSans',
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop('dialog');
            await _auth.signOut();
          },
        ),
      );
      Widget cancelButton = SizedBox(
        width: double.infinity,
        height: 50.0,
        child: TextButton(
            child: Text("Cancel"),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              foregroundColor: Palette.orange,
              backgroundColor: Palette.beige[300],
              textStyle: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
            }
        ),
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        icon: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Icon(
            Icons.logout,
            color: Palette.brown,
            size: 60.0,
          ),
        ),
        insetPadding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Palette.beige[100],
        title: Text("Are you sure you want to sign out?"),
        titleTextStyle: TextStyle(
          fontFamily: 'DMSans',
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: Palette.brown,
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              signOutButton,
              cancelButton,
            ],
          ),
        ),
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    };
  }

  final AuthService _auth = AuthService();
  int numOrders = 3;
  int numCart = 0;
  String accountName = "Test Account";
  String accountAddress = "email@gmail.com";
  bool isAnon = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.black[600],
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Palette.yellow,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Palette.yellow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                ClipOval(
                  child: Image.network(
                    (isAnon) ? "https://img.icons8.com/ios-glyphs/90/000000/user--v1.png" : "https://thispersondoesnotexist.com/image",
                    color: (isAnon) ? Palette.white[300] : null,
                    width: 125,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  (isAnon) ? 'Anonymous' : accountName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Palette.white,
                  ),
                ),
                Text(
                  (isAnon) ? '(Features are limited)' : accountAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Palette.white,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SizedBox(height: 10),
          _sideNavListTile(
            icon: Icons.menu,
            title: "Track Order",
            disabled: false,
            onTap: (){
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/favorites');
              print("User moved to Track Order page");
            },
            trailing: (numOrders > 0) ?
            ClipOval( //if (numOrders > 0), then trailing = ClipOval()
              child: Container(
                color: Colors.red,
                width: 25,
                height: 25,
                child: Center(
                  child: Text(
                    (numOrders > 9) ? '9+' : '${numOrders}',
                    style: TextStyle(
                      color: Palette.white[300],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
            : null, //if (numOrders <= 0), then trailing = null
          ),
          _sideNavListTile(
            icon: Icons.shopping_cart,
            title: "Cart",
            disabled: false,
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/favorites');
            },
            trailing: (numCart > 0) ?
            ClipOval( //if (numOrders > 0), then trailing = ClipOval()
              child: Container(
                color: Colors.red,
                width: 25,
                height: 25,
                child: Center(
                  child: Text(
                    (numCart > 9) ? '9+' : '${numCart}',
                    style: TextStyle(
                      color: Palette.white[300],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
                : null, //if (numOrders <= 0), then trailing = null
          ),
          _sideNavListTile(
            icon: Icons.favorite,
            title: "Favorites",
            disabled: isAnon,
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          _sideNavListTile(
            icon: Icons.history,
            title: "Order History",
            disabled: isAnon,
            onTap: (){
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/favorites');
              print("User moved to Order History page");
            },
          ),
          Divider(
            height: 5.0,
            thickness: 1.0,
            color: Palette.yellow,
          ),
          _sideNavListTile(
            icon: Icons.phone,
            title: "Contact Us",
            disabled: false,
            onTap: (){
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/favorites');
              print("User moved to Contact Us page");
            },
          ),
          _sideNavListTile(
            icon: Icons.watch_later,
            title: "Open Hours",
            disabled: false,
            onTap: (){
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/favorites');
              print("User moved to Open Hours page");
            },
          ),
          _sideNavListTile(
            icon: Icons.message_rounded,
            title: "FAQ",
            disabled: false,
            onTap: (){
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/favorites');
              print("User moved to FAQ page");
            },
          ),
          Divider(
            height: 5.0,
            thickness: 1.0,
            color: Palette.yellow,
          ),
          _sideNavListTile(
            icon: Icons.logout,
            title: "Sign out",
            disabled: false,
            onTap: alertBoxSignOut(context),
          ),
        ],
      ),
    );
  }
}
