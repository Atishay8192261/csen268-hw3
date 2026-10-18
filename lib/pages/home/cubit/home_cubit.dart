import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/book.dart';

part 'home_state.dart';

enum SortType { author, title }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // start with an empty list
  List<Book> bookList = [];
  SortType sortType = SortType.author;

  void init() {
    // load the sample books
    const description =
        'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.';
    bookList = [
      Book(
        title: 'Carmer and Grit',
        author: 'Sarah Jean Horwitz',
        description: description,
        imagePath: 'assets/books/book-1.png',
      ),
      Book(
        title: 'Little Gods',
        author: 'Meng Jin',
        description: description,
        imagePath: 'assets/books/book-2.png',
      ),
      Book(
        title: 'A Clockwork Orange',
        author: 'Anthony Burgess',
        description: description,
        imagePath: 'assets/books/book-3.png',
      ),
      Book(
        title: 'The Imperfections of Memory',
        author: 'Angelina Aludo',
        description: description,
        imagePath: 'assets/books/book-4.png',
      ),
      Book(
        title: 'James and the Giant Peach',
        author: 'Roald Dahl',
        description: description,
        imagePath: 'assets/books/book-5.png',
      ),
      Book(
        title: 'Big Deal',
        author: 'Hisham Al Gurg',
        description: description,
        imagePath: 'assets/books/book-6.png',
      ),
      Book(
        title: 'Don\'t Look Back',
        author: 'Isaac Nelson',
        description: description,
        imagePath: 'assets/books/book-7.png',
      ),
    ];
    sortBooks(SortType.author);
  }

  void sortBooks(SortType type) {
    sortType = type;
    // sort the same list by the selected field
    if (type == SortType.author) {
      bookList.sort((a, b) {
        return a.author.compareTo(b.author);
      });
    } else {
      bookList.sort((a, b) {
        return a.title.compareTo(b.title);
      });
    }
    // rebuild the list after sorting
    emit(BookList());
  }

  // pass the selected book to the detail view
  void showBook(Book book) {
    emit(BookDetail(book));
  }

  // keep the selected sort when going back
  void showBookList() {
    emit(BookList());
  }
}
