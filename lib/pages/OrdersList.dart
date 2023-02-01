import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/palette.dart';
// import 'package:untitled1/ui/auth/login_screen.dart';
// import 'package:untitled1/ui/firebase_database/add_posts.dart';
// import 'package:untitled1/utils/utils.dart';


class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {

  final auth = FirebaseAuth.instance ;
  final ref = FirebaseDatabase.instance.ref('foodsnew');


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black[600],
      appBar: AppBar(
        title: Text('Orders Received'),
        elevation: 0,
          backgroundColor: Palette.black[600],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text('Loading'),
                itemBuilder: (context, snapshot, animation, index){
                  return   ListTile(
                    title: Text(
                        snapshot.child('Food').value.toString(),
                            style: TextStyle(
                        color: Colors.white,

                    ),
                    ),
                    subtitle: Text(
                        snapshot.child('Price').value.toString(),
                            style: TextStyle(
                        color: Colors.white,
                    )
                    ),
                    trailing:  PopupMenuButton(
                        color: Colors.white,
                        elevation: 4,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        icon: Icon(Icons.more_vert,),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: PopupMenuItem(
                              value: 2,
                              child:  ListTile(
                                onTap: (){


                                },
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child:  ListTile(
                              onTap: (){

                              },
                              leading: Icon(Icons.delete_outline),
                              title: Text('Delete'),
                            ),
                          ),
                        ]),
                  );
                }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        } ,
        child: Icon(Icons.add),
      ),
    );
  }

}