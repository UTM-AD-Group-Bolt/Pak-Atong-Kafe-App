import 'package:flutter/material.dart';
import 'package:myapp/reviewCard.dart';

class reviewPage extends StatelessWidget {
  const reviewPage ({Key? key}) : super (key: key);
}

class _reviewPage extends StatefulWidget {
  @override
  _reviewPageState createState() => _reviewPageState();
}

class _reviewPageState extends State<_reviewPage>
double rating = 0;

@override
Widget build (BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Review'),
      centerTitle: true,
      backgroundColor: Color(0xff2b2b2b),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment;
        children: [
        Text (
        'Rating; $rating',
        style: TextStyle(fontSize: 40),
      ),
      const SizedBox(height: 32),
      buildRating(),
      const SizedBox (height: 32),
      TextButton(
        child: Text(
          'Show Dialog',
          style: TextStyle(fontSize: 32),
        ),
        onPressed: () => showRating(),
      )],
    ),
  ),);
}

  Widget buildRating () => RatingBar.builder (
    initialRating: rating,
    minRating: 1,
    itemSize: 46,
    itemPadding: EdgeInsets.symmetric(horizontal: 4),
    itemBuilder: (context, _) => Icon (Icons.star, color: Colors.amber),
    updateOnDrag: true,
    onRatingUpdate: (rating) => setState((){
      this.rating = rating;
    }),
  );

void showRating() =>showDialog(
    context: context,
    builder: (context) => AlertDialog(),
    title: const Text('Rate Your Food'),
    content: Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Please Leave a Star Rating.',
          style: TextStyle (fontSize: 20),
        ),
        const SizedBox (height: 32),
        buildRating(),
      ],
    ),
  actions: [
      TextButton (
        child: Text(
        'OK',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () => Navigator.pop(context)
      ),
    ],
  );
