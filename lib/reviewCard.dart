import 'package:flutter/material.dart';
import 'review.dart';

class reviewCard extends StatelessWidget {
  final review Review;
  final Function() submit;

  reviewCard({required this.Review, required this.submit});

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