import 'package:flutter/material.dart';

class MenuDetailsPage extends StatefulWidget {
  final int index;
  final String image, name, time, availability;

  MenuDetailsPage(this.index, this.image, this.name, this.time,
      this.availability);

  @override
  State<MenuDetailsPage> createState() => _MenuDetailsPageState();
}

class _MenuDetailsPageState extends State<MenuDetailsPage> {
  @override
  void initState() {
    super.initState();
    print(
        "index: ${widget.index}, image: ${widget.image}, name: ${widget
            .name}, time: ${widget.time}, availability: ${widget
            .availability}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2b2b),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 48.0,
              bottom: 0.0,
              left: 16.0,
              right: 32.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          Image.asset(
            widget.image,
            height: 250.0,
            width: 250.0,
            fit: BoxFit.contain,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 28.0),
            height: 455.0,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Column(
              children: [
              Container(
              height: 4.0,
              width: 28.0,
              margin: EdgeInsets.only(bottom: 28.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.delivery_dining,
                      size: 30,
                      color: Colors.amber,
                    ),
                    Text(
                      "Free",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.more_time,
                      size: 30,
                      color: Colors.amber,
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.amber,
                    ),
                    Text(
                      widget.availability,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: 52.0),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),

              SizedBox(height: 10.0),
              Text(
                'Diperbuat daripada ayam',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),

              ),
                SizedBox(height: 84.0),

                Container(
                  height: 60,
                  width: 120,
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                    ),
                  ),

                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.0),
                      topRight: Radius.circular(2.0),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
