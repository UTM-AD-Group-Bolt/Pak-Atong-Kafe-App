import 'package:flutter/material.dart';

class faqPage extends StatelessWidget {
  const faqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
// faqpHp (229:286)
      padding:  EdgeInsets.fromLTRB(13, 26.14, 13, 129),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xff21181b),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
// group3oQe (229:287)
            margin:  EdgeInsets.fromLTRB(0, 0, 0, 28.5),
            padding:  EdgeInsets.fromLTRB(20, 0, 20, 0),
            width:  double.infinity,
            height:  37.86,
            child:
            Container(
// autogroupjazysQW (NvmBtir9WJHZS1uHAPjaZY)
              width:  169,
              height:  27,
              child:
              Row(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children:  [
                  Container(
// vectorZo8 (229:289)
                    margin:  EdgeInsets.fromLTRB(0, 0.86, 110, 0),
                    child:
                    TextButton(
                      onPressed:  () {},
                      style:  TextButton.styleFrom (
                        padding:  EdgeInsets.zero,
                      ),
                      child:
                      Container(
                        width:  24,
                        height:  19.77,
                        child:
                        Image.network(
                          'https://www.firstbenefits.org/wp-content/uploads/2017/10/placeholder-1024x1024.png',
                          width:  24,
                          height:  19.77,
                        ),
                      ),
                    ),
                  ),
                  Center(
// faqCr6 (229:290)
                    child:
                    Text(
                      'Faq',
                      textAlign:  TextAlign.center,
                      style:  TextStyle (
                        fontSize:  20,
                        fontWeight:  FontWeight.w700,
                        height:  1.3025,
                        color:  Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
// manyofthequestionsyoumayhavewh (229:320)
            margin:  EdgeInsets.fromLTRB(0, 0, 20, 43.5),
            constraints:  BoxConstraints (
              maxWidth:  286,
            ),
            child:
            Text(
              'Many of the questions you may have while using this application.',
              style:  TextStyle (
                fontSize:  19,
                fontWeight:  FontWeight.w400,
                height:  1.3025,
                color:  Color(0xffffffff),
              ),
            ),
          ),
          Container(
// autogroupumyuGjU (NvmBFQazNifjd4R7adUmyU)
            margin:  EdgeInsets.fromLTRB(35, 0, 26, 35),
            padding:  EdgeInsets.fromLTRB(13, 5.5, 13, 5.5),
            width:  double.infinity,
            decoration:  BoxDecoration (
              color:  Color(0xfff2ab37),
              borderRadius:  BorderRadius.circular(7),
              boxShadow:  [
                BoxShadow(
                  color:  Color(0x26000000),
                  offset:  Offset(2, 2),
                  blurRadius:  0,
                ),
              ],
            ),
            child:
            Center(
              child:
              Text(
                'Log in & Sign Out',
                textAlign:  TextAlign.center,
                style:  TextStyle (
                  
                  fontSize:  19,
                  fontWeight:  FontWeight.w700,
                  height:  1.3025,
                  color:  Color(0xffffffff),
                ),
              ),
            ),
          ),
          Container(
// autogroupk6vxdyL (NvmBNzChCUercdSJb9K6Vx)
            margin:  EdgeInsets.fromLTRB(35, 0, 26, 35),
            padding:  EdgeInsets.fromLTRB(13.5, 5.5, 13.5, 5.5),
            width:  double.infinity,
            decoration:  BoxDecoration (
              color:  Color(0xfff2ab37),
              borderRadius:  BorderRadius.circular(7),
              boxShadow:  [
                BoxShadow(
                  color:  Color(0x26000000),
                  offset:  Offset(2, 2),
                  blurRadius:  0,
                ),
              ],
            ),
            child:
            Center(
              child:
              Text(
                'Delivery',
                textAlign:  TextAlign.center,
                style:  TextStyle (
                  fontSize:  19,
                  fontWeight:  FontWeight.w700,
                  height:  1.3025,
                  color:  Color(0xffffffff),
                ),
              ),
            ),
          ),
          Container(
// autogroupkpwkpnv (NvmBVQBg3p2RJRDvg3Kpwk)
            margin:  EdgeInsets.fromLTRB(35, 0, 26, 40),
            padding:  EdgeInsets.fromLTRB(14.5, 8.5, 14.5, 2.5),
            width:  double.infinity,
            decoration:  BoxDecoration (
              color:  Color(0xfff2ab37),
              borderRadius:  BorderRadius.circular(7),
              boxShadow:  [
                BoxShadow(
                  color:  Color(0x26000000),
                  offset:  Offset(2, 2),
                  blurRadius:  0,
                ),
              ],
            ),
            child:
            Center(
              child:
              Text(
                'Order & Food',
                textAlign:  TextAlign.center,
                style:  TextStyle (
                  fontSize:  19,
                  fontWeight:  FontWeight.w700,
                  height:  1.3025,
                  color:  Color(0xffffffff),
                ),
              ),
            ),
          ),
          Container(
// autogroup1kqq1sQ (NvmBc4fEkXF2mSr2Xa1kqQ)
            margin:  EdgeInsets.fromLTRB(35, 0, 26, 35),
            padding:  EdgeInsets.fromLTRB(15, 2.5, 15, 2.5),
            width:  double.infinity,
            height:  36,
            decoration:  BoxDecoration (
              color:  Color(0xfff2ab37),
              borderRadius:  BorderRadius.circular(7),
              boxShadow:  [
                BoxShadow(
                  color:  Color(0x26000000),
                  offset:  Offset(2, 2),
                  blurRadius:  0,
                ),
              ],
            ),
            child:
            Center(
              child:
              Text(
                'Check Out',
                textAlign:  TextAlign.center,
                style:  TextStyle (
                  fontSize:  19,
                  fontWeight:  FontWeight.w700,
                  height:  1.3025,
                  color:  Color(0xffffffff),
                ),
              ),
            ),
          ),
          Container(
// autogroupg6puNrN (NvmBhyf3u6vVtkxh5Cg6PU)
            margin:  EdgeInsets.fromLTRB(35, 0, 26, 0),
            padding:  EdgeInsets.fromLTRB(15, 5.5, 15, 5.5),
            width:  double.infinity,
            decoration:  BoxDecoration (
              color:  Color(0xfff2ab37),
              borderRadius:  BorderRadius.circular(7),
              boxShadow:  [
                BoxShadow(
                  color:  Color(0x26000000),
                  offset:  Offset(2, 2),
                  blurRadius:  0,
                ),
              ],
            ),
            child:
            Center(
              child:
              Text(
                'Payment',
                textAlign:  TextAlign.center,
                style:  TextStyle (
                  fontSize:  19,
                  fontWeight:  FontWeight.w700,
                  height:  1.3025,
                  color:  Color(0xffffffff),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


