# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Seed data for products
products_data = [
  { name: 'Product 21', price: 5000.00, status: 'approved_queue', is_deleted: 0, approved_date: nil, request_date: Time.now },
  { name: 'Product 22', price: 8020.49, status: 'approved_queue', is_deleted: 0, approved_date: nil, request_date: Time.now  },
  { name: 'Product 23', price: 15.75, status: 'inprogress', is_deleted: 0, approved_date: nil, request_date: nil  },
  { name: 'Product 24', price: 6500.99, status: 'approved', is_deleted: 0, approved_date: 20-02-2024, request_date: nil  },
  { name: 'Product 25', price: 20.49, status: 'inprogress', is_deleted: 0, approved_date: nil, request_date: nil  },
  { name: 'Product 26', price: 5015.75, status: 'approved', is_deleted: 0, approved_date: 22-02-2024, request_date: Time.now   },
  { name: 'Product 27', price: 10.99, status: 'approved_queue', is_deleted: 1, approved_date: nil, request_date: Time.now  },
  { name: 'Product 28', price: 20.49, status: 'rejected', is_deleted: 0, approved_date: nil, request_date: Time.now  },
  { name: 'Product 29', price: 15.75, status: 'inprogress', is_deleted: 0, approved_date: nil, request_date: Time.now   },
  { name: 'Product 30', price: 15.75, status: 'deleted', is_deleted: 1, approved_date: nil, request_date: Time.now   },
  # Add more product data as needed
]

# Seed products
products_data.each do |product_data|
  Product.create!(product_data)
end
