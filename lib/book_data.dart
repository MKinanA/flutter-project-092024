class Book {
  String title;
  String author;
  String cover;
  String publicationDate;
  String isbn;
  String synopsis;
  String genre;
  double rating;
  Book({
    required this.title,
    required this.author,
    required this.cover,
    required this.publicationDate,
    this.isbn = '',
    required this.synopsis,
    required this.genre,
    this.rating = 0.0
  });
}

List<Book> books = [
  Book(
    title: "How to Win Friends and Influence People",
    author: "Dale Carnegie",
    cover: "assets/0.jpg",
    publicationDate: "1936",
    isbn: "9780671027032",
    synopsis: "This classic self-help book teaches the principles of effective communication and interpersonal relationships, offering timeless advice on how to connect with others in both professional and social settings.",
    genre: "Self-Help",
    rating: 4.7,
  ),
  Book(
    title: "Sapiens: A Brief History of Humankind",
    author: "Yuval Noah Harari",
    cover: "assets/1.jpg",
    publicationDate: "2011",
    isbn: "9780062316097",
    synopsis: "A broad exploration of human history that examines how Homo sapiens became the dominant species on Earth, from the Cognitive Revolution to the present day.",
    genre: "History",
    rating: 4.6,
  ),
  Book(
    title: "Atomic Habits",
    author: "James Clear",
    cover: "assets/2.jpg",
    publicationDate: "2018",
    isbn: "9780735211292",
    synopsis: "A practical guide that demonstrates how small, consistent habits can lead to significant personal growth and achievement, emphasizing the power of incremental changes.",
    genre: "Self-Help",
    rating: 4.8,
  ),
  Book(
    title: "Thinking, Fast and Slow",
    author: "Daniel Kahneman",
    cover: "assets/3.jpg",
    publicationDate: "2011",
    isbn: "9780374275631",
    synopsis: "An in-depth analysis of human thinking, dividing our thought processes into two systems: the fast, intuitive System 1 and the slow, deliberate System 2, and how these affect our decision-making.",
    genre: "Psychology",
    rating: 4.7,
  ),
  Book(
    title: "The 7 Habits of Highly Effective People",
    author: "Stephen R. Covey",
    cover: "assets/4.jpg",
    publicationDate: "1989",
    isbn: "9780743269513",
    synopsis: "A guide that presents seven fundamental habits for personal and professional effectiveness, offering a principle-centered approach to problem-solving and productivity.",
    genre: "Self-Help",
    rating: 4.6,
  ),
  Book(
    title: "Man’s Search for Meaning",
    author: "Viktor E. Frankl",
    cover: "assets/5.jpg",
    publicationDate: "1946",
    isbn: "9780807014295",
    synopsis: "A profound exploration of the human pursuit of meaning, drawing on Frankl's experiences in Nazi concentration camps to illustrate the power of purpose in overcoming adversity.",
    genre: "Memoir",
    rating: 4.8,
  ),
  Book(
    title: "The Lean Startup",
    author: "Eric Ries",
    cover: "assets/6.jpg",
    publicationDate: "2011",
    isbn: "9780307887894",
    synopsis: "A must-read for aspiring entrepreneurs, this book outlines a methodical approach to launching and managing a successful startup, focusing on efficiency and adaptability.",
    genre: "Business",
    rating: 4.5,
  ),
  Book(
    title: "Pedagogy of the Oppressed",
    author: "Paulo Freire",
    cover: "assets/7.jpg",
    publicationDate: "1968",
    isbn: "9780826412768",
    synopsis: "A seminal work in education, this book challenges traditional teaching methods and advocates for a pedagogy that empowers and liberates the oppressed through critical consciousness.",
    genre: "Education",
    rating: 4.6,
  )
];