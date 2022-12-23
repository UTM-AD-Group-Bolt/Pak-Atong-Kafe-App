import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Ask here"),
        centerTitle: true,
      ),

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(

                  child:  TextFormField(
                   // controller: passwordController,
                    //  autocorrect: true,
                    obscureText: false,

                    decoration: InputDecoration(

                      hintText: 'Type here',
                      prefixIcon: Icon(Icons.edit, color: Colors.white,),
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 15),

                      filled: true,
                      fillColor: Colors.amberAccent,
                      enabledBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color:Colors.amberAccent, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.amberAccent, width: 2),
                      ),
                    ),


                  ),


                  ),


          ],),
        ),
      ),
    );
  }
}
