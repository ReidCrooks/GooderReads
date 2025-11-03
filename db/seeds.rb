# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Rails.env.development? || Rails.env.test?
  if Book.count.zero?
    puts "Seeding default books..."

    books = [
      { title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", cover_file: "to_kill_a_mockingbird.jpg" },
      { title: "1984", author: "George Orwell", genre: "Dystopian", cover_file: "1984.jpg" },
      { title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", cover_file: "pride_and_prejudice.jpg" },
      { title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Fiction", cover_file: "the_great_gatsby.jpg" },
      { title: "Moby-Dick", author: "Herman Melville", genre: "Adventure", cover_file: "moby_dick.jpg" },
      { title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Fiction", cover_file: "the_catcher_in_the_rye.jpg" },
      { title: "The Lord of the Rings", author: "J.R.R. Tolkien", genre: "Fantasy", cover_file: "the_lord_of_the_rings.jpg" },
      { title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", cover_file: "the_hobbit.jpg" },
      { title: "Fahrenheit 451", author: "Ray Bradbury", genre: "Dystopian", cover_file: "fahrenheit_451.jpg" },
      { title: "Brave New World", author: "Aldous Huxley", genre: "Science Fiction", cover_file: "brave_new_world.jpg" },
      { title: "The Grapes of Wrath", author: "John Steinbeck", genre: "Historical Fiction", cover_file: "the_grapes_of_wrath.jpg" },
      { title: "Crime and Punishment", author: "Fyodor Dostoevsky", genre: "Philosophical Fiction", cover_file: "crime_and_punishment.jpg" },
      { title: "Jane Eyre", author: "Charlotte Brontë", genre: "Romance", cover_file: "jane_eyre.jpg" },
      { title: "Wuthering Heights", author: "Emily Brontë", genre: "Romance", cover_file: "wuthering_heights.jpg" },
      { title: "The Odyssey", author: "Homer", genre: "Epic Poetry", cover_file: "the_odyssey.jpg" },
      { title: "The Iliad", author: "Homer", genre: "Epic Poetry", cover_file: "the_iliad.jpg" },
      { title: "The Picture of Dorian Gray", author: "Oscar Wilde", genre: "Philosophical Fiction", cover_file: "the_picture_of_dorian_gray.jpg" },
      { title: "Dracula", author: "Bram Stoker", genre: "Horror", cover_file: "dracula.jpg" },
      { title: "Frankenstein", author: "Mary Shelley", genre: "Science Fiction", cover_file: "frankenstein.jpg" },
      { title: "Les Misérables", author: "Victor Hugo", genre: "Historical Fiction", cover_file: "les_miserables.jpg" },
      { title: "War and Peace", author: "Leo Tolstoy", genre: "Historical Fiction", cover_file: "war_and_peace.jpg" },
      { title: "The Alchemist", author: "Paulo Coelho", genre: "Adventure", cover_file: "the_alchemist.jpg" },
      { title: "The Chronicles of Narnia", author: "C.S. Lewis", genre: "Fantasy", cover_file: "the_chronicles_of_narnia.jpg" },
      { title: "The Kite Runner", author: "Khaled Hosseini", genre: "Drama", cover_file: "the_kite_runner.jpg" },
      { title: "The Hunger Games", author: "Suzanne Collins", genre: "Dystopian", cover_file: "the_hunger_games.jpg" },
      { title: "Harry Potter and the Sorcerer’s Stone", author: "J.K. Rowling", genre: "Fantasy", cover_file: "harry_potter_and_the_sorcerers_stone.jpg" },
      { title: "The Da Vinci Code", author: "Dan Brown", genre: "Thriller", cover_file: "the_da_vinci_code.jpg" },
      { title: "The Fault in Our Stars", author: "John Green", genre: "Young Adult", cover_file: "the_fault_in_our_stars.jpg" },
      { title: "The Shining", author: "Stephen King", genre: "Horror", cover_file: "the_shining.jpg" },
      { title: "It", author: "Stephen King", genre: "Horror", cover_file: "it.jpg" },
      { title: "Gone Girl", author: "Gillian Flynn", genre: "Thriller", cover_file: "gone_girl.jpg" },
      { title: "The Book Thief", author: "Markus Zusak", genre: "Historical Fiction", cover_file: "the_book_thief.jpg" },
      { title: "Life of Pi", author: "Yann Martel", genre: "Adventure", cover_file: "life_of_pi.jpg" },
      { title: "The Road", author: "Cormac McCarthy", genre: "Post-Apocalyptic", cover_file: "the_road.jpg" },
      { title: "A Game of Thrones", author: "George R.R. Martin", genre: "Fantasy", cover_file: "a_game_of_thrones.jpg" },
      { title: "The Handmaid’s Tale", author: "Margaret Atwood", genre: "Dystopian", cover_file: "the_handmaids_tale.jpg" },
      { title: "Beloved", author: "Toni Morrison", genre: "Historical Fiction", cover_file: "beloved.jpg" },
      { title: "The Color Purple", author: "Alice Walker", genre: "Historical Fiction", cover_file: "the_color_purple.jpg" },
      { title: "Slaughterhouse-Five", author: "Kurt Vonnegut", genre: "Science Fiction", cover_file: "slaughterhouse_five.jpg" },
      { title: "Catch-22", author: "Joseph Heller", genre: "Satire", cover_file: "catch_22.jpg" },
      { title: "Don Quixote", author: "Miguel de Cervantes", genre: "Adventure", cover_file: "don_quixote.jpg" },
      { title: "The Divine Comedy", author: "Dante Alighieri", genre: "Epic Poetry", cover_file: "the_divine_comedy.jpg" },
      { title: "The Stranger", author: "Albert Camus", genre: "Philosophical Fiction", cover_file: "the_stranger.jpg" },
      { title: "The Old Man and the Sea", author: "Ernest Hemingway", genre: "Fiction", cover_file: "the_old_man_and_the_sea.jpg" },
      { title: "Of Mice and Men", author: "John Steinbeck", genre: "Fiction", cover_file: "of_mice_and_men.jpg" },
      { title: "Animal Farm", author: "George Orwell", genre: "Satire", cover_file: "animal_farm.jpg" },
      { title: "The Metamorphosis", author: "Franz Kafka", genre: "Absurdist Fiction", cover_file: "the_metamorphosis.jpg" },
      { title: "A Tale of Two Cities", author: "Charles Dickens", genre: "Historical Fiction", cover_file: "a_tale_of_two_cities.jpg" },
      { title: "Great Expectations", author: "Charles Dickens", genre: "Fiction", cover_file: "great_expectations.jpg" }
    ]

    books.each do |book|
      book_record = Book.find_or_create_by!(
        title: book[:title],
        author: book[:author],
        genre: book[:genre],
        cover_file: book[:cover_file]
      ) do |b|
        b.rating = rand(1..5)
        b.review = "There is not a review for this book, feel free to add one!"
      end

      unless book_record.cover_file.attached?
        cover_image_path = Rails.root.join('public', 'images', book[:cover_file])
        book_record.cover_file.attach(io: File.open(cover_image_path), filename: book[:cover_file])
      end
    end

    puts "Default books seeded!"
  end
end
