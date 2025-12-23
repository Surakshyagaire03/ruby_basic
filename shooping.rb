# Assignment-2:
# Write a Ruby program that simulates a simple shopping cart system:
# Define a method add_item(cart, name, price, qty)
# Adds a hash {name:, price:, qty:} to the cart array.
# Define a method remove_item(cart, name)
# Removes an item by name.
# Define a method total_price(cart)
# Uses a block (map or inject) to calculate the total.
# Define a method show_cart(cart)
# Iterates with each to display items.
# Main program loop
# Ask the user for input:
# "add" → prompt for name, price, qty
# "remove" → prompt for name
# "show" → display cart
# "total" → show total price
# “exit” → exit


 #  methods = Add item to cart
def add_item(cart, name, price, qty)
  cart << { name: name, price: price, qty: qty }
  puts "#{name} added to cart."
end

# Remove item from cart
def remove_item(cart, name)
  cart.delete_if { |item| item[:name].downcase == name.downcase }
  puts "#{name} removed from cart."
end

# Show total price
def total_price(cart)
  total = cart.sum { |item| item[:price] * item[:qty] }
  puts "Total Price: RS.#{total}"
end

# Show items in cart
def show_cart(cart)
  if cart.empty?  #check if cart is empty
    puts "Cart is empty."
  else
    cart.each do |item|
      puts "#{item[:name]} - RS#{item[:price]} x #{item[:qty]} = RS#{item[:price]*item[:qty]}"
    end
  end
end

# Loop 
cart = []

loop do
  print "Enter command (add, remove, show, total, exit): "
  command = gets.chomp.downcase

  case command
  when "add"
    print "Item name: "; name = gets.chomp
    print "Price: "; price = gets.to_f
    print "Quantity: "; qty = gets.to_i
    add_item(cart, name, price, qty)

  when "remove"
    print "Item name to remove: "; name = gets.chomp
    remove_item(cart, name)

  when "show"
    show_cart(cart)

  when "total"
    total_price(cart)

  when "exit"
    puts "Thank you for shopping!"
    break

  else
    puts "Invalid command!"
  end
end
