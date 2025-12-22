# Assignment-2 (Conditionals and Loops)
# 	Write a Ruby program that simulates a very basic ATM.
# Start with a balance of 1056.254.
# Show a menu with options:
# 1. Check Balance
# 2. Deposit Money
# 3. Withdraw Money
# 4. Exit
# Use a loop so the menu keeps showing until the user chooses Exit.
# Use conditionals to handle each choice:
# If deposit → ask how much, add to balance.
# If withdraw → ask how much, subtract if enough balance, otherwise show "Insufficient funds!".
# If check balance → display current balance.
# If exit → end the loop with a goodbye message.

balance = 1056.254

loop do
  puts "ATM Menu"
  puts "1. Check Balance"
  puts "2. Deposit Money"
  puts "3. Withdraw Money"
  puts "4. Exit"
  print "Choose an option: "

  choice = gets.to_i

  if choice == 1
    puts "Your current balance is: #{balance}"

  elsif choice == 2
    print "Enter deposit amount: "
    deposit = gets.to_f
    balance += deposit
    puts "Deposit successful. New balance: #{balance}"

  elsif choice == 3
    print "Enter withdrawal amount: "
    withdraw = gets.to_f

    if withdraw <= balance
      balance -= withdraw
      puts "Withdrawal successful. New balance: #{balance}"
    else
      puts "Insufficient money!"
    end

  elsif choice == 4
    puts "Thank you for using the ATM. Goodbye!"
    break

  else
    puts "Invalid option! Please try again."
  end
end

