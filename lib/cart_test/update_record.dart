import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {

  const UpdateRecord({Key? key, required this.foodKey}) : super(key: key);

  final String foodKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {

  final  userNameController = TextEditingController();
  final  userAgeController= TextEditingController();
  final  userSalaryController =TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Food');
    getFoodData();
  }

  void getFoodData() async {
    DataSnapshot snapshot = await dbRef.child(widget.foodKey).get();

    Map food = snapshot.value as Map;

    userNameController.text = food['title'];
    userAgeController.text = food['description'];
    userSalaryController.text = food['price'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Updating data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: 'Enter Food Title',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Enter Food Description',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userSalaryController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  hintText: 'Enter Food Price',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {

                  Map<String, String> foods = {
                    'title': userNameController.text,
                    'description': userAgeController.text,
                    'price': userSalaryController.text
                  };

                  dbRef.child(widget.foodKey).update(foods)
                      .then((value) => {
                    Navigator.pop(context)
                  });

                },
                child: const Text('Update Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}