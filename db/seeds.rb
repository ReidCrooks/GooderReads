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
        puts "⚠️ Missing file: #{image_path}"
      end
    end
  end

  puts "Default books seeded!"
end
