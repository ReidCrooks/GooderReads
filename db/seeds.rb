# db/seeds.rb

if Rails.env.development? || Rails.env.test?


  puts "Seeding genres..."

  genre_names = [
    "Fiction",
    "Dystopian",
    "Romance",
    "Adventure",
    "Fantasy",
    "Horror",
    "Science Fiction",
    "Historical Fiction",
    "Philosophical Fiction",
    "Non-Fiction",
    "Biography",
    "Self-Help"
    "Coming-of-age"
  ]

  genres = genre_names.map do |name|
    Genre.find_or_create_by!(name: name)
  end

  puts "Genres seeded!"


  puts "Seeding default books..."

  books = [
    {
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      genre_names: [ "Fiction" ],
      filename: "to_kill_a_mockingbird.jpg"
    },
    {
      title: "1984",
      author: "George Orwell",
      genre_names: [ "Dystopian", "Science Fiction", "Fiction" ],
      filename: "1984.jpg"
    },
    {
      title: "Pride and Prejudice",
      author: "Jane Austen",
      genre_names:[ "Romance", "Fiction" ],
      filename: "pride_and_prejudice.jpg"
    },
    {
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      genre_names: [ "Fiction" ],
      filename: "the_great_gatsby.jpg"
    },
    {
      title: "Moby-Dick",
      author: "Herman Melville",
      genre_names: [ "Adventure", "Fiction" ],
      filename: "moby_dick.jpg"
    }
    {
      title: "The Hobbit"
      author: "J.R.R Tolkien"
      genre_names: ["Fantasy", "Adventure"]
      filename: "The_Hobbit.jpg"
    }
    {
      title: "Little Women"
      author: "Louisa May Alcott"
      genre_names: ["Classic", "Coming-of-age"]
      filename: "Little_Women.jpg"
    }
    {
      title: "Jane Eyre"
      author: "Charlotte Bronte"
      genre_names: ["Classic", "Gothic Romance"]
      filename: "Jane_Eyre.jpg"
    }
    {
      title: "Wuthering Heights"
      author: "Emily Bronte"
      genre_names: ["Classic", "Gothic Fiction"]
      filename: "Wuthering_Heights.jpg"
    }
     {
      title: "The Catcher in the Rye"
      author: "J.D Salinger"
      genre_names: ["Classic", "Coming-of-age"]
      filename: "The_Catcher_in_the_Rye.jpg"
    }
     {
      title: "The Adventures of Huckleberry Finn"
      author: "Mark Twain"
      genre_names: ["Classic", "Adventure"]
      filename: "The_Adventures_of_Hucklebery_Finn.jpg"
    }
     {
      title: "The Adventures of Tom Sawyer"
      author: "Mark Twain"
      genre_names: ["Classic", "Adventure"]
      filename: "The_Adventures_of_Tom_Sawyer.jpg"
    }
     {
      title: "The Lord of The Rings"
      author: "J.R.R Tolkien"
      genre_names: ["Fantasy", "Epic"]
      filename: "LOTR.jpg"
    }
     {
      title: "Animal Farm"
      author: "George Orwell"
      genre_names: ["Satire", "Dystopian"]
      filename: "Animal_farm.jpg"
    }
     {
      title: "Brave New World"
      author: "Aldous Huxley"
      genre_names: ["Dystopian", "Science Fiction"]
      filename: "Brave_New_World.jpg"
    }
     {
      title: "Fahrenheit 451"
      author: "Ray Bradbury"
      genre_names: ["Dystopian", "Science Fiction"]
      filename: "451,jpg"
    }
     {
      title: "Catch 22"
      author: "Joseph Heller"
      genre_names: ["Satire", "War Fiction"]
      filename: "Catch_22.jpg"
    }
     {
      title: "Crime and Punishment"
      author: "Fyodor Dostoevsky"
      genre_names: ["Classic", "Psychological Fictoin"]
      filename: "Crime_and_Punishment.jpg"
    }
     {
      title: "The Brothers Karamzov"
      author: "Fyodor Dostoevsky"
      genre_names: ["Classic", "Philosophical Fiction"]
      filename: "The_Brothers_Karamzov"
    }
     {
      title: "War and Peace"
      author: "Leo Tolstoy"
      genre_names: ["Classic", "Historical Fiction"]
      filename: "War_and_Peace.jpg"
    }
     {
      title: "Anna Karenina"
      author: "Leo Tolstoy"
      genre_names: ["Classic", "Romance"]
      filename: "Anna_Karenina.jpg"
    }
     {
      title: "The Grapes of Wrath"
      author: "John Steinbeck"
      genre_names: ["Classic", "Historical Fiction"]
      filename: "TGW.jpg"
    }
     {
      title: ""
      author: ""
      genre_names: [""]
      filename: ""
    }
   
  
  ]

  books.each do |attrs|
    book = Book.find_or_create_by!(
      title: attrs[:title],
      author: attrs[:author],
      genre: attrs[:genre]
    ) do |b|
      b.rating = rand(1..5)
      b.review = "There is not a review for this book, feel free to add one!"
    end

    book.genres = Genre.where(name: attrs[:genre_names]) #attach genres 

    # Attach cover image IF missing
    unless book.cover_image.attached?
      image_path = Rails.root.join("db", "seed_images", attrs[:filename])

      if File.exist?(image_path)
        book.cover_image.attach(
          io: File.open(image_path),
          filename: attrs[:filename]
        )
        puts "Attached #{attrs[:filename]} to #{book.title}"
      else
        puts "Missing file: #{image_path}"
      end
    end
  end

  puts "Default books seeded!"
end
