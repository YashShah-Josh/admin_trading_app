# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed Admin
admin = Admin.find_or_create_by(email: "admin@example.com") do |a|
  a.name = "Super Admin"
  a.password = "password"
  a.password_confirmation = "password"
  a.confirmed_at = Time.now
end
puts "✅ Admin Seeded: #{admin.email}"

# Seed Users
users = [
  { name: "John Doe", email: "john@example.com", phone: "9876543210", pan: "ABCDE1234F", address: "Mumbai, India", balance: 50000.00 },
  { name: "Jane Doe", email: "jane@example.com", phone: "9876543211", pan: "ABCDE5678G", address: "Delhi, India", balance: 75000.00 },
  { name: "Rahul Sharma", email: "rahul@example.com", phone: "9876543212", pan: "ABCDE9012H", address: "Pune, India", balance: 100000.00 },
  { name: "Aisha Khan", email: "aisha@example.com", phone: "9876543213", pan: "ABCDE3456J", address: "Bangalore, India", balance: 65000.00 }
]

users.each do |user_data|
  user = User.find_or_create_by(email: user_data[:email]) do |u|
    u.name = user_data[:name]
    u.phone = user_data[:phone]
    u.pan = user_data[:pan]
    u.address = user_data[:address]
    u.balance = user_data[:balance]
    u.password = "password"
    u.password_confirmation = "password"
    u.confirmed_at = Time.now
  end
  puts "✅ User Seeded: #{user.email}"
end

# Seed Stocks
stocks = [
  { symbol: "RELIANCE", company_name: "Reliance Industries", current_price: 2500.50, price_change: -10.25 },
  { symbol: "TCS", company_name: "Tata Consultancy Services", current_price: 3500.75, price_change: 12.50 },
  { symbol: "INFY", company_name: "Infosys", current_price: 1600.25, price_change: 5.75 },
  { symbol: "HDFC", company_name: "HDFC Bank", current_price: 1520.30, price_change: -2.50 },
  { symbol: "WIPRO", company_name: "Wipro Ltd.", current_price: 800.75, price_change: 1.25 }
]

stocks.each do |stock_data|
  stock = Stock.find_or_create_by(symbol: stock_data[:symbol]) do |s|
    s.company_name = stock_data[:company_name]
    s.current_price = stock_data[:current_price]
    s.price_change = stock_data[:price_change]
  end
  puts "✅ Stock Seeded: #{stock.symbol}"
end

# Seed Orders
orders = [
  { user_email: "john@example.com", stock_symbol: "RELIANCE", order_type: "buy", quantity: 10 },
  { user_email: "jane@example.com", stock_symbol: "TCS", order_type: "sell", quantity: 5 },
  { user_email: "rahul@example.com", stock_symbol: "INFY", order_type: "buy", quantity: 20 },
  { user_email: "aisha@example.com", stock_symbol: "HDFC", order_type: "sell", quantity: 15 }
]

orders.each do |order_data|
  user = User.find_by(email: order_data[:user_email])
  stock = Stock.find_by(symbol: order_data[:stock_symbol])

  if user && stock
    order = Order.find_or_create_by(user: user, stock: stock, order_type: order_data[:order_type]) do |o|
      o.price = stock.current_price
      o.quantity = order_data[:quantity]
      o.status = "pending"
    end
    puts "✅ Order Seeded: #{order.order_type} #{order.quantity} shares of #{stock.symbol} for #{user.email}"
  end
end

# Seed Transactions
transactions = [
  { user_email: "john@example.com", stock_symbol: "RELIANCE", transaction_type: "buy", quantity: 10 },
  { user_email: "jane@example.com", stock_symbol: "TCS", transaction_type: "sell", quantity: 5 },
  { user_email: "rahul@example.com", stock_symbol: "INFY", transaction_type: "buy", quantity: 20 },
  { user_email: "aisha@example.com", stock_symbol: "HDFC", transaction_type: "sell", quantity: 15 }
]

transactions.each do |transaction_data|
  user = User.find_by(email: transaction_data[:user_email])
  stock = Stock.find_by(symbol: transaction_data[:stock_symbol])

  if user && stock
    transaction = Transaction.find_or_create_by(user: user, stock: stock, transaction_type: transaction_data[:transaction_type]) do |t|
      t.price = stock.current_price
      t.quantity = transaction_data[:quantity]
      t.total_amount = t.price * t.quantity
      t.executed_at = Time.now
    end
    puts "✅ Transaction Seeded: #{transaction.transaction_type} #{transaction.quantity} shares of #{stock.symbol} for ₹#{transaction.total_amount}"
  end
end
