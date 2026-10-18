import 'package:flutter/material.dart';

import '../models/book.dart';

class BookImage extends StatelessWidget {
  final Book book;
  final double width;

  const BookImage({super.key, required this.book, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      book.imagePath,
      width: width,
      // keep the same cover shape at both sizes
      height: width * 5 / 3,
      fit: BoxFit.cover,
    );
  }
}
