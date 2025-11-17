# db/seeds.rb

if Rails.env.development? || Rails.env.test?
  if Book.count.zero?
    puts "Seeding default books..." # Adding default books to empty database

    books = [
      {
        title: "To Kill a Mockingbird",
        author: "Harper Lee",
        genre: "Fiction",
        cover_url: "https://example.com/to_kill_a_mockingbird.jpg"
      },
      {
        title: "1984",
        author: "George Orwell",
        genre: "Dystopian",
        cover_url: "https://example.com/1984.jpg"
      },
      {
        title: "Pride and Prejudice",
        author: "Jane Austen",
        genre: "Romance",
        cover_url: "https://example.com/pride_and_prejudice.jpg"
      },
      {
        title: "The Great Gatsby",
        author: "F. Scott Fitzgerald",
        genre: "Fiction",
        cover_url: "https://example.com/the_great_gatsby.jpg"
      },
      {
        title: "Moby-Dick",
        author: "Herman Melville",
        genre: "Adventure",
        cover_url: "https://example.com/moby_dick.jpg"
      }
    ]

    books.each do |book|
      Book.find_or_create_by!(
        title: book[:title],
        author: book[:author],
        genre: book[:genre]
      ) do |b|
        b.cover_url = book[:cover_url]
        b.rating = rand(1..5)
        b.review = "There is not a review for this book, feel free to add one!"
      end
    end

    puts "Default books seeded!"
  end
end
