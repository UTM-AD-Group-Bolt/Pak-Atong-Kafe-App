import 'package:flutter/material.dart';

import 'blank_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: Color(0xFFefaf43),),
          backgroundColor: Color(0xFF21181b),
          title: Text("Contact Us"),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFF21181b),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // //Row(
            //   children: [
            //     Icon(Icons.arrow_back),
            //     // IconButton(
            //     //   onPressed: () {},
            //     //   icon: Icon(
            //     //     Icons.arrow_back,
            //     //     color: Color(0xFFefaf43),
            //     //   ),
            //     // ),
            //     Spacer(),
            //     Text(
            //       "Contact Us",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     SizedBox(),
            //   ],
            // ),
            Divider(
              color: Colors.grey,
              endIndent: 10,
              indent: 10,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Many of the questions you may have\nwhile using this application",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.green,
                      size: 40,
                    ),
                    title:  Text(
                      "Whatsapp",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle:  Text(
                      "07-4577261",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                      child: Icon(FontAwesomeIcons.envelope,color: Color(0xFF21181b),),
                    ),
                    title:  Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle:  Text(
                      "PakAtong@gmail.com",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  InkWell(
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return BlankScreen();
                        },),);
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(FontAwesomeIcons.questionCircle,size: 40,color: Colors.amber,),
                      title:  Text(
                        "Ask Here",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      // subtitle:  Text(
                      //   "abc@gmail.com",
                      //   style: TextStyle(
                      //       color: Colors.grey,
                      //       fontWeight: FontWeight.w500),
                      // ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Download our Application:",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "PlayStore",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Copyright | Bolts 2022",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],),),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}