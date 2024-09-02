import 'package:buku_bacaan_wajib_untuk_mahasiswa/book_data.dart';
import 'package:buku_bacaan_wajib_untuk_mahasiswa/details_page.dart';
import 'package:flutter/material.dart';
import 'reusables.dart' as reusables;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusables.appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 512) {
            return const BooksListView();
          } else {
            return BooksGridView(
              crossAxisCount: (constraints.maxWidth / 256).floor()
            );
          }
        }
      )
    );
  }
}

class BooksGridView extends StatelessWidget {
  final int crossAxisCount;

  const BooksGridView({
    super.key,
    this.crossAxisCount = 1
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: books.map((book) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsPage(book);
            }));
          },
          child: BookGridItem(book)
        );
      }).toList()
    );
  }
}

class BookGridItem extends StatelessWidget {
  final Book book;

  const BookGridItem(this.book, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        4.0
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 4.0
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(0.25),
                    blurRadius: 2.0,
                    spreadRadius: 2.0
                  )
                ]
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Hero(
                    tag: '${book.title} (${book.isbn}) cover',
                    child: Image.asset(
                      book.cover,
                      height: constraints.maxHeight,
                      width: constraints.maxHeight * 2 / 3,
                      fit: BoxFit.fill
                    )
                  );
                }
              ),
            ),
          ),
          const SizedBox(
            height: 8.0
          ),
          Text(
            book.title,
            style: const TextStyle(
              fontSize: 20.0,
              height: 1.25,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center
          ),
          const SizedBox(
            height: 8.0
          ),
          Text(
            book.author,
            style: const TextStyle(
              fontSize: 18.0,
              height: 1.2,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis
            ),
            softWrap: false,
            textAlign: TextAlign.center
          ),
          const SizedBox(
            height: 8.0
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                book.publicationDate,
                style: const TextStyle(
                  fontSize: 18.0,
                  height: 1.2,
                  fontWeight: FontWeight.w500
                )
              ),
              const SizedBox(
                width: 8.0
              ),
              const Icon(
                Icons.circle,
                size: 6.0
              ),
              const SizedBox(
                width: 8.0
              ),
              Text(
                book.genre,
                style: const TextStyle(
                  fontSize: 18.0,
                  height: 1.2,
                  fontWeight: FontWeight.w500
                )
              )
            ]
          )
        ]
      ),
    );
  }
}

class BooksListView extends StatelessWidget {
  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index <= 0) {
          return SizedBox(
            height: (reusables.divider.thickness ?? 0) >= (reusables.divider.height ?? 0) ? (reusables.divider.thickness ?? 0) : (reusables.divider.height ?? 0)
          );
        } else if (index >= books.length + 1) {
          return const SizedBox(
            height: 256,
          );
        }
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsPage(books[index - 1]);
            }));
          },
          child: BookListItem(books[index - 1], index: index)
        );
      },
      separatorBuilder: (context, index) {
        return reusables.divider;
      },
      itemCount: books.length + 2
    );
  }
}

class BookListItem extends StatelessWidget {
  static const double height = 200;
  final Book book;
  final int index;

  const BookListItem(this.book, {
    super.key,
    this.index = 0
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(0.25),
              blurRadius: 2.0,
              spreadRadius: 2.0
            )
          ]
        ),
        child: Hero(
          tag: '${book.title} (${book.isbn}) cover',
          child: Image.asset(
            book.cover,
            height: height,
            width: height * 2 / 3,
            fit: BoxFit.fill
          )
        )
      ),
      const SizedBox(
        width: 16.0,
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 20.0,
                height: 1.25,
                fontWeight: FontWeight.w600
              ),
              textAlign: index % 2 == 0 ? TextAlign.start : TextAlign.end
            ),
            const SizedBox(
              height: 12.0
            ),
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 18.0,
                height: 1.2,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis
              ),
              softWrap: false,
              textAlign: index % 2 == 0 ? TextAlign.start : TextAlign.end
            ),
            const SizedBox(
              height: 12.0
            ),
            Row(
              mainAxisAlignment: index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  book.publicationDate,
                  style: const TextStyle(
                    fontSize: 18.0,
                    height: 1.2,
                    fontWeight: FontWeight.w500
                  )
                ),
                const SizedBox(
                  width: 8.0
                ),
                const Icon(
                  Icons.circle,
                  size: 6.0
                ),
                const SizedBox(
                  width: 8.0
                ),
                Text(
                  book.genre,
                  style: const TextStyle(
                    fontSize: 18.0,
                    height: 1.2,
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )
          ]
        )
      )
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: index % 2 == 0 ? children.reversed.toList() : children
      )
    );
  }
}