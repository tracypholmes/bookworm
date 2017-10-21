Product.destroy_all

25.times do |index|
  Product.create!(title: Faker::Book.unique.title,
                  author: Faker::Book.author,
                  description: Faker::Lorem.sentence(7, false, 0).chop,
                  isbn_13: Faker::Number.unique.number(13),
                  image_url: Faker::Placeholdit.image("60x70"),
                  price: Faker::Number.decimal(2)
                  )
end

p "So yah - created #{Product.count} books!"