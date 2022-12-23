import 'Review.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final Function() submit;

  ReviewCard({required this.review, required this.submit});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB (16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all (12.0),
        )
    );
  }
}