import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/book_image.dart';
import '../cubit/home_cubit.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    // get the books and sort selection from the cubit
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club Home'),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                children: [
                  const Text(
                    'Sort by',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: const Text('Author'),
                    selected: cubit.sortType == SortType.author,
                    showCheckmark: false,
                    selectedColor: const Color(0xFFE8E2EC),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFCAC4D0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onSelected: (selected) {
                      cubit.sortBooks(SortType.author);
                    },
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: const Text('Title'),
                    selected: cubit.sortType == SortType.title,
                    showCheckmark: false,
                    selectedColor: const Color(0xFFE8E2EC),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFCAC4D0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onSelected: (selected) {
                      cubit.sortBooks(SortType.title);
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Books',
                style: TextStyle(fontSize: 28, height: 36 / 28),
              ),
            ),
            SizedBox(
              height: 100 * 5 / 3,
              // scroll the book covers sideways
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: cubit.bookList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  final book = cubit.bookList[index];
                  return GestureDetector(
                    // open this book when its cover is tapped
                    onTap: () {
                      cubit.showBook(book);
                    },
                    child: BookImage(book: book),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
