import 'package:flutter/material.dart';
import 'review.dart';

// ignore: camel_case_types
class reviewCard extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final review Review;
  final Function() submit;

  // ignore: non_constant_identifier_names
  const reviewCard({required this.Review, required this.submit});

  @override
  Widget build(BuildContext context) {
    return const Card(
        margin: EdgeInsets.fromLTRB (16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: EdgeInsets.all (12.0),
        )
    );
  }
}