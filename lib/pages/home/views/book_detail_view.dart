import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/book.dart';
import '../../../widgets/book_information.dart';
import '../cubit/home_cubit.dart';

class BookDetailView extends StatelessWidget {
  final Book book;
  const BookDetailView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'),
        leading: IconButton(
          tooltip: 'Back to books',
          icon: const Icon(Icons.arrow_back),
          // return to the list through the cubit
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).showBookList();
          },
        ),
      ),
      body: SingleChildScrollView(child: BookInformation(book: book)),
    );
  }
}
