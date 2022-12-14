import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super (key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        centerTitle: true,
        backgroundColor: const Color(0xff2b2b2b),
      ),
    );
  }
}

@override
Widget build (BuildContext context) {
  return Container(
    width: 360,
    height: 640,
    color: const Color(0xff21181b),
    padding: const EdgeInsets.only(top: 27, bottom: 37, ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        SizedBox(
          width: 335,
          height: 35,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              Transform.rotate(
                angle: -3.14,
                child: Container(
                  width: 24,
                  height: 19.77,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xfff2ab37),
                  ),
                ),
              ),
              const SizedBox(height: 325.48),
              const SizedBox(
                width: 159,
                height: 25.28,
                child: Text(
                  "Review",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "DM Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 325.48),
              Container(
                width: 335,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff3d3d3d), width: 1, ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1.50),
        SizedBox(
          width: 335,
          height: 35,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Transform.rotate(
                angle: -3.14,
                child: Container(
                  width: 24,
                  height: 19.77,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xfff2ab37),
                  ),
                ),
              ),
              const SizedBox(height: 676.23),
              Container(
                width: 335,
                height: 2,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff3d3d3d), width: 1, ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1.50),
        SizedBox(
          width: 290,
          height: 503,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              const Text(
                "Order Completed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "DM Sans",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 39),
              const SizedBox(
                width: 162,
                child: Text(
                  "Please give your rate.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 39),
              Container(
                width: 290,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(left: 22, right: 106, top: 24, bottom: 95, ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    SizedBox(
                      width: 162,
                      child: Text(
                        "Write feedback...",
                        style: TextStyle(
                          color: Color(0xff898989),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 39),
              const SizedBox(
                width: 228,
                height: 48,
                child: FlutterLogo(size: 48),
              ),
              const SizedBox(height: 39),
              Container(
                width: 176,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 0,
                      offset: Offset(2, 2),
                    ),
                  ],
                  color: const Color(0xfff2ab37),
                ),
                padding: const EdgeInsets.only(left: 12, right: 13, top: 12, bottom: 11, ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:const [
                    SizedBox(
                      width: 151,
                      height: 24,
                      child: Text(
                        "Send Feedback",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: "DM Sans",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 39),
              const SizedBox(
                width: 290,
                child: Text(
                  "Copyright | Bolts 2022",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffaf5d8),
                    fontSize: 16,
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