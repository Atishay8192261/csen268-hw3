import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';
import 'views/book_detail_view.dart';
import 'views/book_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create the cubit and load the books
      create: (context) {
        final cubit = HomeCubit();
        cubit.init();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // choose the view from the current state
          switch (state) {
            case BookList _:
              // create the view again so the chips update
              return BookListView();
            case BookDetail detail:
              return BookDetailView(book: detail.book);
          }
        },
      ),
    );
  }
}
