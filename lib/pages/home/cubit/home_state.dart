part of 'home_cubit.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

// a new state allows the list to rebuild
class BookList extends HomeState {}

class BookDetail extends HomeState {
  final Book book;
  BookDetail(this.book);
}
