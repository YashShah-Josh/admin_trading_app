# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end
# # Seeding Admin
# puts "Seeding started..."
# Admin.find_or_create_by!(email: "admin@example.com") do |admin|
#   admin.name = "Super Admin"
#   admin.password = "Admin@123"
#   admin.password_confirmation = "Admin@123"
#   admin.confirmed_at = Time.now
# end

# # Seeding Users
# User.find_or_create_by!(email: "user1@example.com") do |user|
#   user.name = "User One"
#   user.phone = "9876543210"
#   user.password_digest = BCrypt::Password.create("User@123")
# end

# User.find_or_create_by!(email: "user2@example.com") do |user|
#   user.name = "User Two"
#   user.phone = "9876543211"
#   user.password_digest = BCrypt::Password.create("User@123")
# end

# # Seeding Stocks (Example Indian Stocks)
# stocks = [
#   { symbol: "RELIANCE", company_name: "Reliance Industries", current_price: 2500.00, price_change: 5.00 },
#   { symbol: "TCS", company_name: "Tata Consultancy Services", current_price: 3500.50, price_change: -10.00 },
#   { symbol: "INFY", company_name: "Infosys", current_price: 1500.75, price_change: 3.50 },
#   { symbol: "HDFCBANK", company_name: "HDFC Bank", current_price: 1700.25, price_change: 2.25 }
# ]

# stocks.each do |stock_data|
#   Stock.find_or_create_by!(symbol: stock_data[:symbol]) do |stock|
#     stock.company_name = stock_data[:company_name]
#     stock.current_price = stock_data[:current_price]
#     stock.price_change = stock_data[:price_change]
#     stock.is_active = true
#   end
# end

# # Seeding Orders
# Order.find_or_create_by!(user_id: User.first.id, stock_id: Stock.first.id, order_type: "buy") do |order|
#   order.price = Stock.first.current_price
#   order.quantity = 10
#   order.status = "completed"
# end

# # Seeding Transactions
# Transaction.find_or_create_by!(user_id: User.first.id, stock_id: Stock.first.id, transaction_type: "buy") do |transaction|
#   transaction.price = Stock.first.current_price
#   transaction.quantity = 10
#   transaction.total_amount = transaction.price * transaction.quantity
#   transaction.executed_at = Time.now
# end

# puts "Seeding completed successfully!"
Admin.destroy_all
Stock.destroy_all
Order.destroy_all
Transaction.destroy_all
User.destroy_all
