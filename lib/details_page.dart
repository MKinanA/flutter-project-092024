import 'package:buku_bacaan_wajib_untuk_mahasiswa/book_data.dart';
import 'package:flutter/material.dart';
import 'reusables.dart' as reusables;

class DetailsPage extends StatelessWidget {
  final Book book;

  const DetailsPage(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusables.appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 768) {
            return DetailsPageNarrow(book);
          } else {
            return DetailsPageWide(
              book,
              maxWidth: constraints.maxWidth
            );
          }
        }
      )
    );
  }
}

class DetailsPageWide extends StatelessWidget {
  final Book book;
  final double maxWidth;

  const DetailsPageWide(this.book, {
    super.key,
    this.maxWidth = 768
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: maxWidth / 20
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black).withOpacity(0.25),
                              blurRadius: 2.0,
                              spreadRadius: 2.0
                            )
                          ]
                        ),
                        child: InkWell(
                          onDoubleTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('ISBN: ${book.isbn}'),
                              )
                            );
                          },
                          child: Hero(
                            tag: '${book.title} (${book.isbn}) cover',
                            child: Image.asset(
                              book.cover,
                              height: constraints.maxWidth * 3 / 2,
                              width: constraints.maxWidth,
                              fit: BoxFit.fill
                            )
                          )
                        )
                      );
                    }
                  )
                ),
                const SizedBox(
                  width: 24.0
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 24.0,
                          height: 1.25,
                          fontWeight: FontWeight.w600
                        ),
                        textAlign: TextAlign.start
                      ),
                      const SizedBox(
                        height: 16.0
                      ),
                      Text(
                        book.author,
                        style: const TextStyle(
                          fontSize: 20.0,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis
                        ),
                        softWrap: false,
                        textAlign: TextAlign.start
                      ),
                      const SizedBox(
                        height: 16.0
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            book.rating.toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              height: 1.2,
                              fontWeight: FontWeight.w500
                            )
                          ),
                          const Icon(
                            Icons.star,
                            size: 18.0
                          )
                        ]
                      ),
                      const SizedBox(
                        height: 24.0
                      ),
                      Text(
                        book.synopsis,
                        style: const TextStyle(
                          fontSize: 20.0,
                          height: 1.25,
                          fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.justify
                      ),
                      const SizedBox(
                        height: 256,
                      )
                    ]
                  )
                )
              ]
            ),
            const SizedBox(
              height: 256.0
            )
          ]
        )
      )
    );
  }
}

class DetailsPageNarrow extends StatelessWidget {
  static const double height = 320;
  final Book book;

  const DetailsPageNarrow(this.book, {
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16.0
            ),
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
              child: InkWell(
                onDoubleTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('ISBN: ${book.isbn}'),
                    )
                  );
                },
                child: Hero(
                  tag: '${book.title} (${book.isbn}) cover',
                  child: Image.asset(
                    book.cover,
                    height: height,
                    width: height * 2 / 3,
                    fit: BoxFit.fill
                  )
                )
              )
            ),
            const SizedBox(
              height: 24.0
            ),
            Text(
              book.title,
              style: const TextStyle(
                fontSize: 24.0,
                height: 1.25,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center
            ),
            const SizedBox(
              height: 16.0
            ),
            Text(
              book.author,
              style: const TextStyle(
                fontSize: 20.0,
                height: 1.2,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis
              ),
              softWrap: false,
              textAlign: TextAlign.center
            ),
            const SizedBox(
              height: 16.0
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
                  book.rating.toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    height: 1.2,
                    fontWeight: FontWeight.w500
                  )
                ),
                const Icon(
                  Icons.star,
                  size: 18.0
                )
              ]
            ),
            const SizedBox(
              height: 24.0
            ),
            Text(
              book.synopsis,
              style: const TextStyle(
                fontSize: 20.0,
                height: 1.25,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.justify
            ),
            const SizedBox(
              height: 256,
            )
          ]
        )
      )
    );
  }
}