# db/seeds.rb

if Rails.env.development? || Rails.env.test?

  puts "Seeding genres..."

  genre_names = [
    "Fiction", "Dystopian", "Romance", "Adventure", "Fantasy", "Horror",
    "Science Fiction", "Historical Fiction", "Philosophical Fiction",
    "Non-Fiction", "Biography", "Self-Help", "Classic", "Epic", "Gothic Fiction",
    "Gothic Horror", "Mythology", "Gothic", "Gothic Romance", "Satire", "Poetry",
    "Magical Realism", "Literary Fiction", "African Literature", "Tragedy",
    "Mystery", "Thriller", "Supernatural", "Dark Fantasy", "Urban Fantasy",
    "Heist Fiction", "Family Saga", "Cyberpunk", "Tech Thriller", "War Fiction",
    "Young Adult", "Young Drama", "Allegorical", "Comedy", "Psychological Fiction",
    "Philosophical Fiction", "Coming-of-age", "Drama", "Bildungsroman", "Absurdist",
    "Post-Apocalyptic", "Vampire Fiction", "Post-Cyberpunk"
  ]

  # Create a default admin user for seeding
  user = User.first || User.create!(email: "admin@example.com", password: "password")

  genres = genre_names.map { |name| Genre.find_or_create_by!(name: name) }

  puts "Genres seeded!"
  puts "Seeding default books..."

  books = [
    { title: "To Kill a Mockingbird", author: "Harper Lee", genre_names: [ "Fiction" ], filename: "to_kill_a_mockingbird.jpg" },
    { title: "1984", author: "George Orwell", genre_names: [ "Dystopian", "Science Fiction", "Fiction" ], filename: "1984.jpg" },
    { title: "Pride and Prejudice", author: "Jane Austen", genre_names: [ "Romance", "Fiction" ], filename: "pride_and_prejudice.jpg" },
    { title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre_names: [ "Fiction" ], filename: "the_great_gatsby.jpg" },
    { title: "Moby-Dick", author: "Herman Melville", genre_names: [ "Adventure", "Fiction" ], filename: "moby_dick.jpg" },
    { title: "The Hobbit", author: "J.R.R Tolkien", genre_names: [ "Fantasy", "Adventure" ], filename: "The_Hobbit.jpg" },
    { title: "Little Women", author: "Louisa May Alcott", genre_names: [ "Classic", "Coming-of-age" ], filename: "Little_Women.jpg" },
    { title: "Jane Eyre", author: "Charlotte Bronte", genre_names: [ "Classic", "Gothic Romance" ], filename: "Jane_Eyre.jpg" },
    { title: "Wuthering Heights", author: "Emily Bronte", genre_names: [ "Classic", "Gothic Fiction" ], filename: "Wuthering_Heights.jpg" },
    { title: "The Catcher in the Rye", author: "J.D Salinger", genre_names: [ "Classic", "Coming-of-age" ], filename: "The_Catcher_in_the_Rye.jpg" },
    { title: "The Adventures of Huckleberry Finn", author: "Mark Twain", genre_names: [ "Classic", "Adventure" ], filename: "The_Adventures_of_Huckleberry_Finn.jpg" },
    { title: "The Adventures of Tom Sawyer", author: "Mark Twain", genre_names: [ "Classic", "Adventure" ], filename: "The_Adventures_of_Tom_Sawyer.jpg" },
    { title: "The Lord of The Rings", author: "J.R.R Tolkien", genre_names: [ "Fantasy", "Epic" ], filename: "The_Lord_of_The_Rings.jpg" },
    { title: "Animal Farm", author: "George Orwell", genre_names: [ "Satire", "Dystopian" ], filename: "Animal_farm.jpg" },
    { title: "Brave New World", author: "Aldous Huxley", genre_names: [ "Dystopian", "Science Fiction" ], filename: "Brave_New_World.jpg" },
    { title: "Fahrenheit 451", author: "Ray Bradbury", genre_names: [ "Dystopian", "Science Fiction" ], filename: "451.jpg" },
    { title: "Catch 22", author: "Joseph Heller", genre_names: [ "Satire", "War Fiction" ], filename: "Catch_22.jpg" },
    { title: "Crime and Punishment", author: "Fyodor Dostoevsky", genre_names: [ "Classic", "Psychological Fiction" ], filename: "Crime_and_Punishment.jpg" },
    { title: "The Brothers Karamazov", author: "Fyodor Dostoevsky", genre_names: [ "Classic", "Philosophical Fiction" ], filename: "The_Brothers_Karamazov.jpg" },
    { title: "War and Peace", author: "Leo Tolstoy", genre_names: [ "Classic", "Historical Fiction" ], filename: "War_and_Peace.jpg" },
    { title: "Anna Karenina", author: "Leo Tolstoy", genre_names: [ "Classic", "Romance" ], filename: "Anna_Karenina.jpg" },
    { title: "The Grapes of Wrath", author: "John Steinbeck", genre_names: [ "Classic", "Historical Fiction" ], filename: "The_Grapes_of_Wrath.jpg" },
    { title: "East of Eden", author: "John Steinbeck", genre_names: [ "Classic", "Family Saga" ], filename: "East_of_eden.jpg" },
    { title: "Great Expectations", author: "Charles Dickens", genre_names: [ "Classic", "Bildungsroman" ], filename: "Great_Expectations.jpg" },
    { title: "A Tale of Two Cities", author: "Charles Dickens", genre_names: [ "Classic", "Historical Fiction" ], filename: "A_Tale_of_Two_Cities.jpg" },
    { title: "David Copperfield", author: "Charles Dickens", genre_names: [ "Classic", "Bildungsroman" ], filename: "David_Copperfield.jpg" },
    { title: "Dracula", author: "Bram Stoker", genre_names: [ "Gothic Horror" ], filename: "Dracula.jpg" },
    { title: "Frankenstein", author: "Mary Shelley", genre_names: [ "Gothic Horror", "Science Fiction" ], filename: "Frankenstein.jpg" },
    { title: "The Picture of Dorian Gray", author: "Oscar Wilde", genre_names: [ "Gothic", "Philosophical Fiction" ], filename: "The_Picture_of_Dorian_Gray.jpg" },
    { title: "The Count of Monte Cristo", author: "Alexandre Dumas", genre_names: [ "Historical Fiction", "Adventure" ], filename: "The_Count_of_Monte_Cristo.jpg" },
    { title: "Les Misérables", author: "Victor Hugo", genre_names: [ "Historical Fiction", "Drama" ], filename: "Les_Miserables.jpg" },
    { title: "The Odyssey", author: "Homer", genre_names: [ "Epic", "Poetry" ], filename: "The_Odyssey.jpg" },
    { title: "The Iliad", author: "Homer", genre_names: [ "Epic", "Poetry" ], filename: "The_Iliad.jpg" },
    { title: "Don Quixote", author: "Miguel De Cervantes", genre_names: [ "Classic", "Satire", "Adventure" ], filename: "Don_Quixote.jpg" },
    { title: "One Hundred Years of Solitude", author: "Gabriel García Márquez", genre_names: [ "Magical Realism", "Literary Fiction" ], filename: "One_Hundred_Years_of_solitude.jpg" },
    { title: "Beloved", author: "Toni Morrison", genre_names: [ "Historical Fiction", "Magical Realism" ], filename: "Beloved.jpg" },
    { title: "Things Fall Apart", author: "Chinua Achebe", genre_names: [ "Historical Fiction", "African Literature" ], filename: "Things_Fall_Apart.jpg" },
    { title: "The Old Man and the Sea", author: "Ernest Hemingway", genre_names: [ "Classic", "Adventure" ], filename: "The_Old_Man_and_the_Sea.jpg" },
    { title: "Of Mice and Men", author: "John Steinbeck", genre_names: [ "Classic", "Tragedy" ], filename: "Of_Mice_and_Men.jpg" },
    { title: "The Scarlet Letter", author: "Nathaniel Hawthorne", genre_names: [ "Classic", "Historical Fiction" ], filename: "The_Scarlet_Letter.jpg" },
    { title: "The Stranger", author: "Albert Camus", genre_names: [ "Philosophical Fiction", "Absurdist" ], filename: "The_Stranger.jpg" },
    { title: "Lord of the Flies", author: "William Golding", genre_names: [ "Allegorical", "Dystopian" ], filename: "Lord_of_the_Flies.jpg" },
    { title: "A Clockwork Orange", author: "Anthony Burgess", genre_names: [ "Dystopian", "Satire" ], filename: "A_Clockwork_Orange.jpg" },
    { title: "The Bell Jar", author: "Sylvia Plath", genre_names: [ "Psychological Fiction", "Classic" ], filename: "The_Bell_Jar.jpg" },
    { title: "Slaughterhouse-Five", author: "Kurt Vonnegut", genre_names: [ "Science Fiction", "Satire", "War Fiction" ], filename: "Slaughterhouse_five.jpg" },
    { title: "Heart of Darkness", author: "Joseph Conrad", genre_names: [ "Classic", "Psychological Fiction", "Adventure" ], filename: "Heart_of_Darkness.jpg" },
    { title: "The Sun Also Rises", author: "Ernest Hemingway", genre_names: [ "Classic", "Literary Fiction" ], filename: "The_Sun_Also_Rises.jpg" },
    { title: "Rebecca", author: "Daphne du Maurier", genre_names: [ "Gothic", "Mystery", "Romance" ], filename: "Rebecca.jpg" },
    { title: "The Handmaid's Tale", author: "Margaret Atwood", genre_names: [ "Post-Apocalyptic", "Literary Fiction" ], filename: "The_Handmaids_Tale.jpg" },
    { title: "The Alchemist", author: "Paulo Coelho", genre_names: [ "Adventure", "Philosophical Fiction" ], filename: "The_Alchemist.jpg" },
    { title: "Life of Pi", author: "Yann Martel", genre_names: [ "Historical Fiction", "Drama" ], filename: "Life_of_Pi.jpg" },
    { title: "The Kite Runner", author: "Khaled Hosseini", genre_names: [ "Historical Fiction", "Drama" ], filename: "The_Kite_Runner.jpg" },
    { title: "A Thousand Splendid Suns", author: "Khaled Hosseini", genre_names: [ "Historical Fiction", "Young Drama" ], filename: "A_Thousand_Splendid_Suns.jpg" },
    { title: "The Book Thief", author: "Markus Zusak", genre_names: [ "Historical Fiction", "Young Adult" ], filename: "The_Book_Thief.jpg" },
    { title: "The Shadow of the Wind", author: "Carlos Ruiz Zafón", genre_names: [ "Mystery", "Historical Fiction" ], filename: "The_Shadow_of_the_wind.jpg" },
    { title: "The Name of the Wind", author: "Patrick Rothfuss", genre_names: [ "Fantasy", "Epic" ], filename: "The_Name_of_the_wind.jpg" },
    { title: "The Wise Man's Fear", author: "Patrick Rothfuss", genre_names: [ "Fantasy", "Epic" ], filename: "The_Wise_Mans_Fear.jpg" },
    { title: "Mistborn: The Final Empire", author: "Brandon Sanderson", genre_names: [ "Fantasy", "Epic" ], filename: "Mistborn_The_Final_Empire.jpg" },
    { title: "The Well of Ascension", author: "Brandon Sanderson", genre_names: [ "Fantasy", "Epic" ], filename: "The_Well_of_Ascension.jpg" },
    { title: "The Way of Kings", author: "Brandon Sanderson", genre_names: [ "Fantasy", "Epic" ], filename: "The_Way_of_Kings.jpg" },
    { title: "Dune", author: "Frank Herbert", genre_names: [ "Science Fiction", "Epic" ], filename: "Dune.jpg" },
    { title: "Neuromancer", author: "William Gibson", genre_names: [ "Cyberpunk", "Science Fiction" ], filename: "Neuromancer.jpg" },
    { title: "Snow Crash", author: "Neal Stephenson", genre_names: [ "Cyberpunk", "Science Fiction" ], filename: "Snow_Crash.jpg" },
    { title: "The Diamond Age", author: "Neal Stephenson", genre_names: [ "Science Fiction", "Post-Cyberpunk" ], filename: "The_Diamond_Age.jpg" },
    { title: "Cryptonomicon", author: "Neal Stephenson", genre_names: [ "Historical Fiction", "Tech Thriller" ], filename: "Cryptonomicon.jpg" },
    { title: "It", author: "Stephen King", genre_names: [ "Horror", "Thriller" ], filename: "It.jpg" },
    { title: "Salem's Lot", author: "Stephen King", genre_names: [ "Horror", "Vampire Fiction" ], filename: "Salems_Lot.jpg" },
    { title: "Doctor Sleep", author: "Stephen King", genre_names: [ "Horror", "Supernatural" ], filename: "Doctor_Sleep.jpg" },
    { title: "American Gods", author: "Neil Gaiman", genre_names: [ "Fantasy", "Mythology" ], filename: "American_Gods.jpg" },
    { title: "Coraline", author: "Neil Gaiman", genre_names: [ "Fantasy", "Dark Fantasy" ], filename: "Coraline.jpg" },
    { title: "Neverwhere", author: "Neil Gaiman", genre_names: [ "Fantasy", "Urban Fantasy" ], filename: "Neverwhere.jpg" },
    { title: "The Lies of Locke Lamora", author: "Scott Lynch", genre_names: [ "Fantasy", "Heist Fiction" ], filename: "The_Lies_of_Locke_Lamora.jpg" },
    { title: "Demian", author: "Hermann Hesse", genre_names: [ "Philosophical Fiction", "Classic" ], filename: "Demian.jpg" }
  ]

  books.each do |attrs|
    book = Book.find_or_create_by!(
      title: attrs[:title],
      author: attrs[:author],
      user: user
    ) do |b|
      b.average_rating = rand(1..5)
      b.review = "There is not a review for this book, feel free to add one!"
    end

    # Assign genres
    book.genres = Genre.where(name: attrs[:genre_names])

    # Attach cover image if missing
    unless book.cover_image.attached?
      image_path = Rails.root.join("db", "seed_images", attrs[:filename])

      if File.exist?(image_path)
        book.cover_image.attach(io: File.open(image_path), filename: attrs[:filename])
        puts "✓Attached #{attrs[:filename]} to #{book.title}"
      else
        puts " Missing file: #{image_path}"
      end
    end
  end

  puts "Default books seeded!"
end
