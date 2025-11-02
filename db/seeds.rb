# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
books = [
  { title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction" },
  { title: "1984", author: "George Orwell", genre: "Dystopian" },
  { title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance" },
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Fiction" },
  { title: "Moby-Dick", author: "Herman Melville", genre: "Adventure" },
  { title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Fiction" },
  { title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy" },
  { title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy" },
  { title: "Fahrenheit 451", author: "Ray Bradbury", genre: "Dystopian" },
  { title: "Brave New World", author: "Aldous Huxley", genre: "Science Fiction" },
  { title: "The Grapes of Wrath", author: "John Steinbeck", genre: "Historical Fiction" },
  { title: "Crime and Punishment", author: "Fyodor Dostoevsky", genre: "Philosophical Fiction" },
  { title: "Jane Eyre", author: "Charlotte Brontë", genre: "Romance" },
  { title: "Wuthering Heights", author: "Emily Brontë", genre: "Romance" },
  { title: "The Odyssey", author: "Homer", genre: "Epic Poetry" },
  { title: "The Iliad", author: "Homer", genre: "Epic Poetry" },
  { title: "The Picture of Dorian Gray", author: "Oscar Wilde", genre: "Philosophical Fiction" },
  { title: "Dracula", author: "Bram Stoker", genre: "Horror" },
  { title: "Frankenstein", author: "Mary Shelley", genre: "Science Fiction" },
  { title: "Les Misérables", author: "Victor Hugo", genre: "Historical Fiction" },
  { title: "War and Peace", author: "Leo Tolstoy", genre: "Historical Fiction" },
  { title: "The Alchemist", author: "Paulo Coelho", genre: "Adventure" },
  { title: "The Chronicles of Narnia", author: "C.S. Lewis", genre: "Fantasy" },
  { title: "The Kite Runner", author: "Khaled Hosseini", genre: "Drama" },
  { title: "The Hunger Games", author: "Suzanne Collins", genre: "Dystopian" },
  { title: "Harry Potter and the Sorcerer’s Stone", author: "J.K. Rowling", genre: "Fantasy" },
  { title: "The Da Vinci Code", author: "Dan Brown", genre: "Thriller" },
  { title: "The Fault in Our Stars", author: "John Green", genre: "Young Adult" },
  { title: "The Shining", author: "Stephen King", genre: "Horror" },
  { title: "It", author: "Stephen King", genre: "Horror" },
  { title: "Gone Girl", author: "Gillian Flynn", genre: "Thriller" },
  { title: "The Book Thief", author: "Markus Zusak", genre: "Historical Fiction" },
  { title: "Life of Pi", author: "Yann Martel", genre: "Adventure" },
  { title: "The Road", author: "Cormac McCarthy", genre: "Post-Apocalyptic" },
  { title: "A Game of Thrones", author: "George R.R. Martin", genre: "Fantasy" },
  { title: "The Handmaid’s Tale", author: "Margaret Atwood", genre: "Dystopian" },
  { title: "Beloved", author: "Toni Morrison", genre: "Historical Fiction" },
  { title: "The Color Purple", author: "Alice Walker", genre: "Historical Fiction" },
  { title: "Slaughterhouse-Five", author: "Kurt Vonnegut", genre: "Science Fiction" },
  { title: "Catch-22", author: "Joseph Heller", genre: "Satire" },
  { title: "Don Quixote", author: "Miguel de Cervantes", genre: "Adventure" },
  { title: "The Divine Comedy", author: "Dante Alighieri", genre: "Epic Poetry" },
  { title: "The Stranger", author: "Albert Camus", genre: "Philosophical Fiction" },
  { title: "The Old Man and the Sea", author: "Ernest Hemingway", genre: "Fiction" },
  { title: "Of Mice and Men", author: "John Steinbeck", genre: "Fiction" },
  { title: "Animal Farm", author: "George Orwell", genre: "Satire" },
  { title: "The Metamorphosis", author: "Franz Kafka", genre: "Absurdist Fiction" },
  { title: "A Tale of Two Cities", author: "Charles Dickens", genre: "Historical Fiction" },
  { title: "Great Expectations", author: "Charles Dickens", genre: "Fiction" }
]
books.each do |book| 
    Book.find_or_create_by!(
        title: book[:title],
        author: book[:author],
        genre: book[:genre]
    ) do |b|
        b.rating = rand(1..5)
        b.review = "There is not a review for this book, feel free to add one!"
    end
end