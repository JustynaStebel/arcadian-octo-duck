# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.find_or_create_by(email: 'admin@example.com')
admin.password = 'password'
admin.password_confirmation = 'password'
admin.save

product1 = Product.find_or_create_by(name: 'red shoes', description: 'Product 1', price: 50.0, active: true)
product1.image = Rails.root.join("app/assets/images/red_shoes.jpg").open
product1.save

product2 = Product.find_or_create_by(name: 'black shoes', description: 'Product 2', price: 60.0, active: true)
product2.image = Rails.root.join("app/assets/images/black_shoes.jpg").open
product2.save

product3 = Product.find_or_create_by(name: 'yellow shoes', description: 'Product 3', price: 120.0, active: true)
product3.image = Rails.root.join("app/assets/images/yellow_shoes.jpg").open
product3.save

order1 = Order.find_or_create_by( id: 1, subtotal: 12.00, total: 22.00, status: 1)
order1.save
order2 = Order.find_or_create_by( id: 2, subtotal: 102.00, total: 124.00, status: 2)
order2.save
order3 = Order.find_or_create_by( id: 3, subtotal: 100.00, total: 117.00, status: 3)
order3.save
