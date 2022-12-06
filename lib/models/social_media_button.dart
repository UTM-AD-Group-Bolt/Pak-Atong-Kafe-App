import 'package:flutter/material.dart';
import 'social_media.dart';

class SocMedButton extends StatelessWidget {
  final SocialMedia socmed;

  SocMedButton({required this.socmed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xff26201d),
        boxShadow: [
          BoxShadow(
            color: Color(0xffcd5f2a),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          )
        ],
      ),
      child: Material(
        color: Color(0x00ff0000),
        child: InkWell(
          child: SizedBox(
            height: 60,
            width: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith((states) {
                  return EdgeInsets.all(5.0);
                }),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                    )
                ),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Color(0xff26201d);
                }),
                overlayColor: MaterialStateProperty.resolveWith((states) {
                    return states.contains(MaterialState.pressed) ? Color(0x66cd5f2a) : null;
                }),
              ),
              onPressed: socmed.login,
              child: Image.asset(socmed.icon),
            ),
          ),
        ),
      ),
    );
  }
}
